import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:vs_code_flutter/mymap.dart';
import 'package:vs_code_flutter/report.dart';
import 'details.dart';



class Save {

  void submit() async {
    var url =
        "https://turning-writer.000webhostapp.com/login_flutter/submit.php";

    //print(day);
    var data = {
      "severity": sev,
      "category": dropdown,
      "day": d,
      "summary": summary,
      "details": details,
      "lat": positionmarker.latitude.toString(),
      "lng": positionmarker.longitude.toString()
    };

    //print(sev);
    var res = await http.post(Uri.parse(url),
        body: data, headers: {"Access-Control-Allow-Origin": "*"});
    if (json.decode(res.body).toString() == "request submitted") {
      Fluttertoast.showToast(
          msg: "the request was submitted thank you",
          toastLength: Toast.LENGTH_SHORT);
    }
  }
}
