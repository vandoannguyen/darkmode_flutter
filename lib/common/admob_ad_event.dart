import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';

AdmobInterstitial interstitialAd;
AdmobBannerSize bannerSize;

void handleEventBanner(
    AdmobAdEvent event, Map<String, dynamic> args, String adType) async {
  switch (event) {
    case AdmobAdEvent.loaded:
      break;
    case AdmobAdEvent.opened:
      break;
    case AdmobAdEvent.closed:
      break;
    case AdmobAdEvent.failedToLoad:
      break;
    case AdmobAdEvent.rewarded:
      break;
    default:
  }
}

Widget bannerWidget(context, bannerSize) {
  return Container(
//    width: MediaQuery.of(context).size.width,
//    alignment: Alignment.bottomCenter,
//    child: AdmobBanner(
//      adUnitId: config_app["BANNER_ADS"],
//      adSize: bannerSize,
//      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
//        handleEventBanner(event, args, 'Banner');
//      },
//    ),
      );
}
