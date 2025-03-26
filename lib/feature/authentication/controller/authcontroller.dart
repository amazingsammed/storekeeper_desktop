import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/profile.dart';
import 'package:storekepper_desktop/feature/authentication/domain/repositories/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/repositories/profile_repository_impl.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;
  ProfileRepository profileRepository = ProfileRepositoryImpl();

  var currentProfile = Profile.empty().obs;

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
      print(doc);
      if (doc==null) {

        Profile user = Profile(
            userid: userx.id,
            username: userx.userMetadata!['username'],
            email: userx.email.toString(),
            password: userx.userMetadata!['password']);
        print(user.toMap());
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
}
