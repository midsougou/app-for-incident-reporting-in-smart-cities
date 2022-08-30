import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:vs_code_flutter/read.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(51.39, -0.28);

  List<Marker> _marker = [];
  final List<Marker> _list = [];
  List request = [];
  
  getmarkers() async {
    var url =
        "https://turning-writer.000webhostapp.com/login_flutter/showrequest.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        request = json.decode(response.body);
      });

      int i = 0;
      
      while (i < request.length) {

        
        double latitude = double.parse(request[i]['lat']);
        double longitude = double.parse(request[i]['lng']);
        LatLng locationmar = new LatLng(latitude, longitude);
        var m = Marker(
          markerId: MarkerId(request[i]['id']),
          position: locationmar,
          infoWindow:  InfoWindow(
            title: request[i]['summary'] +  "\n" + "Severity : " + request[i]['severity'] + " \n" + "Category :  " + request[i]['category'] + " - " + request[i]['day'],
            snippet: request[i]['details'],
            
          ),
          icon: BitmapDescriptor.defaultMarker,
        
          /* onTap: () {
            ListTile(
                leading: Text(request[i]['category']),
                title: Text(request[i]['summary']),
                subtitle: Text(request[i]['details']),
              );

          } */
        );
        _list.add(m);
        i = i + 1;
      }
    }
  }

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_marker.addAll(_list);
    getmarkers();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('See other reports '),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            mapType: _currentMapType,
            markers: Set<Marker>.of(_list),
            onCameraMove: _onCameraMove,
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: _onMapTypeButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.map, size: 36.0),
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              )),
          Builder(
            builder: (context) => Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text("See all reports", style: GoogleFonts.sora(color: Colors.white, fontSize: 25),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                ),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new Read()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

/* class SecondScreen extends StatelessWidget {
  List requests = List();
  Future getrequests() async {
    var url =
        "https://turning-writer.000webhostapp.com/login_flutter/showrequest.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState((){

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Tell us more info about your request"),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
          future: getrequests(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Object? list = snapshot.data;
                    return ListTile(title: Text(list.toString()));
                  });
            }
            Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
} */
