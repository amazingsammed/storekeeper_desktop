import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:storekepper_desktop/dashboard.dart';
import 'package:storekepper_desktop/feature/sales/presentation/forms/sales_form.dart';
import 'package:flutter/material.dart';
import 'feature/authentication/presentation/signin.dart';
import 'feature/authentication/presentation/signup.dart';
import 'feature/authentication/presentation/store_selection.dart';
import 'feature/dashboard/presentation/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: DashBoardwithTabs(),
    // );
        return FluentApp(
          home: GetMaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: WidgetStateColor.transparent,
                foregroundColor: Color(0xFF070707)

              ),
              useMaterial3: false
            ),
            title: 'Flutter App',
            initialRoute: '/dashboard',
            getPages: [
              GetPage(name: '/sign_in', page: () => FluentApp(home: SignInScreen())),
              GetPage(name: '/sign_up', page: () => FluentApp(home: SignUpScreen())),
              GetPage(name: '/store_selection', page: () => FluentApp(home: StoreSelectionScreen())),
              GetPage(name: '/dashboard', page: () => FluentApp(home: DashboardScreen())),
              GetPage(name: '/salesform', page: () => FluentApp(home: SalesForm())),
            ],
          ),
        );

  }
}


