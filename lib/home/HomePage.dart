import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darkmode/BlocTheme/BlogTheme.dart';
import 'package:darkmode/base/BaseView.dart';
import 'package:darkmode/common/Common.dart';
import 'package:darkmode/common/admob_ad_event.dart';
import 'package:darkmode/home/HomeViewModel.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import '../main.dart';
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
  BannerAd myBanner;
  bool isLoadingAds = false;

  @override
  void initState() {
    super.initState();
    myBanner = BannerAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads
      adUnitId: Common.BANNER_ADS,
      size: AdSize.mediumRectangle,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
    myBanner
      // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: 5,
        // Positions the banner ad 10 pixels from the center of the screen to the right
        horizontalCenterOffset: 0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = new HomeViewModel();
    _presenter = new HomePresenter(_viewModel);
    _presenter.init(this);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              _presenter.intentSetting(context, myBanner);
            },
            child: Container(
              height: 50,
              width: 50,
              child: Icon(Icons.settings),
            ),
          ),
//          actions: <Widget>[
//            GestureDetector(
//              onTap: () {
//                wallPaper(context);
//              },
//              child: Container(
//                color: Colors.transparent,
//                height: 50,
//                width: 50,
//                child: Icon(Icons.library_books),
//              ),
//            )
//          ],
          title: Text(
            "Dark Mode",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Visibility(
              visible: isLoadingAds,
              child: Container(
                // padding: EdgeInsets.only(bottom: 180),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                color: Colors.black38,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              StreamBuilder(
                                  stream: widget._blogTheme.getStream(),
                                  builder: (ctx, sn) {
                                    return Container(
                                      height:
                                          width > 360 ? height / 4 : height / 6,
                                      child: Image.asset(
                                        !sn.hasData
                                            ? "assets/images/ic_light.png"
                                            : sn.data == Common.MODE_NIGHT_NO
                                                ? "assets/images/ic_light.png"
                                                : sn.data ==
                                                        Common.MODE_NIGHT_YES
                                                    ? "assets/images/ic_dark.png"
                                                    : "assets/images/ic_light.png",
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  }),
                              Container(
                                height: width * 0.15 + 50,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: HomeViewModel.LIST.map(
                                      (element) {
                                        print(
                                            "assets/images/theme${element["code"]}.png");
                                        return GestureDetector(
                                          onTap: () {
                                            _presenter.setThemView(element);
                                          },
                                          child: Container(
                                            // padding: EdgeInsets.all(5),
                                            child: Column(
                                              children: <Widget>[
                                                Card(
                                                  elevation: 4,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.blue,
                                                            style: BorderStyle
                                                                .solid,
                                                            width: element[
                                                                        "code"] ==
                                                                    Common.selectedTheme[
                                                                        "code"]
                                                                ? 2
                                                                : 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    child: ClipRRect(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      child: Image.asset(
                                                        "assets/images/theme${element["code"]}.png",
                                                        width: width * 0.15,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(element["name"])
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ).toList()),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _presenter.setThemeApp(Common.selectedTheme);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                          width: 1.5),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Text(
                                    "Set Theme",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  wallPaper(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue,
                                          style: BorderStyle.solid,
                                          width: 1.5),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Text(
                                    "Set Wallpaper",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isLoadingAds,
                          child: Container(
                            // padding: EdgeInsets.only(bottom: 180),
                            alignment: Alignment.center,
                            width: width,
                            color: Colors.black38,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  bannerWidget(context, AdmobBannerSize.MEDIUM_RECTANGLE),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  uiUpdate(data) {
    if (data["key"] == "load") {
      setState(() {
        isLoadingAds = data["value"];
      });
    }
  }

  void wallPaper(context) {
    dynamic categories = null;
    if (myBanner != null) {
      myBanner.dispose();
      myBanner = null;
    }
    setState(() {
      isLoadingAds = true;
    });
    _presenter.intentWallpaper(context, () {
      setState(() {
        isLoadingAds = false;
      });
    });
  }
}

Future<QuerySnapshot> getCategorySer() {
  final databaseReference = Firestore.instance;
  dynamic categories = {};
  return databaseReference.collection("wallpaper").getDocuments();
}

void _loadBanner(banner) {
  print("loadBanner");
  banner =
      new BannerAd(adUnitId: Common.BANNER_ADS, size: AdSize.mediumRectangle);
  banner
    ..load()
    ..show(anchorOffset: 10.0, horizontalCenterOffset: 0.0);
}
