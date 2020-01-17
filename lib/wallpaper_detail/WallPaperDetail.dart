import 'package:darkmode/common/CallNaviveUtils.dart';
import 'package:darkmode/common/Common.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class WallpaperDetail extends StatefulWidget {
  int index, position;

  WallpaperDetail(this.index, this.position);

  @override
  _WallpaperDetailState createState() => _WallpaperDetailState();
}

class _WallpaperDetailState extends State<WallpaperDetail> {
  bool isLoadingAds = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: "hero${widget.index}${widget.position}",
            child: Image.asset(
                widget.position == 0
                    ? "android/app/src/main/assets/wallpaper/light/${widget.index}.jpg"
                    : "android/app/src/main/assets/wallpaper/dark/${widget.index}.jpg",
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
            right: 50,
            bottom: 50,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.blue),
              child: IconButton(
                onPressed: () {
                  setSelectedWallpaper(context);
                },
                color: Colors.white,
                icon: Icon(Icons.format_paint),
              ),
            )),
        Positioned(
            left: 20,
            top: 50,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.blue),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
              ),
            )),
        Visibility(
          visible: isLoadingAds,
          child: Container(
            // padding: EdgeInsets.only(bottom: 180),
            alignment: Alignment.center,
            width: double.infinity,
            color: Colors.black38,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ],
    ));
  }

  void setSelectedWallpaper(context) {
    showDialogOption(context, (value) {
      setState(() {
        isLoadingAds = true;
      });
      InterstitialAd myInterstitial = InterstitialAd(
        adUnitId: Common.INTER_ADS,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.closed) {
            setState(() {
              isLoadingAds = false;
            });
            CallNativeUtils.invokeMethod(method: "setWallpaper", aguments: {
              "index": widget.index,
              "category": widget.position == 0 ? "l" : "d",
              "option": value
            });
          }
        },
      );
      myInterstitial
        ..load()
        ..show();
    });
  }

  void showDialogOption(context, callBack) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              elevation: 10,
              title: Text("Select option:"),
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        callBack("Home");
                        Navigator.pop(context);
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          alignment: Alignment.center,
                          width: setWidth(),
                          padding: EdgeInsets.all(10),
                          child: Text("Home Screen"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        callBack("Both");
                        Navigator.pop(context);
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          alignment: Alignment.center,
                          width: setWidth(),
                          padding: EdgeInsets.all(10),
                          child: Text("Both"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        callBack("Lock");
                        Navigator.pop(context);
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          alignment: Alignment.center,
                          width: setWidth(),
                          padding: EdgeInsets.all(10),
                          child: Text("Lock Screen"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//              actions: <Widget>[
//                GestureDetector(
//                  onTap: () {
//                    callBack("Home");
//                    Navigator.pop(context);
//                  },
//                  child: Card(
//                    elevation: 5,
//                    child: Container(
//                      padding: EdgeInsets.all(10),
//                      child: Text("Home Screen"),
//                    ),
//                  ),
//                ),
//                GestureDetector(
//                  onTap: () {
//                    callBack("Both");
//                    Navigator.pop(context);
//                  },
//                  child: Card(
//                    elevation: 5,
//                    child: Container(
//                      padding: EdgeInsets.all(10),
//                      child: Text("Both"),
//                    ),
//                  ),
//                ),
//                GestureDetector(
//                  onTap: () {
//                    callBack("Lock");
//                    Navigator.pop(context);
//                  },
//                  child: Card(
//                    elevation: 5,
//                    child: Container(
//                      padding: EdgeInsets.all(10),
//                      child: Text("Lock Screen"),
//                    ),
//                  ),
//                ),
//              ],
            ));
  }

  setWidth() {
    return 150.0;
  }
}
