import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Read extends StatefulWidget {
  const Read({Key? key}) : super(key: key);

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  List request = [];

  getrequest() async {
    var url =
        "https://turning-writer.000webhostapp.com/login_flutter/showrequest.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        request = json.decode(response.body);
      });
    
      return request;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("All the requests"),
          backgroundColor: Colors.amber,
        ),
        body: ListView.builder(
            itemCount: request.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(request[index]['category']),
                title: Text(request[index]['summary']),
                subtitle: Text(request[index]['details']),
              );
            }));
  }
}
