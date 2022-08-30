import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'images.dart';
import 'save.dart';

class Mapspage extends StatefulWidget {
  @override
  _MapspageState createState() => _MapspageState();
}
late LatLng positionmarker;

class _MapspageState extends State<Mapspage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(51.39, -0.28);
  

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          draggable: true,
          /* infoWindow: InfoWindow(
            title: 'Issue concerning ligting ',
            snippet:
                'There is an issue regarding this place about lights during night',
          ), */
          icon: BitmapDescriptor.defaultMarker,
          onDragEnd: ((LatLng newPosition) {
            print(newPosition.latitude.toString());
            print(newPosition.longitude.toString());
            positionmarker = newPosition;
          })));
    });
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
          title: Text('Report incident '),
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
              markers: _markers,
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
                      FloatingActionButton(
                        heroTag: null,
                        onPressed: _onAddMarkerButtonPressed,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: Colors.blue,
                        child: const Icon(Icons.add_location, size: 36.0),
                      ),
                    ],
                  ),
                )),
            Builder(
              builder: (context) => Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: Text("Add maker"),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 156, 93, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      textStyle:
                          GoogleFonts.sora(color: Colors.white, fontSize: 25)),
                  onPressed: () {
                    /* Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SecondScreen())); */
                    print(positionmarker);
                  },
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('go to next page3');
              
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Images()));
            },
            child: Icon(Icons.arrow_forward)));
  }
}
