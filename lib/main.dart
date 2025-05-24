
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlbase/sqlbase.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/feature/sales/presentation/forms/sales_form.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'feature/authentication/presentation/signin.dart';
import 'feature/authentication/presentation/signup.dart';
import 'feature/authentication/presentation/business_selection.dart';
import 'feature/dashboard/presentation/dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Sqlbase.initialize(url: "http://localhost/sqlbase.php", key: '123456');

  await Supabase.initialize(
    url: "https://eecfdatzqwpecvxyszqu.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVlY2ZkYXR6cXdwZWN2eHlzenF1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI5ODEyMzUsImV4cCI6MjA1ODU1NzIzNX0.EpVF7JeSY47DWiWRspR-3OGEC3PUU0lppFhDLCr6g_c",
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
         return GetMaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: WidgetStateColor.transparent,
                foregroundColor: Color(0xFF070707)

              ),
              useMaterial3: false
            ),
            title: 'Flutter App',
            initialRoute: '/sign_in',
            getPages: [
              GetPage(name: '/sign_in', page: () =>  const SignInScreen()),
              GetPage(name: '/sign_up', page: () =>  const SignUpScreen()),
              GetPage(name: '/store_selection', page: () =>  BusinessSelectionScreen()),
              GetPage(name: '/dashboard', page: () =>  MainDashboard()),
              GetPage(name: '/salesform', page: () =>  SalesForm()),
            ],
          );

  }
}


