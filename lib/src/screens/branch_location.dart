import 'dart:async';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/BranchLocationController.dart';
import 'package:atta_mobile_app/src/data/models/ShopBranchModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BranchLocationScreen extends StatefulWidget {
  List<ShopBranchModel> branches;
  BranchLocationScreen({this.branches});
  @protected
  @override
  createState() => BranchLocationView();
}

class BranchLocationView extends StateMVC<BranchLocationScreen> {
  BranchLocationView() : super(BranchLocationController()) {
    _branchLocationController = BranchLocationController.con;
  }
  BranchLocationController _branchLocationController;

  LatLng sudialatlng = new LatLng(23.8859, 45.0792);

//_markers.add( Marker( point:LatLng(25.703644653225766, 45.25873837733357)));

  void initState() {
    super.initState();
    _branchLocationController.setMarkers(widget.branches);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //appBar: AppBar(),
        body: Container(
      child: Center(
          child: Column(
        children: <Widget>[
          topBar(context),
          Expanded(
            child: FlutterMap(
              options: new MapOptions(
                onTap: (LatLng x) {
                  print('${x.latitude} ----- ${x.longitude}');
                },
                center: sudialatlng,
                zoom: 5.8,
              ),
              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                new MarkerLayerOptions(
                    markers: _branchLocationController.markers),
              ],
            ),
          ),
        ],
      )),
    ));
  }

  Widget topBar(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      color: Colors.white,
      elevation: 3,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, left: 5, right: 5, bottom: 20),
          child: Column(
            children: <Widget>[myAppBar(context)],
          )),
    );
  }

  Widget myAppBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 2),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xffFF4E00),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "الفروع",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xffFF4E00),
                        ),
                      ),
                      // Icon(Icons.chat_bubble_outline,color: Color(0xffFF4E00),size: 15,)
                    ],
                  ),
                ),
                new IconButton(
                    icon: new Icon(
                      Icons.menu,
                      color: Color(0xffFF4E00),
                    ),
                    onPressed: () {
                      TextFieldController.layoutScaffoldkey.currentState
                          .openEndDrawer();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
