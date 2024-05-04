import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_store_finder_controller/store_detail_page.dart';


class ManageStorePage extends StatefulWidget {
  @override
  _ManageStorePageState createState() => _ManageStorePageState();
}

class _ManageStorePageState extends State<ManageStorePage> {
  String? _selectedMainCategory;
  TextEditingController _searchController = TextEditingController();
  List<String> _mainCategories = ['전체', '레스토랑', '카페', '식료품', '상점']; // 대분류 데이터
  List<String> _storeList = []; // 상점 리스트

  void getStoreByCategory() {
    // 카테고리로 검색해서 상점 반환
    setState(() {
      // 임시로 상점 리스트에 데이터 추가
      _storeList = ['Store 1', 'Store 2', 'Store 3', 'Store4'];
    });
  }

  void searchStore(String keyword) {
    // 키워드 검색해서 상점 반환

    _storeList = ['Store 1', 'Store 2', 'Store 3', 'Store4'];

    setState(() {
      _storeList = _storeList.where((store) => store.contains(keyword)).toList();
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
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedMainCategory,
                  onChanged: (value) {
                    setState(() {
                      _selectedMainCategory = value;
                      getStoreByCategory();
                    });
                  },
                  items: _mainCategories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  hint: Text('Select Main Category'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  searchStore(_searchController.text);
                },
                child: Text('상점검색'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _storeList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_storeList[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StoreDetailPage(storeName: _storeList[index])),
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
