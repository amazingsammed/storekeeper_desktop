import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/business.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/profile.dart';
import 'package:storekepper_desktop/feature/authentication/domain/repositories/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/repositories/profile_repository_impl.dart';
import '../domain/model/store.dart';
import '../domain/model/user_business.dart';
import '../domain/model/user_store.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;
  ProfileRepository profileRepository = ProfileRepositoryImpl();

  var currentProfile = Profile.empty().obs;
  var selectedBusiness = <Business>[].obs;
  var selectedStore = <Store>[].obs;
  var userStores = <UserStore>[].obs;
  var userBusiness = <UserBusiness>[].obs;

  Future<AuthResponse> signIn(Profile user) async {
    return await supabase.auth.signInWithPassword(
      email: user.email,
      password: user.password,
    );
  }

  Business get myBusiness => selectedBusiness.value[0];

  Store get myStore => selectedStore.value[0];

  var loading = false.obs;

  Future<bool> addUserToDataBase(AuthResponse userinfo) async {
    try {
      var userx = userinfo.user!;
      var doc = await supabase
          .from('users')
          .select()
          .eq('userid', userinfo.user!.id)
          .maybeSingle();
      if (doc == null) {
        Profile user = Profile(
            userid: userx.id,
            username: userx.userMetadata!['username'],
            email: userx.email.toString(),
            password: userx.userMetadata!['password']);
        var userdata = await profileRepository.save(user);
        userdata.fold((ifLeft) {
          return false;
        }, (data) {});
      }
      var userdata = await profileRepository.retrieve(userx.id);
      userdata.fold((ifLeft) {
        return false;
      }, (data) {
        print("userdata0" + data.toString());
        currentProfile.value = data;
        return true;
      });
      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }

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
      var data = await supabase
          .from('user_store')
          .select()
          .eq('userid', currentProfile.value.userid)
          .eq("busid", item);
      for (var element in data) {
        userStores.add(UserStore.fromMap(element));
      }
    } catch (e) {
      print(e);
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
