import 'package:darkmode/base/BasePresenter.dart';
import 'package:darkmode/base/BaseView.dart';
import 'package:darkmode/common/CallNaviveUtils.dart';
import 'package:darkmode/common/Common.dart';
import 'package:darkmode/common/intent_utils.dart';
import 'package:darkmode/home/HomeViewModel.dart';
import 'package:darkmode/main.dart';
import 'package:darkmode/setting/SettingScreen.dart';
import 'package:darkmode/wallpaper/Wallpaper.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePresenter implements BasePresenter {
  HomeViewModel _viewModel;

  BaseView _baseView;
  HomePresenter(
    this._viewModel,
  );
  void setThemView(value) {
    Common.selectedTheme = value;
    print(value["code"]);
    print("CallNativeUtils.invokeMethod(changeTheme, {code: value[code]});");
    MyApp.blogTheme.sink().add(value["code"]);
  }

  void setThemeApp(value) {
    _baseView.uiUpdate({"key": "load", "value": true});
    InterstitialAd myInterstitial = InterstitialAd(
      adUnitId: Common.INTER_ADS,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.closed) {
          CallNativeUtils.invokeMethod(
              method: "changeTheme", aguments: {"code": value["code"]});
          _baseView.uiUpdate({"key": "load", "value": false});
        }
      },
    );
    myInterstitial
      ..load()
      ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
          horizontalCenterOffset: 0.0);
  }

  @override
  void init(BaseView view) {
    _baseView = view;
  }

  void rate() {
    CallNativeUtils.invokeMethod(method: "rateManual");
  }

  void intentSetting(BuildContext context, myBanner) {
    IntentAnimation.intentNomal(
        context: context,
        screen: SettingScreen(myBanner),
        option: IntentAnimationOption.RIGHT_TO_LEFT,
        duration: Duration(milliseconds: 400));
  }

  void intentWallpaper(BuildContext context, callBack) {
    InterstitialAd myInterstitial = InterstitialAd(
      adUnitId: Common.INTER_ADS,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.loaded) {}
        if (event == MobileAdEvent.opened) {
          print("loaded");
        }
        if (event == MobileAdEvent.closed) {
          IntentAnimation.intentNomal(
                  context: context,
                  screen: Wallpaper(() {}),
                  option: IntentAnimationOption.RIGHT_TO_LEFT,
                  duration: Duration(milliseconds: 500))
              .then((value) {
            callBack();
          });
        }
      },
    );
    myInterstitial
      ..load()
      ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
          horizontalCenterOffset: 0.0);
  }
}
