import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_store_finder_controller/login_page.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1280, 720),
      builder: (context, child) => MaterialApp(
        home: LoginPage(),  // 또는 기타 시작 페이지
      ),
    );
  }
}