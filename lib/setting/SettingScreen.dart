import 'package:darkmode/common/CallNaviveUtils.dart';
import 'package:darkmode/common/Common.dart';
import 'package:darkmode/common/intent_utils.dart';
import 'package:darkmode/faq/FAQView.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SettingScreen extends StatefulWidget {
  BannerAd mBanner;
  SettingScreen(this.mBanner);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var isLoadingAds = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      CallNativeUtils.invokeMethod(method: "app_version");
                    },
                    child: Container(
                      height: textHeight(),
                      color: Colors.transparent,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.android,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "App version",
                              style: textStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                    margin: EdgeInsets.only(left: 10, right: 10),
                  ),
                  GestureDetector(
                    onTap: () {
                      shareApp();
                    },
                    child: Container(
                      height: textHeight(),
                      color: Colors.transparent,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.share,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "Share app",
                              style: textStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                    margin: EdgeInsets.only(left: 10, right: 10),
                  ),
                  GestureDetector(
                    onTap: () {
                      rate();
                    },
                    child: Container(
                      height: textHeight(),
                      color: Colors.transparent,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "Rate Us",
                              style: textStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                    margin: EdgeInsets.only(left: 10, right: 10),
                  ),
                  GestureDetector(
                    onTap: () {
                      faqQuestion(context);
                    },
                    child: Container(
                      height: textHeight(),
                      color: Colors.transparent,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.question_answer,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "Fast answer question (FAQ)",
                              style: textStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                    margin: EdgeInsets.only(left: 10, right: 10),
                  ),
                ],
              ),
            ),
          ),
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
          )
        ],
      ),
    );
  }

  textStyle() {
    return TextStyle(fontSize: 17);
  }

  textHeight() {
    return 50.0;
  }

  void faqQuestion(context) {
    setState(() {
      isLoadingAds = true;
    });

    InterstitialAd myInterstitial = InterstitialAd(
      adUnitId: Common.INTER_ADS,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.opened) {
          widget.mBanner.dispose();
        }
        if (event == MobileAdEvent.closed) {
          setState(() {
            isLoadingAds = false;
          });
          IntentAnimation.intentNomal(
              context: context,
              screen: FAQView(() {
                loadBanner();
              }),
              option: IntentAnimationOption.RIGHT_TO_LEFT,
              duration: Duration(milliseconds: 400));
        }
      },
    );
    myInterstitial
      ..load()
      ..show();
  }

//
  void loadBanner() {
    widget.mBanner =
        new BannerAd(adUnitId: Common.BANNER_ADS, size: AdSize.mediumRectangle);
    widget.mBanner
      ..load()
      ..show(anchorOffset: 10, horizontalCenterOffset: 0);
  }

  void rate() {
    CallNativeUtils.invokeMethod(method: "rateManual");
  }

  void shareApp() {
    Share.text("Dark Mode And Night Mode", Common.APP_LINK, "text/plain");
  }
}
//
