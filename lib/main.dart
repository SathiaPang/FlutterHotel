import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/view/satya/Forgot_password_screen.dart';
import 'package:hotel/view/splashScreen/loading1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        // home: const SplashScreen());
        home: ForgotPasswordScreen());
  }
}
