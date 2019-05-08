import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class  Reservationscreen extends StatefulWidget{
  
  @protected
  @override
  createState() => ReservationView();
}

class ReservationView extends StateMVC<Reservationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          topBar(context),
          Expanded(
            child: ListView(
              children: <Widget>[
                Image.asset('assets/imgs/reserve_done.png'),
                Text("تم ارسال نسخة على  بريدك الإلكتروني",style: TextStyle(color: Colors.green),),
                Card(

                )
              ],
            ),
          )
        ],
      )
    );
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xffFF4E00),
                    ),
                    onPressed: () {
                       Navigator.of(context).pop();
                    }),
                    SizedBox(width: MediaQuery.of(context).size.width*.23),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        " الحجز",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xffFF4E00),
                        ),
                      ),
                      //Icon(Icons.chat_bubble_outline,color: Color(0xffFF4E00),size: 15,)
                    ],
                  ),
                ),
               
              ],
            )
          ],
        ),
      ),
    );
  }

}