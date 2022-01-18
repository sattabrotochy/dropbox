

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class UploadFile extends GetxController{






  uploadFileDropBox(path)async{



    final msg = jsonEncode({
      "path": "$path",
      "property_groups": [
        {
          "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa",
          "fields": [
            {
              "name": "Security Policy",
              "value": "Confidential"
            }
          ]
        }
      ]
    });

    Map<String,String> headers = {'Content-Type': 'application/json',
      'Authorization': 'Bearer sl.BAUdccB4_mou-hydq1BbRoq0BcpJD05RoHAEUaa229sz32PtbabGmnwQUQG85xcrH31KKUfSuV3YJcSZCNzBjyfZPA8OsuRs_DXDJn7-KWqgLdf7BSUlHagSrStIsAsU6am_j09kYghv',};
    // final msg = jsonEncode({
    //   "shared_folder_id": "84528192421",
    //   "members": [
    //     {
    //       "member": {
    //         ".tag": "email",
    //         "email": "justin@example.com"
    //       },
    //       "access_level": "editor"
    //     },
    //     {
    //       "member": {
    //         ".tag": "dropbox_id",
    //         "dropbox_id": "dbid:AAEufNrMPSPe0dMQijRP0N_aZtBJRm26W4Q"
    //       },
    //       "access_level": "viewer"
    //     }
    //   ],
    //   "quiet": false,
    //   "custom_message": "Documentation for launch day"
    // });


    const url="https://api.dropboxapi.com/2/files/properties/add";
    final response=await http.post(Uri.parse(url),

      headers: headers,
      body:msg

    );

    print(response.statusCode);
    log("response ${response.body}");



  }




}