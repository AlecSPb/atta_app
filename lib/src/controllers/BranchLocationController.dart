import 'package:atta_mobile_app/src/data/models/ContactModel.dart';
import 'package:atta_mobile_app/src/data/models/ShopBranchModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BranchLocationController extends ControllerMVC {
  //to make single instance of class
  factory BranchLocationController() {
    if (_this == null) _this = BranchLocationController._();
    return _this;
  }
  static BranchLocationController _this;

  BranchLocationController._();

  static BranchLocationController get con => _this;

  List<ShopBranchModel> branches;
  List<Marker> markers = [];
  // ContactService _contactService = new ContactService();
  // final TextEditingController messageController = new TextEditingController();

  bool isloading = false;
  ContactModel contactModel = new ContactModel();

  setMarkers(List<ShopBranchModel> branches) async {
    // contactModel = await _contactService.getContact(shopID);

    for (var i = 0; i < branches.length; i++) {
      markers.add(Marker(
          height: 90.0,
          width: 90.0,
          point: new LatLng(
              double.parse(branches[i].lat), double.parse(branches[i].long)),
          builder: (context) => new Container(
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return Container(
                            height: 250.0,
                            child: ListView(
                              children: <Widget>[
                                SizedBox(
                                  height: 70.0,
                                ),
                                ListTile(
                                  leading: Text(
                                    "اسم الفرع",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  title: Text(branches[i].nameAr),
                                ),
                                ListTile(
                                  leading: Text(
                                    "رقم الموبايل",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  title: Text(branches[i].contactTele),
                                ),
                                ListTile(
                                  leading: Text(
                                    "العنوان",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  title: Text(branches[i].addressAr),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  icon: Icon(Icons.location_on),
                  color: Color(0xffDE7047),
                ),
              )));
    }
    refresh();
  }
}
