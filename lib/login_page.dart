import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'menu_page.dart';



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
            child: Text(
              '동네곳곳 관리자 페이지',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
          ),
          toolbarHeight: 100.h,
        ),
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _managerIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;

  void _login() {
    // 여기서는 간단하게 로그인이 완료되었다고 가정합니다.
    setState(() {
      _isLoggedIn = true;
    });


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MenuPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80.w, horizontal: 50.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '아이디를 입력하세요.',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 400.w,
            height: 50.h,
            child: TextField(
            controller: _managerIdController,
            decoration: InputDecoration(
              labelText: '아이디',
            ),
          ),),

          SizedBox(height: 20.h),
          Text(
            '비밀번호를 입력하세요.',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 400.w,
            height: 50.h,
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 40.h),
          Container(
            width: 400.w,
            height: 30.h,
            child: ElevatedButton(
              onPressed: () {
                String username = _managerIdController.text;
                String password = _passwordController.text;

                // 아이디와 비밀번호를 서버로 전송하여 인증 로직 수행
                print('아이디: $username, 비밀번호: $password');

                _login();
              },
              child: Text('로그인',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _managerIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}