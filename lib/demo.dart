// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'dart:io';

import 'package:dropbox_client/dropbox_client.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropbox/upload_file.dart';
import 'package:get/get.dart';

const String dropbox_clientId = 'demo_flutter';
const String dropbox_key = '4bmemzeycs7nl0c';
const String dropbox_secret = '9k47g29iwr6qo8a';


class DemoFileUpload extends StatefulWidget {
  const DemoFileUpload({Key? key}) : super(key: key);

  @override
  _DemoFileUploadState createState() => _DemoFileUploadState();
}

class _DemoFileUploadState extends State<DemoFileUpload> {

  //late List<File> files;
  late File file;

  void pickFile()async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path.toString());
      print(file);
    } else {
      // User canceled the picker
    }


    // FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    //
    // if (result != null) {
    //    files = result.paths.map((path) => File(path!)).toList();
    //   print(files);
    // } else {
    //   // User canceled the picker
    // }
  }
  UploadFile uploadFile=Get.put(UploadFile());
  @override
  void initState() {
    super.initState();

    initDropbox();
  }

  Future initDropbox() async {
    await Dropbox.init(dropbox_clientId, dropbox_key, dropbox_secret);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [

          TextButton(onPressed: (){

            pickFile();

          }, child: Text("Pick File")),

          TextButton(onPressed: (){

            if(file !=null){
              uploadFile.uploadFileDropBox(file);
            }


          }, child:  Text("upload File"))
        ],
      )),
    );
  }


}
