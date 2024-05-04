import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'coupon_detail_page.dart';


class ManageCouponPage extends StatefulWidget {
  @override
  _ManageCouponPageState createState() => _ManageCouponPageState();
}

class _ManageCouponPageState extends State<ManageCouponPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _couponList = []; // 상점 리스트

  void getCouponByKeyword(String keyword) {
    // 카테고리로 검색해서 상점 반환
    _couponList = ['coupon1', 'coupon2', 'coupon3', 'coupon4'];

    setState(()
    {_couponList = _couponList.where((store) => store.contains(keyword)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상점관리'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 500.w,
                height: 50.h,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 20.h),
              ElevatedButton(
                onPressed: () {
                  getCouponByKeyword(_searchController.text);
                },
                child: Text('쿠폰검색'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _couponList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_couponList[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CouponDetailPage(couponName : _couponList[index])),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
