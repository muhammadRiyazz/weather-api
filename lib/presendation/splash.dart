import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wether_api/presendation/home_page.dart';

import '../domain/api.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    gotonextpage(context);
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          'Splash',
          style: TextStyle(fontSize: 22),
        ),
      )),
    );
  }

  gotonextpage(context) async {
    await Future.delayed(const Duration(seconds: 4));
    final Position position = await getcurrentlocation();

    log(position.toString());

    final data = await Getweather.getcurrentweather(
        let: position.latitude, lon: position.longitude);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return MyHomePage(data: data);
      },
    ));
  }

  Future<Position> getcurrentlocation() async {
    log('message');
    bool location = await Geolocator.isLocationServiceEnabled();
    if (!location) {
      log('message 1');

      return Future.error('error');
    }

    LocationPermission permition = await Geolocator.checkPermission();

    if (permition == LocationPermission.denied) {
      permition = await Geolocator.requestPermission();
    }
    if (permition == LocationPermission.deniedForever) {
      log('message w');

      return Future.error('error');
    }
    log(' ty');

    return await Geolocator.getCurrentPosition();
  }
}
