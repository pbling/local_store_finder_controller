import 'package:flutter/material.dart';
import 'package:local_store_finder_controller/register_store_page.dart';

class CouponDetailPage extends StatelessWidget {
  final String couponName;

  CouponDetailPage({required this.couponName});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('쿠폰정보'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(couponName)
                  ],
                ),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 수정 버튼 클릭 시 동작
                    // 상점 등록 페이지 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterStorePage()),
                    );
                  },
                  child: Text('수정'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 삭제 버튼 클릭 시 동작
                  },
                  child: Text('삭제'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
