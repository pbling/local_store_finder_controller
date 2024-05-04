import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_store_finder_controller/manage_coupon_page.dart';
import 'package:local_store_finder_controller/manage_event_page.dart';
import 'package:local_store_finder_controller/manage_news_page.dart';
import 'package:local_store_finder_controller/manage_store_page.dart';
import 'package:local_store_finder_controller/register_coupon_page.dart';
import 'package:local_store_finder_controller/register_event_page.dart';
import 'package:local_store_finder_controller/register_news_page.dart';
import 'package:local_store_finder_controller/register_store_page.dart';
import 'package:local_store_finder_controller/register_story_page.dart';

import 'manage_story_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('관리자메뉴'),
      ),
      body: Container(
        width: 800.w,
        height: 800.h,
        padding: EdgeInsets.symmetric(vertical: 80.w, horizontal: 50.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildMenuButton(context, '상점등록', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterStorePage()),
                  );
                }),
                SizedBox(width: 30.w),
                _buildMenuButton(context, '상점보기', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageStorePage()),
                  );
                }),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                _buildMenuButton(context, '쿠폰등록', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterCouponPage()),
                  );
                }),
                SizedBox(width: 30.w),
                _buildMenuButton(context, '쿠폰보기', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageCouponPage()),
                  );
                }),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                _buildMenuButton(context, '소식등록', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterNewsPage()),
                  );
                }),
                SizedBox(width: 30.w),
                _buildMenuButton(context, '소식보기', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageNewsPage()),
                  );
                }),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                _buildMenuButton(context, '이야기등록', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterStoryPage()),
                  );
                }),
                SizedBox(width: 30.w),
                _buildMenuButton(context, '이야기보기', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageStoryPage()),
                  );
                }),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                _buildMenuButton(context, '이벤트등록', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterEventPage()),
                  );
                }),
                SizedBox(width: 30.w),
                _buildMenuButton(context, '이벤트보기', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageEventPage()),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Container(
          alignment: Alignment.center,
          width: 200.w,
          height: 40.h,
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),),
        ),
      ),
    );
  }
}
