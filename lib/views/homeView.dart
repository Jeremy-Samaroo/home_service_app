import 'package:flutter/material.dart';
import 'package:home_service_app/views/widgets/homeView_TileClusterWidget.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:home_service_app/views/responsive.dart';
import 'package:home_service_app/views/widgets/footer_Widget.dart';
import 'package:home_service_app/views/widgets/homeView_MapWidget.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    if (Responsive.isDesktop(context)) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopBar(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MapView(),
                    TileCluster()
                  ],
                ),
              ),
              Footer()
            ],
          ),
        ),
      );
    } 
    return Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        drawer: SideNav(),
        appBar: AppBar(backgroundColor: Color.fromRGBO(4, 31, 81, 1),),
        body: 
        SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ],
          ),
        ),
      );
  }
}