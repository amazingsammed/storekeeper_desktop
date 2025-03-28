import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

final SupabaseQueryBuilder businessDB = supabase.from('business');
final SupabaseQueryBuilder storeDB = supabase.from('stores');
final SupabaseQueryBuilder userstoreDB = supabase.from('user_store');
final SupabaseQueryBuilder userbusinessDB = supabase.from('user_business');
