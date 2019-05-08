
import 'package:atta_mobile_app/src/data/models/OfferModel.dart';

import 'package:atta_mobile_app/src/screens/ticket_detail.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {

  OfferModel offerModel;

   OfferCard({
    
    this.offerModel
  });


  @override
  Widget build(BuildContext context) {
    
    return offerCard(context);
  }

  Widget offerCard(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(10.0),
            child: Stack(
              // fit: StackFit.expand,
              children: <Widget>[
                offerModel.offerPics!=null&&offerModel.offerPics.length!=0?
                Image.network(
                  offerModel.offerPics[0].path,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ):
                Image.asset(
                  'assets/imgs/2.jpg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                // carousel(),
                detailsBottom(context,offerModel),
                banner(context,offerModel.nameAr)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget banner(BuildContext context,String name) => Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )),
        child:name!=null?  Text(
         name,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ):Text(
          "",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ));

  Widget detailsBottom(BuildContext context,OfferModel offer) => Container(
        padding: EdgeInsets.only(top: 125),
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width - 200),
        width: 145,
        child: RaisedButton(
          color: Colors.white,
          shape: StadiumBorder(
            side: BorderSide(color: Colors.grey)
          ),
          child: Row(
            children: <Widget>[
              Text("تفاصيل اكثر"),
              SizedBox(
                width: 11,
              ),
              Card(
                shape: CircleBorder(),
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.keyboard_arrow_left),
                ),
              ),
            ],
          ),
          onPressed: () {
             Navigator.push(context,  MaterialPageRoute(
                    builder: (context) => TicketDetailScreen(offer: offer,)));
          },
        ),
      );
}