import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_first_example/ui/screens/list_guest_screen.dart';
import 'package:mobyte_first_example/ui/screens/my_home_page_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/my_home_page',
        routes: {
          '/my_home_page': (context) => const MyHomePageScreen(),
          '/list_guest':(context) => const ListGuestScreen(), 
        },
      ),
    );
  }
}
