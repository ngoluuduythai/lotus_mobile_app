import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  final Set<Marker> markers;
  final LatLng center;

  const GoogleMapsView(this.markers, this.center);

  @override
  _GoogleMapsView createState() => _GoogleMapsView();
}

class _GoogleMapsView extends State<GoogleMapsView> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: SizedBox(
            width: 300.0,
            height: 200.0,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: widget.center,
                zoom: 11.0,
              ),
              // ignore: prefer_collection_literals
              markers: widget.markers,
            ),
          ),
        ),
      ],
    );
  }
}
