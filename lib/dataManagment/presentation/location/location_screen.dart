import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/common/widgets/custom_app_bar.dart';
import 'package:mobile_application/common/widgets/navigation_bar.dart';

import '../../../injections.dart';
import '../../application/use_cases/get_report_by_id.dart';

const MapboxAccessToken = 'pk.eyJ1IjoiY3Jpc29yczA5IiwiYSI6ImNseHMzcGIzMDE2dXQyd3BrbzRxZDJpemkifQ.DflG0_KHMBjn7c26appWIg';
const myPosition = LatLng(-12.076832832450908, -77.09348179398481); // Coordenadas de Lima, Perú

class LocationScreen extends StatefulWidget {
  final int? userId; // parámetro opcional
  const LocationScreen({Key? key,  this.userId}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late MapController _mapController;
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _fetchReportData();
  }

  Future<void> _fetchReportData() async {
    try {
      //final report = Provider.of<UserModel>(context).report;
      final report = await serviceLocator<GetReportById>()(widget.userId!);
      setState(() {
        latitude = double.parse(report.latitude);
        longitude = double.parse(report.longitude);
      });
    } catch (e) {
      print('Failed to fetch report: $e');
    }
  }

  void _gotoMyPosition() {
    if (latitude != null && longitude != null) {
      _mapController.move(LatLng(latitude, longitude), 15.0);
    } // mover a myposition
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Location',
      ),
      bottomNavigationBar: const NavigationMenu(currentPageIndex: 2,),
      body:
      latitude != null && longitude != null ?
      FlutterMap(
        mapController: _mapController,
        options: MapOptions(
           initialCenter: LatLng(latitude, longitude),
            initialZoom: 15.0,
          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.all, // Habilita todas las interacciones por defecto
            rotationThreshold: 20.0,
            rotationWinGestures: MultiFingerGesture.rotate,
            pinchZoomThreshold: 1,
            pinchZoomWinGestures: MultiFingerGesture.pinchZoom | MultiFingerGesture.pinchMove,
            pinchMoveThreshold: 40.0,
            pinchMoveWinGestures: MultiFingerGesture.pinchZoom | MultiFingerGesture.pinchMove,
            scrollWheelVelocity: 0.5,),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}@2x?access_token={accessToken}",
            additionalOptions: const {
              'accessToken': MapboxAccessToken,
              'id': 'mapbox/streets-v11', // estilo de mapa
            },
          ),
          MarkerLayer(
            markers:[
              Marker(
                point: LatLng(latitude, longitude),
                width: 80.0,
                height: 80.0,
                child: Icon(
                  Icons.location_on,
                  size: 60,
                  color: Styles.primaryColor,
                ),
                )
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _gotoMyPosition,
              child: Icon(
                  Icons.my_location_rounded,
                  color: Styles.primaryColor,
                size: 30,
            ),
          )
          )
        ],
      )
      : const Center(child: CircularProgressIndicator()),
    );
  }
}
