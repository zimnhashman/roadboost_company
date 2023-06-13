import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'denyScreen.dart';
import 'acceptScreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roadboost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Breakdown Requests'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<Marker> allMarkers = <Marker>[];
  DateTime now = new DateTime.now();
  late GoogleMapController mapController;

  static const LatLng showLocation = const LatLng(-17.838129, 31.006380);

  @override
  void initState() {
    super.initState();
    allMarkers.add(Marker(
      markerId: MarkerId('breakdownLocation'), draggable: false,
      infoWindow: InfoWindow(snippet: 'Breakdown', title: 'Vehicle Location'),
      onTap: () {
        print('Marker Tapped');
      }, position: LatLng(-17.8391485, 31.0066393)
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(child: Text('${now.hour}:${now.minute}:${now.second}', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.blue,
              ),), ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(color: Colors.greenAccent,
                height: 300,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: GoogleMap(
                  zoomGesturesEnabled: true,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: showLocation,
                    zoom: 15.0,
                  ),
                  markers: Set.from(allMarkers),
                  onMapCreated: _onMapCreated,
                  mapType: MapType.normal,


                ),

              ),
            ),

        Container(
          alignment: Alignment.center,
          child: InkWell(
            highlightColor: Colors.greenAccent,
            onTap: () {},
            child: Column(
              children: <Widget>[
                Image(image: AssetImage('images/icons8-car-50.png'),),
                Text('Car'),
              ],
            ),
          ),
        ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Accept()));
                    }, child: Text(
                        'ACCEPT', style: TextStyle(
                      fontSize: 20.0,
                    ),
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Deny()));
                    }, child: Text('DENY',  style: TextStyle(
                      fontSize: 20.0,
                    ),),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    }

  breakdown() {
    setState(() {
      Marker(
        markerId: MarkerId(showLocation.toString()),
        position: showLocation,

        infoWindow: InfoWindow(
          title: 'Breakdown Location',
          snippet: 'Location',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      );

    });
  }

  }

