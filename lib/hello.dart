import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'report.dart';
import 'maps.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hi there"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    print('report incidents clicked');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Report()));
                  },
                  child: Text(
                    'Report an incident',
                    style: GoogleFonts.sora(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 300,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    print('see others reports clicked');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) =>  Map()));
                  },
                  child: Text(
                    'See other reports',
                    style: GoogleFonts.sora(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
