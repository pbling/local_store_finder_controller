import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_store_finder_controller/news_detail_page.dart';
import 'package:local_store_finder_controller/store_detail_page.dart';


class ManageNewsPage extends StatefulWidget {
  @override
  _ManageNewsPageState createState() => _ManageNewsPageState();
}

class _ManageNewsPageState extends State<ManageNewsPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _newsList = [];

  void getNewsByKeyword(String keyword) {
    // 카테고리로 검색해서 상점 반환
    _newsList = ['News 1', 'News  2', 'News  3', 'News  4'];

    setState(()
    {_newsList = _newsList.where((store) => store.contains(keyword)).toList();
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
                  getNewsByKeyword(_searchController.text);
                },
                child: Text('소식검색'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _newsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_newsList[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsDetailPage(newsName : _newsList[index])),
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
