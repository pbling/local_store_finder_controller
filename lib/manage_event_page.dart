import 'package:flutter/material.dart';
import 'package:local_store_finder_controller/event_detail_page.dart';
import 'package:local_store_finder_controller/story_detail_page.dart';

class ManageEventPage extends StatefulWidget {
  @override
  _ManageEventPageState createState() => _ManageEventPageState();
}

class _ManageEventPageState extends State<ManageEventPage> {
  List<String> _eventList = []; // 이야기 리스트

  void getAllEvents() {
    // 데이터베이스에서 이야기 리스트를 가져오는 로직을 여기에 추가할 수 있습니다.
    setState(() {
      _eventList = ['event 1', 'event 2', 'event 3']; // 임시로 이야기 리스트에 데이터 추가
    });
  }

  @override
  void initState() {
    super.initState();
    getAllEvents(); // initState에서 이야기 리스트를 가져옵니다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이야기 관리'),
      ),
      body: ListView.builder(
        itemCount: _eventList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_eventList[index]),
            onTap: () {
              // 이야기 클릭 시 상세 페이지로 이동합니다.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailPage(eventName: _eventList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
