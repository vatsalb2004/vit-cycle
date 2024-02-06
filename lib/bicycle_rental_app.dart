import 'bicycle_home_page.dart';
import 'package:flutter/material.dart';


class BicycleRentalApp extends StatelessWidget {
  const BicycleRentalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BicycleRentalHomePage(),
    );
  }
}

