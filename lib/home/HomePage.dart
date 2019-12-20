import 'package:darkmode/BlocTheme/BlogTheme.dart';
import 'package:darkmode/base/BaseView.dart';
import 'package:darkmode/common/Common.dart';
import 'package:darkmode/common/intent_utils.dart';
import 'package:darkmode/faq/FAQView.dart';
import 'package:darkmode/home/HomeViewModel.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'HomePresenter.dart';

class HomePage extends StatefulWidget {
  BlogTheme _blogTheme;
  HomePage(this._blogTheme);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements BaseView {
  double width = 0, height = 0;

  HomePresenter _presenter;

  HomeViewModel _viewModel;

  ////// Banner////

  @override
  void initState() {
    BannerAd myBanner = BannerAd(
      adUnitId: Common.BANNER_ADS,
      size: AdSize.smartBanner,
      listener: (MobileAdEvent event) {},
      targetingInfo: targetingInfo,
    );
    myBanner
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 4.0,
        horizontalCenterOffset: 0.0,
      );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("demo");
    _viewModel = new HomeViewModel();
    _presenter = new HomePresenter(_viewModel);
    _presenter.init(this);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                StreamBuilder(
                    stream: widget._blogTheme.getStream(),
                    builder: (ctx, sn) {
                      return Container(
                        height: height / 3,
                        child: Image.asset(
                          !sn.hasData
                              ? "assets/images/ic_light.png"
                              : sn.data == Common.MODE_NIGHT_NO
                                  ? "assets/images/ic_light.png"
                                  : sn.data == Common.MODE_NIGHT_YES ? "assets/images/ic_dark.png" : "assets/images/ic_light.png",
                          fit: BoxFit.fill,
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: height / 4.5 + 15,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: HomeViewModel.LIST.map(
                        (element) {
                          print("assets/images/theme${element["code"]}.png");
                          return GestureDetector(
                            onTap: () {
                              _presenter.setThemView(element);
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Card(
                                    elevation: 4,
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue,
                                                  style: BorderStyle.solid,
                                                  width: element["code"] == Common.selectedTheme["code"] ? 3 : 1),
                                              borderRadius: BorderRadius.all(Radius.circular(8))),
                                          child: ClipRRect(
                                            clipBehavior: Clip.antiAlias,
                                            borderRadius: BorderRadius.all(Radius.circular(7)),
                                            child: Image.asset(
                                              "assets/images/theme${element["code"]}.png",
                                              width: width / 4,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(element["name"])
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList()),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _presenter.setThemeApp(Common.selectedTheme);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, style: BorderStyle.solid, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      "Set Theme",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
//                SizedBox(
//                  height: 100,
//                  child: Container(),
//                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                IntentAnimation.intentNomal(
                    context: context, screen: FAQView(), option: IntentAnimationOption.RIGHT_TO_LEFT, duration: Duration(milliseconds: 400));
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Card(
                    elevation: 4,
                    child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Frequently Asked Questions (FAQ)",
                          style: TextStyle(fontSize: 15),
                        )),
                  )),
            ),
          )
        ],
      ),
    );
  }

  @override
  uiUpdate(selectedTheme) {}
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);
