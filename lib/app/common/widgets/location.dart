import 'package:app/services/location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:app/app/common/extensions/extensions.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Placemark>>(
      future: LocationService.instance.determinePosition(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data?.first.country ?? '').s12.black;
        }

        if (snapshot.hasError) {
          return Text('获取地址位置失败！').s10.black;
        }

        return CupertinoActivityIndicator();
      },
    );
  }
}
