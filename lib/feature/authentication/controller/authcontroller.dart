import 'package:get/get.dart';
import 'package:sqlbase/sqlbase.dart';
import 'package:storekepper_desktop/feature/authentication/businessinfo.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/business.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/profile.dart';
import 'package:storekepper_desktop/feature/authentication/domain/repositories/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/repositories/profile_repository_impl.dart';
import '../domain/model/store.dart';
import '../domain/model/user_business.dart';
import '../domain/model/user_store.dart';

AuthController authController = AuthController.instance;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final supabase = Supabase.instance.client;
  ProfileRepository profileRepository = ProfileRepositoryImpl();

  var currentProfile = Profile
      .empty()
      .obs;
  var selectedBusiness = <Business>[].obs;
  var selectedStore = <Store>[].obs;
  var userStores = <UserStore>[].obs;
  var userBusiness = <UserBusiness>[].obs;

  var storemembers = [].obs;
  Sqlbase mydb = Sqlbase();

  Future <Profile?> signIn(Profile user) async {
    //print()
    SqlBaseResponse response = await mydb.auth('user').signIn(
        email: user.email, password: user.password);
    print(response.data);
    if (response.statusCode == 0) return null;
    currentProfile.value = Profile.fromMap(response.data['data']);
    return currentProfile.value;
  }

  Future<Profile?> signUp(Profile user) async {
    SqlBaseResponse response = await mydb.auth('users').signUp(
        email: user.email, password: user.password, data: {
      "username": user.username
    }
    );
    if (response.statusCode == 0) return null;
    currentProfile.value = Profile.fromMap(response.data);
    return currentProfile.value;
  }

  Business get myBusiness => selectedBusiness.value[0];

  Store get myStore => selectedStore.value[0];

  var loading = false.obs;


  Future<List<UserBusiness>> getAllBusiness() async {
    userBusiness.clear();
    var data = await supabase
        .from('user_business')
        .select()
        .eq('userid', currentProfile.value.userid);
    for (var element in data) {
      userBusiness.add(UserBusiness.fromMap(element));
    }
    return userBusiness.value;
  }

  Future<Business> getBusinessByID(String busid) async {
    List<Business> items = [];
    var data = await supabase.from('business').select().eq('busid', busid);
    for (var element in data) {
      items.add(Business.fromMap(element));
    }
    return items[0];
  }

  Future<Store> getStoreByID(String id) async {
    List<Store> items = [];
    try {
      var data = await supabase.from('stores').select().eq('storeid', id);
      for (var element in data) {
        items.add(Store.fromMap(element));
      }
      return items[0];
    } catch (e) {
      print(e);
      return items[0];
    }
  }

  getAllStoresbyBusinessID(String item) async {
    userStores.clear();
    try {
      var data = await mydb.table('user_store')
          .where('busid', isEqualTo: item)
          .where('userid', isEqualTo: currentProfile.value.userid)
          .get();
      // var data = await supabase
      //     .from('user_store')
      //     .select()
      //     .eq('userid', currentProfile.value.userid)
      //     .eq("busid", item);
      for (var element in data.data['data']) {
        userStores.add(UserStore.fromMap(element));
      }
    } catch (e) {
      print(e);
    }
  }

  Future getUsersInStore() async {
    storemembers.clear();
    try {
      var data = await supabase
          .from('user_store')
          .select()
          .eq('storeid', selectedStore.value[0].storeid)
          .eq("busid", appbusiness.busid);
      print(data);
      for (var element in data) {
        var data = await supabase.from('users').select().eq(
            'userid', element['userid']);
        storemembers.add(data[0]);
      }
      return storemembers;
    } catch (e) {
      return storemembers;
    }
  }

  saveStore(Store store) async {
    await supabase.from('stores').insert(store.toMap());
    await supabase.from('user_store').insert(UserStore(
        userid: currentProfile.value.userid,
        storeid: store.storeid,
        status: "active",
        role: 'admin',
        busid: store.busid)
        .toMap());
    await getAllStoresbyBusinessID(store.busid);
  }

  Future saveBusiness(Business business) async {
    await supabase.from('business').insert(business.toMap());
    await supabase.from('user_business').insert(UserBusiness(
        userid: currentProfile.value.userid,
        busid: business.busid,
        status: 1)
        .toMap());
    await getAllBusiness();
  }


}
