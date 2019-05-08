
import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/screens/ticket_detail.dart';
import 'package:atta_mobile_app/src/widgets/VerticalDivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class TicketCard extends StatelessWidget {
  
  OfferModel offerModel;

   TicketCard({
  this.offerModel
  }) ;

  @override
  Widget build(BuildContext context) {
    
    return ticketCard(context);
  }

  Widget ticketCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right:2,left:2),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(1),
          child: FlatButton(
            onPressed: () {},
            child: Row(
              children: <Widget>[
                Container(   
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.grey.shade100)),
                  child: FadeInImage(
                    width: MediaQuery.of(context).size.width * 0.24,
                    height: MediaQuery.of(context).size.width * 0.25,
                    image: offerModel.offerPics!=null&&offerModel.offerPics.length!=0?NetworkImage(offerModel.offerPics[0].path):AssetImage('assets/imgs/2.jpg'),
                    placeholder: new AssetImage('assets/imgs/2.jpg'),
                  ),
                ),
                SizedBox(width: 3,),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        children: <Widget>[
                          Text(offerModel.shop==null||offerModel.shop.nameAr==null?"":offerModel.shop.nameAr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,color:Color(0xff793B8E) )),
                          Text(offerModel.nameAr==null?"":offerModel.nameAr),
                          Text(offerModel.shop==null||offerModel.shop.addressAr==null?"":offerModel.shop.addressAr, style: TextStyle(color: Colors.grey,fontSize: 10)),
                          StarRating(
                            size: MediaQuery.of(context).size.width * 0.25 / 6,
                            rating:offerModel.shop==null||offerModel.shop.shopRate==null?0.5: offerModel.shop.shopRate,
                            color: Colors.orange,
                            borderColor: Colors.grey,
                            starCount: 5,
                          )
                        ],
                      ),
                    ),
                   
                    MyVerticalDivider(),
                   
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        children: <Widget>[
                          Text( offerModel.discountAmount==null?"":"الخصم "+offerModel.discountAmount+"%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20,color:Color(0xffFF4E00) )),
                          Container(
                            color: Colors.white,
                            child: RaisedButton(
                              color: Colors.white,
                              padding: EdgeInsets.only(right: 5),
                              shape: StadiumBorder(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "تفاصيل اكثر",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Card(
                                    shape: CircleBorder(),
                                    color: Colors.green,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                 Navigator.push(context,  MaterialPageRoute(
                    builder: (context) => TicketDetailScreen(offer:  offerModel,)));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
