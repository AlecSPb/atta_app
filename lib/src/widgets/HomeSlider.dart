import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/screens/ticket_detail.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeSlider extends StatelessWidget {
  String title;
  List<OfferModel> offerModels;
  HomeSlider({this.title, this.offerModels});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return sliderContainer(context);
  }

  Widget sliderContainer(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff793B8E)),
              ),
            )
          ],
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(8),
            height: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: <Widget>[
                    carousel2(context),
                  ],
                )),
          ),
        )
      ],
    );
  }

  Widget banner(BuildContext context, String name) => Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 2,
        child: Text(
          name != null ? name : "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0,
                color: Colors.black.withOpacity(0.8),
              ),
            ],
          ),
        ),
      );

  Widget detailsBottom(BuildContext context, OfferModel offer) => Container(
        padding: EdgeInsets.only(top: 120),
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width - 200),
        width: 145,
        child: RaisedButton(
          color: Colors.white,
          shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TicketDetailScreen(
                          offer: offer,
                        )));
          },
        ),
      );

  Widget carousel() => new Carousel(
        boxFit: BoxFit.cover,
        showIndicator: false,
        images: [
          new AssetImage('assets/imgs/1.jpeg'),
          new AssetImage('assets/imgs/2.jpg'),
          new AssetImage('assets/imgs/3.jpg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(seconds: 2),
      );

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  Widget carousel2(BuildContext context) => new CarouselSlider(
        items: map<Widget>(
          offerModels,
          (index, i) {
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(children: <Widget>[
                  Image.network(
                    i.offerPics != null && i.offerPics.length > 0
                        ? i.offerPics[0].path
                        : 'https://www.w3schools.com/w3css/img_lights.jpg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  banner(context, i.nameAr),
                  detailsBottom(context, i),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      // decoration: BoxDecoration(
                      //   gradient: LinearGradient(
                      //     colors: [
                      //       Color.fromARGB(200, 0, 0, 0),
                      //       Color.fromARGB(0, 0, 0, 0)
                      //     ],
                      //     begin: Alignment.bottomCenter,
                      //     end: Alignment.topCenter,
                      //   ),
                      // ),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 5.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            );
          },
        ).toList(),
        autoPlay: true,
        viewportFraction: 1.0,
        aspectRatio: 40 / 20,
        enlargeCenterPage: true,
      );
}
