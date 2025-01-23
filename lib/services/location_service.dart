import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<void> getLocationPosition(BuildContext context, Function(Position) onPositionReceived) async{
  // method yg dipunya sm geolocator. milih yang low karena biar hemat performance 
  // ignore: deprecated_member_use
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  onPositionReceived(position);
}

Future<void> getAddressFromLongLat(Position position, Function(String) onAddressReceived) async{
  // klo pake geolocator kadang butuh geocoding untuk memberikan detail dri posisi kita
  // latitude = vertikal, longitude = horizontal
  List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark place = placemark[0];
  String address = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
  onAddressReceived(address);
}

Future<bool> handleLocationPermission(BuildContext context) async{
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // untuk menampilkan snackbar
    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
      content: Row(
        children: [
          // ini klo misalkan lokasinya off
          Icon(Icons.location_off,  color: Colors.white,),
          SizedBox(width: 10,),
          Text("Location service are disabled.Please enable the service",
          style: TextStyle(color: Colors.white),)
        ],
      ),
      backgroundColor: Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
    // false biar klo user blm ngasih permission, app nya ga jalan
    return false;
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();  
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Row(
          children: [
            Icon(Icons.location_off,
            color: Colors.white,),
            SizedBox(width: 10,),
            Text("Location permission denied",
            style: TextStyle(
              color: Colors.white
            ),)
          ],
        ),
        backgroundColor: Colors.blueGrey,
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
      // buat memblokir user
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Row(
        children: [
          Icon(Icons.location_off, color: Colors.white,),
          SizedBox(width: 10,),
          Text(
            "Location permission denied forever, we can't access ",
            style: TextStyle(color: Colors.white),
          )
        ],
      ) ,
      backgroundColor: Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
    return false;
  }
  // ini dijalankan kalau misalkan user udah ngasih permission, alias ga ngikutin if if diatas
  return true;
}