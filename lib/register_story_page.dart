import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterStoryPage extends StatefulWidget {
  const RegisterStoryPage({Key? key}) : super(key: key);

  @override
  _RegisterStoryPageState createState() => _RegisterStoryPageState();
}

class _RegisterStoryPageState extends State<RegisterStoryPage> {

  String showFileName = "";
  Color defaultColor = Colors.grey[400]!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이야기등록'),
      ),
      body: Container(
        height: 500.w,
        width: 400.h,
        decoration: BoxDecoration(
          border: Border.all(width: 5, color: defaultColor,),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg'],
                );
                if( result != null && result.files.isNotEmpty ){
                  String fileName = result.files.first.name;
                  Uint8List fileBytes = result.files.first.bytes!;
                  debugPrint(fileName);
                  setState(() {
                    showFileName = "Now File Name: $fileName";
                  });
                  /*
                do jobs
                 */
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Find and Upload", style: TextStyle(fontWeight: FontWeight.bold, color: defaultColor, fontSize: 20,),),
                  Icon(Icons.upload_rounded, color: defaultColor,),
                ],
              ),
            ),
            Text("(*.csv)", style: TextStyle(color: defaultColor,),),
            const SizedBox(height: 10,),
            Text(showFileName, style: TextStyle(color: defaultColor,),),
          ],
        ),
      ),
    );
  }
}