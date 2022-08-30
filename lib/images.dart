import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vs_code_flutter/save.dart';
import 'save.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:vs_code_flutter/mymap.dart';
import 'package:vs_code_flutter/report.dart';
import 'details.dart';
import 'dart:convert';

//fmf.infinityfreeapp.com
class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  //const HomeScreen({Key? key}) : super(key: key);
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  File? image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      //final imagePermanent = await saveFilePermanently(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('failed to pick image : $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report incident"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: 100,
                child: Text(
                  'Import images',
                  style: GoogleFonts.sora(color: Colors.black, fontSize: 25),
                )),
            SizedBox(height: 40),
            image != null
                ? Image.file(
                    image!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Text("Your image will be here"),
            SizedBox(height: 40),
            CustomButton(
              title: 'Pick from Gallery',
              icon: Icons.image_outlined,
              onClick: () => getImage(ImageSource.gallery),
            ),
            SizedBox(height: 40),
            CustomButton(
              title: 'Pick from Camera',
              icon: Icons.camera,
              onClick: () => getImage(ImageSource.camera),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //final a = Save();
          //a.submit();
          print("submit");
          submit();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 200,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(children: [
        Icon(icon),
        SizedBox(
          width: 20,
        ),
        Text(title)
      ]),
    ),
  );
}
