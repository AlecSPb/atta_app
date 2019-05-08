import 'package:atta_mobile_app/src/controllers/FavoritController.dart';
import 'package:atta_mobile_app/src/data/models/ShopModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class CompanyCard extends StatelessWidget {
  ShopModel shopModel;

  CompanyCard({this.shopModel,});



  
  ShopModel shopFavorit = new ShopModel();

 
 FavoritController _fvoriteController = FavoritController.con;
 
  
  @override
  Widget build(BuildContext context ,) {
    return ticketCard(context , shopModel);
  }

  Widget ticketCard(BuildContext context , ShopModel shopModel) {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 5),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: FlatButton(
            onPressed: () {},
            child: Row(
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.grey.shade100)),
                  child: FadeInImage(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.25,
                    image: AssetImage('assets/imgs/2.jpg'),
                    placeholder: new AssetImage('assets/imgs/2.jpg'),
                  ),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      //width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        children: <Widget>[
                          Text(shopModel.nameAr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          Text(shopModel.descriptionAr),
                          Text(shopModel.addressAr, style: TextStyle(color: Colors.grey)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              StarRating(
                                size: MediaQuery.of(context).size.width *
                                    0.25 /
                                    6,
                                rating: 3.5,
                                color: Colors.orange,
                                borderColor: Colors.grey,
                                starCount: 5,
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: Icon(
                                  Icons.favorite,
                                   color: shopModel.isFavorite
                                            ? Colors.red
                                            : Colors.grey,
                                ),
                                onPressed: () {
                                 _fvoriteController.toggleShopFavourite(shopModel.shopId);
                                },
                              )
                            ],
                          ),
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
