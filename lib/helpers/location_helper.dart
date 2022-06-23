import 'package:geocoding/geocoding.dart';

// ignore: constant_identifier_names
const GOOGLE_API_KEY = 'AIzaSyB7DGj3wKzZCLteyGBJLV79jrN53Dl7Dqs';

class LocationHelper {
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark placemark = placemarks[0];
    // print(placemark.toJson());
    final address =
        '${placemark.street}, ${placemark.subAdministrativeArea},${placemark.administrativeArea}';
    return address;
  }
}
