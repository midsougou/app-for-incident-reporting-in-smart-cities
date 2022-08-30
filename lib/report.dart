import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vs_code_flutter/save.dart';
import 'details.dart';
import 'save.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

late String sev;

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Report incident"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  child: Text(
                    'Select Severity',
                    style: GoogleFonts.sora(color: Colors.black, fontSize: 25),
                  )),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 129, 9, 0),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                  
                    sev = 'High';
                  },
                  child: Text(
                    'High',
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
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    sev = 'Medium';
                  },
                  child: Text(
                    'Medium',
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
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
        
                    sev = 'Normal';
                  },
                  child: Text(
                    'Normal',
                    style: GoogleFonts.sora(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('go to next page');
              
              print(sev);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Details()));
            },
            child: Icon(Icons.arrow_forward)));
  }
}
