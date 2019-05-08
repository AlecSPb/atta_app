import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/FavoritController.dart';
import 'package:atta_mobile_app/src/data/models/EventModel.dart';
import 'package:atta_mobile_app/src/data/models/EventsAttendes.dart';

import 'package:atta_mobile_app/src/data/services/EventService.dart';
import 'package:atta_mobile_app/src/screens/event_teket.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  EventModel eventModel;

  EventCard({this.eventModel});



  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool _isLoading = false;

    FavoritController _favoritController = FavoritController.con;

  EventsAttendes eventsAttendes = new EventsAttendes();


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[card(context), detailsBottom(context)],
    );
  }

  Widget detailsBottom(BuildContext context) => Container(
        padding: EdgeInsets.only(top: 135),
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width - 130),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xff793B8E)),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "احجز",
              style: TextStyle(
                  color: Color(0xff793B8E), fontWeight: FontWeight.bold),
            ),
          ),
          onPressed: () {
            return showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0)),
                                      color: Color(0xffFF4E00)),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 90.0, vertical: 90.0),
                                    child: TextField(
                                      controller:
                                          TextFieldController.noOfAttendes,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      // controller: _textFieldController,
                                      decoration: InputDecoration(
                                          labelText: "عدد الأشخاص"),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 180.0,
                                  right: 95.0,
                                  child: !_isLoading
                                      ? CircularProgressIndicator()
                                      : FlatButton(
                                          color: Color(0xffFF4E00),
                                          child: Text(
                                            "تأكيد",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              _isLoading = true;
                                            });
                                            EventService _eventService =new EventService();
                                            EventsAttendes eventAttendes =new EventsAttendes();
                                            eventAttendes.noOfAttendees =int.parse(TextFieldController .noOfAttendes.text);
                                            eventAttendes.eventId =widget.eventModel.eventId;
                                            EventsAttendes savedModel =await _eventService .reserveEvent(eventAttendes);
                                           
                                            setState(() {
                                              _isLoading = false;
                                            });

                                             
                                            //Navigator.pop(context);
                                          },
                                        ),
                                ),
                                Positioned(
                                  top: 220,
                                  right: 95,
                                  child: Text(
                                        eventsAttendes.eventVerificationCode == null ? "لا يوجد" : eventsAttendes.eventVerificationCode,
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Text(
                                        "عدد الأشخاص الراغبين في الحضور",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )),
                  );
                });
            // Navigator.pushNamed(context, "/EventTeket");
          },
        ),
      );

  Widget card(BuildContext context) => Container(
        padding: EdgeInsets.all(8),
        //height: 250,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            children: <Widget>[
              Container(
                  height: 150,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: widget.eventModel.imagePath != null
                          ? Image.network(widget.eventModel.imagePath,
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width)
                          : Image.asset(
                              'assets/imgs/2.jpg',
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width,
                            ))),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 8, right: 8, bottom: 8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                      widget.eventModel.titleAr != null
                                          ? widget.eventModel.titleAr
                                          : "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff793B8E)))),
                              SizedBox(
                                width: 10,
                              ),
                              // Icon(Icons.flag,size: 20,color: Colors.green,),
                              // Text("المكان:",style: TextStyle(color:Color(0xff793B8E),fontSize: 10 ),),
                              // Text(eventModel.eventAddressAr!=null? eventModel.eventAddressAr:"",style: TextStyle(color:Color(0xff793B8E),fontSize: 10 ),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              // Expanded(
                              //     child: Text(eventModel.titleAr!=null?eventModel.titleAr:"",
                              //         style: TextStyle(
                              //             fontWeight: FontWeight.bold,
                              //             color: Color(0xff793B8E)))),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.flag,
                                size: 20,
                                color: Colors.green,
                              ),
                              Text(
                                "المكان:",
                                style: TextStyle(
                                    color: Color(0xff793B8E), fontSize: 10),
                              ),
                              Text(
                                widget.eventModel.eventAddressAr != null
                                    ? widget.eventModel.eventAddressAr
                                    : "",
                                style: TextStyle(
                                    color: Color(0xff793B8E), fontSize: 10),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                      widget.eventModel.briefAr != null
                                          ? widget.eventModel.briefAr
                                          : "",
                                      style: TextStyle(color: Colors.grey)))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    Text(
                                        widget.eventModel.formatedEventDate !=
                                                null
                                            ? widget
                                                .eventModel.formatedEventDate
                                            : "",
                                        style: TextStyle(
                                            color: Color(0xff793B8E),
                                            fontSize: 13))
                                  ],
                                ),
                              ),
                              //  SizedBox(
                              //    width: MediaQuery.of(context).size.width-270,
                              //  ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        size: 30,
                                      ),
                                      color: widget.eventModel.isFavorite
                                          ? Colors.red
                                          : Colors.grey,
                                      onPressed: () {
                                        
                                     _favoritController.toggleEventFavourite(widget.eventModel.eventId);
                                      },
                                    ),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
