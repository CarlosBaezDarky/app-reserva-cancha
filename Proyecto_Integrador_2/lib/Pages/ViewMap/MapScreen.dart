import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';


import '../../utils/blocClass.dart';
import '../../utils/code2.dart';
import 'dart:developer' as developer;


const darkBlueColor = Color(0xff486579);

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {

  Code2 cd = new Code2();

  String titulo = 'Geo. Cancha';
  static const _initCameraPosition = CameraPosition(target:
  LatLng(18.735693, -70.162651),
      zoom: 9.5);

  Marker? _markers;

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  String _lat = '';
  String _log = '';

  var locationMsg;
  late final Position lastPosition;

  Future<void> _goToCurrentPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lastPosition.latitude, lastPosition.longitude), 19.151926040649414));
  }

  //late GoogleMapController _ctrlGoogleMap;
  Marker? _origin;
  Marker? _destination;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
  }

  bool re = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async
      {
        if(re != true)
        {
          cd.changeBloc(2);
          context.read<MyBloc>().add(EventA());
        }
        return re;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade600,
          title: Center(
            child: Text(titulo,
              style: TextStyle(
                color: Color.fromARGB(255, 245, 235, 235),
              ),
            ),
          ),
          leading: GestureDetector(
            child: Icon( Icons.keyboard_arrow_left_rounded, color: Colors.white ),
            onTap: () {
            } ,
          ) ,
          automaticallyImplyLeading: true,
        ),
        body: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                height: Code2.ScreenSize(context) - 220,
                child: GoogleMap(
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(target:
                  LatLng(18.735693, -70.162651),
                      zoom: 8.5),
                  mapType:  _currentMapType,
                  onMapCreated: _onMapCreated,
                  onTap: _addMarker,
                  markers: {
                    if (_origin != null) _origin as Marker,
                    if(_destination != null) _destination as Marker,
                  },
                ),
              ),
              Container(
                height: 50,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext,index) {
                      return ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text('Lat: $_lat',
                                style: TextStyle(fontWeight: FontWeight.w500),),
                              SizedBox(height: 5,),
                              Text('Log: $_log',
                                style: TextStyle(fontWeight: FontWeight.w500),),
                            ],
                          ),
                          IconButton(
                              onPressed: () async
                              {
                                await onSubmit();
                              },
                              icon: Icon(Icons.save_rounded)
                          ),
                          IconButton(
                            onPressed: () {
                              _goToTheLake();
                            },
                            icon: Icon(Icons.share_rounded),
                          ),
                          _onMapTypeButtonPressed(),
                        ],
                      );

                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MapType _currentMapType = MapType.hybrid;

  _addMarker(LatLng pos){
    if(_origin == null){

      setState(() {
        _origin = Marker(
          markerId:  MarkerId("1234"),
          infoWindow: InfoWindow(title: "Cancha"),
          icon:
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos,
        );
        _lat = pos.latitude.toString();
        _log = pos.longitude.toString();
      });
    }
    else {
      setState(() {
        _origin = Marker(
          markerId:  MarkerId("5678"),
          infoWindow: InfoWindow(title: "Cancha 2"),
          icon:
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos,
        );
        _lat = pos.latitude.toString();
        _log = pos.longitude.toString();
      });
    }
  }

  String latitud = "0.00";
  String longitud = "0.00";

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    return await Geolocator.getCurrentPosition();
  }

  _onMapTypeButtonPressed() {
    return PopupMenuButton(
      icon: Icon(Icons.map_rounded),
      onSelected: (selectedValue)
      {
        switch(selectedValue)
        {
          case 1:
            setState(() {
              _currentMapType =  MapType.hybrid;
            });
            break;
          case 2:
            setState(() {
              _currentMapType =  MapType.terrain;
            });
            break;
          case 3:
            setState(() {
              _currentMapType =  MapType.satellite;
            });
            break;
          case 4:
            setState(() {
              _currentMapType =  MapType.normal;
            });
            break;
          default:
            break;
        }
      },
      itemBuilder: (BuildContext context)
      => [
        PopupMenuItem(child: Text('Hibrido'), value: 1,),
        PopupMenuItem(child: Text('Terreno'), value: 2,),
        PopupMenuItem(child: Text('Satelital'), value: 3,),
        PopupMenuItem(child: Text('Normal'), value: 4,)
      ],
    );
  }

  onSubmit() async{

      cd.changeBloc(1);
     // context.read<MyBloc>().add(EventViewMap());
  }
  Future<void> _goToTheLake() async {
    if(_origin==null)
    {
      return;
    }
    Share.share('https://www.google.com/maps/search/?api=1&query=${_origin?.position.latitude},${_origin?.position.longitude}');

  }

}
