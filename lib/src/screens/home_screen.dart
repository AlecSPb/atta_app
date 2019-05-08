import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/HomeController.dart';
import 'package:atta_mobile_app/src/controllers/LayoutController.dart';
import 'package:atta_mobile_app/src/data/models/CategoryModel.dart';
import 'package:atta_mobile_app/src/data/models/MemperInfoModel.dart';
import 'package:atta_mobile_app/src/data/models/UserModel.dart';
import 'package:atta_mobile_app/src/helper/HexColor.dart';
import 'package:atta_mobile_app/src/screens/ticket_screen.dart';
import 'package:atta_mobile_app/src/widgets/Animation.dart';
import 'package:atta_mobile_app/src/widgets/HomeSlider.dart';
import 'package:atta_mobile_app/src/widgets/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:atta_mobile_app/src/data/services/MemperInfoService.dart';
import 'package:atta_mobile_app/src/data/SharedPreference.dart';

class HomeScreen extends StatefulWidget {
  @protected
  @override
  createState() => HomeView();
}

class HomeView extends StateMVC<HomeScreen> {
  HomeView() : super(HomeController()) {
    _homeController = HomeController.con;
  }
  HomeController _homeController;
  MemperInfoService infoService = new MemperInfoService();

  LayoutController _layoutController = LayoutController();

  UserModel userModel;

  @override
  void initState() {
    super.initState();
    _homeController.init(context);
//MemperInfoService().getAllMemperInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: categoryGirdView(),
      body: _homeController.isLoading
          ? SharedWidget.loading(context)
          : Container(
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[topBar(context)],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _homeController.latestOffer.length != 0
                        ? FadeIn(
                            0.8,
                            HomeSlider(
                              title: "أخر العروض",
                              offerModels: _homeController.latestOffer,
                            ))
                        : SizedBox(
                            height: 2,
                          ),
                    _homeController.topOffer.length != 0
                        ? FadeIn(
                            1.2,
                            HomeSlider(
                              title: "الأكثر تداولاً",
                              offerModels: _homeController.topOffer,
                            ))
                        : SizedBox(
                            height: 2,
                          ),
                    //sliderContainer("اخر العروض"),
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: 3,
                    //     itemBuilder: (context, index) {
                    //       return HomeSlider();
                    //     },
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
    );
  }

  Widget topBar(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      color: Colors.white,
      elevation: 2,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[myAppBar(context), categoryView()],
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
                // new IconButton(
                //     icon: new Icon(
                //       Icons.keyboard_arrow_right,
                //       color: Color(0xff793B8E),
                //     ),
                //     onPressed: () {}),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                ),
                Text(
                  "عطاء",
                  style: TextStyle(
                    color: Color(0xff793B8E),
                  ),
                ),
                new IconButton(
                    icon: new Icon(
                      Icons.menu,
                      color: Color(0xff793B8E),
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

  Widget categoryView() {
    return FadeIn(
        0.3,
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "الفئات",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff793B8E),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              categoryViewHorizontal(_homeController.allCategory)
            ],
          ),
        ));
  }

  Widget getCategory() {
    List<Widget> rows = <Widget>[];
    int itemsNum = 0;
    if (_homeController.viewAllCategory) {
      itemsNum = _homeController.allCategory.length;
    } else {
      itemsNum = _homeController.allCategory.length > 3
          ? 3
          : _homeController.allCategory.length;
    }
    int rowCount = (itemsNum / 4).ceil();
    for (int i = 0; i < rowCount; i++) {
      List<Widget> col = <Widget>[];
      if (!_homeController.viewAllCategory &&
          _homeController.allCategory.length > 3) {
        col.add(viewAllcategory("عرض الكل"));
      } else if (_homeController.viewAllCategory && i == rowCount - 1) {
        col.add(viewAllcategory("عرض جزء"));
      }

      for (var j = 0; j < 4; j++) {
        int x = j + i * 4;
        if (x < itemsNum) col.add(category(_homeController.allCategory[x]));
      }

      rows.add(Row(children: col));
    }

    return Column(
      children: rows,
    );
  }

  Widget category(CategoryModel cat) {
    return Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(0),
          child: Card(
            color: cat.color == null ? Color(0xff793B8E) : HexColor(cat.color),
            shape: CircleBorder(),
            child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: cat.img == null
                    ? Icon(
                        Icons.category,
                        color: Colors.white,
                      )
                    : Image.network(
                        cat.img,
                        height: 27,
                        width: 27,
                      )),
          ),
          onPressed: () {
            TextFieldController.categoryID = cat.categoryId;
            TextFieldController.appBar = cat.nameAr;
            _layoutController.setCurrentTab(1);
          },
        ),
        Text(
          cat.nameAr,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    ));
  }

  Widget viewAllcategory(String name) {
    return Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(0),
          child: Card(
            color: Colors.white,
            shape: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child:
                  // Image.asset(
                  //   "assets/imgs/right-chevron.png",
                  //   height: 27,
                  //   width: 27,
                  // )
                  Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xff793B8E),
                size: 27.0,
              ),
            ),
          ),
          onPressed: () {
            _homeController.viewCategory();
          },
        ),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    ));
  }

  Widget categoryViewHorizontal(List<CategoryModel> cats) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cats.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, i) {
          return FadeIn(
              i.toDouble() * 0.4,
              Column(
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    child: Card(
                      color: cats[i].color == null
                          ? Color(0xff793B8E)
                          : HexColor(cats[i].color),
                      shape: CircleBorder(),
                      child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: cats[i].img == null
                              ? Icon(
                                  Icons.category,
                                  color: Colors.white,
                                )
                              : Image.network(
                                  cats[i].img,
                                  height: 27,
                                  width: 27,
                                )),
                    ),
                    onPressed: () {
                      TextFieldController.categoryID = cats[i].categoryId;
                      TextFieldController.appBar = cats[i].nameAr;
                      _layoutController.setCurrentTab(1);
                    },
                  ),
                  Text(
                    cats[i].nameAr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ));
        },
      ),
    );
  }
}
