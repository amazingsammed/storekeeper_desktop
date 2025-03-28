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
  var userStores= <UserStore>[].obs;
  var userBusiness= <UserBusiness>[].obs;

  Future<AuthResponse> signIn(Profile user) async {
    return await supabase.auth.signInWithPassword(
      email: user.email,
      password: user.password,
    );
  }

  Future<bool> addUserToDataBase(AuthResponse userinfo) async {
    try {
      var userx = userinfo.user!;
      var doc = await supabase
          .from('Users')
          .select()
          .eq('userid', userinfo.user!.id)
          .maybeSingle();
      if (doc==null) {

        Profile user = Profile(
            userid: userx.id,
            username: userx.userMetadata!['username'],
            email: userx.email.toString(),
            password: userx.userMetadata!['password']);
        var userdata = await profileRepository.save(user);
        userdata.fold((ifLeft) {
          return false;
        }, (data) {

        });
      }
      var userdata = await profileRepository.retrieve(userx.id);
      userdata.fold((ifLeft) {
        return false;
      }, (data) {
        currentProfile.value = data;
        return true;
      });
      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
 Future<List<UserBusiness>> getAllBusiness()async{
   userBusiness.clear();
    var data= await supabase.from('user_business').select().eq('userid',currentProfile.value.userid);
    for(var element in data){
      userBusiness.add(UserBusiness.fromMap(element));
    }
    return userBusiness.value;
  }

  Future<Business> getBusinessByID(String busid)async{
    List<Business> items=[];
    var data= await supabase.from('business').select().eq('busid',busid);
    for(var element in data){
      items.add(Business.fromMap(element));
    }
    return items[0];
  }



  getAllStores()async{
    var data= await supabase.from('userstore').select().eq('userid',currentProfile.value.userid);
    for(var element in data){
      userStores.add(UserStore.fromMap(element));
    }
    return userStores.value;
  }

  saveStore(Store store) async {
    await supabase.from('stores').insert(store.toMap());
    await supabase.from('userstore').insert(UserStore(userid: currentProfile.value.userid, storeid: store.storeid, status: 1, busid: '').toMap());
  }

 Future saveBusiness(Business business) async {
    await supabase.from('business').insert(business.toMap());
    await supabase.from('user_business').insert(UserBusiness(userid: currentProfile.value.userid, busid: business.busid, status: 1).toMap());
    await getAllBusiness();
  }

}
