import 'package:flutter/material.dart';
import 'package:home_service_app/views/homeView.dart';
import 'package:home_service_app/views/loginView.dart';
import 'package:home_service_app/views/views.dart';
import 'package:home_service_app/views/jobListingView.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: jobDetailsView(),
    );
  }
}
