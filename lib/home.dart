import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'maps.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 860;
    bool isScreen = MediaQuery.of(context).size.width >= 591;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                    tag:
                        "https://images.pexels.com/photos/924824/pexels-photo-924824.jpeg",
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          "https://images.pexels.com/photos/924824/pexels-photo-924824.jpeg",
                          fit: BoxFit.cover,
                        ))),
                //),
                Padding(
                  padding: EdgeInsets.only(top: 50.0, bottom: 5.0),
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                          isScreen ? "Welcome to Fix My City" : "Welcome",
                          style: GoogleFonts.sora(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0, bottom: 5.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Flex(
                      direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: 0.0, left: 0.0, top: 0.0, bottom: 5.0),
                          child: Center(
                            child: Text("Continue as a guest",
                                style: isScreen
                                    ? GoogleFonts.roboto(
                                        color: Colors.yellow,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)
                                    : GoogleFonts.roboto(
                                        color: Colors.yellow,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: 0.0, left: 0.0, top: 0.0, bottom: 5.0),
                          child: Container(
                              child: Text("Login or sign in",
                                  style: isScreen
                                      ? GoogleFonts.roboto(
                                          color: Colors.red,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)
                                      : GoogleFonts.roboto(
                                          color: Colors.red,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70.0, bottom: 5.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Flex(
                      direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: isScreenWide
                              ? const EdgeInsets.only(
                                  left: 20.0,
                                  right: 15.0,
                                  top: 18.0,
                                  bottom: 0.0)
                              : const EdgeInsets.only(
                                  left: 20.0,
                                  right: 15.0,
                                  top: 18.0,
                                  bottom: 0.0),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) => Map()));
                                  print('it is me');
                                },
                                child: Text(
                                  'See reports',
                                  style: GoogleFonts.sora(
                                      color: Colors.black, fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: isScreenWide
                              ? const EdgeInsets.only(
                                  left: 20.0,
                                  right: 15.0,
                                  top: 18.0,
                                  bottom: 0.0)
                              : const EdgeInsets.only(
                                  left: 20.0,
                                  right: 15.0,
                                  top: 18.0,
                                  bottom: 0.0),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => LoginScreen()));
                                  print('hello');
                                },
                                child: Text(
                                  'Click here',
                                  style: GoogleFonts.sora(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            /* Container(
              alignment: Alignment.center,
              child: Flex(
                direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: 0.0, left: 0.0, top: 0.0, bottom: 0.0),
                    child: Container(
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.home,
                            color: Colors.red,
                          ),
                          Text("Simplified Complaints",
                              style: GoogleFonts.roboto(
                                  color: Colors.blue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 0.0, left: 0.0, top: 0.0, bottom: 0.0),
                    child: Container(
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.person_solid,
                            color: Colors.red,
                          ),
                          Text("No Queues and Delays",
                              style: GoogleFonts.roboto(
                                  color: Colors.blue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 0.0, left: 0.0, top: 0.0, bottom: 0.0),
                    child: Container(
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.time_solid,
                            color: Colors.red,
                          ),
                          Text("Quick Response",
                              style: GoogleFonts.roboto(
                                  color: Colors.blue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                color: Colors.deepOrangeAccent,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                      child: Center(
                          child: Text("About us",
                              style: GoogleFonts.sora(
                                  color: Colors.black87,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5.0, bottom: 5.0, right: 40.0, left: 40.0),
                      child: Center(
                          child: Text(
                              "Applications for smart cities and IoTs have attracted a wide market over the past decades and their appeal may be further enhanced through automated tools and analytics. In the upcoming generation of IoT systems analytics and interfacing with the end user will be essential for affective reporting of issues in real time. This project will combine user interfacing applications and analytics to allow reporting of issues in smart cities. Among other methods and tools a mobile application will be designed and developed to allow the user to report an issue, tag the geolocation, upload text and photos. Other users should be able to see related posts either in the local area or by performing a query. As a result both the frontend and the backend should be available.",
                              style: GoogleFonts.sora(
                                  color: Colors.black87, fontSize: 17))),
                    ),
                  ],
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
