import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

final SupabaseQueryBuilder businessDB = supabase.from('business');
final SupabaseQueryBuilder storeDB = supabase.from('stores');
final SupabaseQueryBuilder userstoreDB = supabase.from('user_store');
final SupabaseQueryBuilder userbusinessDB = supabase.from('user_business');
final SupabaseQueryBuilder users = supabase.from('users');
final SupabaseQueryBuilder stockItemDB = supabase.from('stock_item');
final SupabaseQueryBuilder categoryDB = supabase.from('stock_item_category');
final SupabaseQueryBuilder groupDB = supabase.from('stock_item_group');
final SupabaseQueryBuilder unitDB = supabase.from('stock_item_unit');
final SupabaseQueryBuilder voucherDB = supabase.from('voucher');
