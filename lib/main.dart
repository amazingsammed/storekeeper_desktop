
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlbase/sqlbase.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'feature/authentication/presentation/signin.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Sqlbase.initialize(url: "http://localhost/sqlbase.php", key: '123456');


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
            home: SignInScreen(),
          );

  }
}


