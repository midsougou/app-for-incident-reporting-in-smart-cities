import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mymap.dart';
import 'save.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  //const HomeScreen({Key? key}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

late String d;

String dropdown = "blocked drainage gullies";
late String details;
late String summary;

class _DetailsState extends State<Details> {
  String _dropdownValue = "blocked drainage gullies";

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  DateTime date = DateTime(2022, 07, 02);

  final _summarycontroller = TextEditingController();

  final _detailscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Report incident"),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  height: 50,
                  child: Text(
                    "Choose a category",
                    style: GoogleFonts.sora(color: Colors.black, fontSize: 25),
                  )),
              DropdownButton(
                items: const [
                  DropdownMenuItem(
                    child: Text("blocked drainage gullies"),
                    value: "blocked drainage gullies",
                  ),
                  DropdownMenuItem(
                    child: Text("bus stops"),
                    value: "bus stops",
                  ),
                  DropdownMenuItem(
                    child: Text("car parking"),
                    value: "car parking",
                  ),
                  DropdownMenuItem(
                    child: Text("footpaths"),
                    value: "footpaths",
                  ),
                  DropdownMenuItem(
                    child: Text("parks"),
                    value: "parks",
                  ),
                  DropdownMenuItem(
                    child: Text("road traffic signs"),
                    value: "road traffic signs",
                  ),
                  DropdownMenuItem(
                    child: Text("rubbish"),
                    value: "rubbish",
                  ),
                  DropdownMenuItem(
                    child: Text("street cleaning"),
                    value: "street cleaning",
                  ),
                  DropdownMenuItem(
                    child: Text("street lighting"),
                    value: "street lighting",
                  ),
                  DropdownMenuItem(
                    child: Text("traffic lights"),
                    value: "traffic lights",
                  ),
                  DropdownMenuItem(
                    child: Text("trees"),
                    value: "trees",
                  ),
                  DropdownMenuItem(
                    child: Text("others"),
                    value: "others",
                  ),
                ],
                value: _dropdownValue,
                onChanged: dropdownCallback,
                borderRadius: BorderRadius.circular(20),
                style: GoogleFonts.sora(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                  height: 30,
                  child: Text(
                    "Select day of the incident",
                    style: GoogleFonts.sora(color: Colors.black, fontSize: 25),
                  )),
              SizedBox(
                height: 30,
              ),
              TextButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    if (newDate == null) return;
                    setState(() {
                      date = newDate;
                    });
                  },
                  child: Text(
                    '${date.year}/${date.month}/${date.day}',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
                child: Text("Summary of the incident",
                    style: GoogleFonts.sora(color: Colors.black, fontSize: 25)),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _summarycontroller,
                decoration: InputDecoration(
                  hintText: "Tell us about it",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
                child: Text("Details of the incident",
                    style: GoogleFonts.sora(color: Colors.black, fontSize: 25)),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _detailscontroller,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Give details",
                  border: OutlineInputBorder(),
                ),
              ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              dropdown = _dropdownValue;

              print('go to next page2');
              print(dropdown);
              d = '${date.year}/${date.month}/${date.day}';
              print(d);
              setState(() {
                summary = _summarycontroller.text;
                details = _detailscontroller.text;
                print(summary);
                print(details);
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Mapspage()));
            },
            child: Icon(Icons.arrow_forward)));
  }
}
