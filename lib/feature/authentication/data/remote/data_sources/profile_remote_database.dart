

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/model/profile.dart';

abstract class ProfileRemoteDatabase {
  /// Saves the [Profile] to the remote database
  Future<void> save(Profile profile);

  /// Retrieves the [Profile] from the remote database
  Future<Profile> retrieve(String id);

  /// Deletes the [Profile] from the remote database
  Future<void> delete(String id);

  /// Updates the [Profile] to the remote database
  Future<Profile> update(Profile profile);

  /// Checks if the [Profile] exists in the remote database
  Future<bool> exists(String id);
}

class ProfileRemoteDatabaseImpl implements ProfileRemoteDatabase {
  final supabase = Supabase.instance.client;
  @override
  Future<void> save(Profile profile) async {
   var results= await supabase
        .from('Users')
        .insert(profile.toMap());
  }

  @override
  Future<Profile> retrieve(String id) async {
    final results = await supabase.from('Users').select().eq('userid',id).maybeSingle();
    return Profile.fromMap(results!);
  }

  @override
  Future<void> delete(String id) async {
    await supabase.from('Users').select();
  }

  @override
  Future<Profile> update(Profile profile) async {
    // await FirebaseFirestore.instance
    //     .collection('profiles')
    //     .doc(profile.id)
    //     .set(profile.toJson(), SetOptions(merge: true));
    return Profile.empty();
  }

  @override
  Future<bool> exists(String id) async {
    // final results = await FirebaseFirestore.instance.collection('profiles').doc(id).get();
    return true;
  }
}
