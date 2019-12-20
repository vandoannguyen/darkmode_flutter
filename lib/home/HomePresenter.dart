import 'package:darkmode/base/BasePresenter.dart';
import 'package:darkmode/base/BaseView.dart';
import 'package:darkmode/common/Common.dart';
import 'package:darkmode/home/HomeViewModel.dart';
import 'package:darkmode/main.dart';

class HomePresenter implements BasePresenter {
  HomeViewModel _viewModel;
  BaseView _baseView;
  HomePresenter(
    this._viewModel,
  );
  void setThemView(value) {
    Common.selectedTheme = value;
    print(value["code"]);
    print("MyApp.platform.invokeMethod(changeTheme, {code: value[code]});");
    MyApp.blogTheme.sink().add(value["code"]);
  }

  void setThemeApp(value) {
    print(value["code"]);
    MyApp.platform.invokeMethod("changeTheme", {"code": value["code"]});
  }

  @override
  void init(BaseView view) {
    // TODO: implement init
    _baseView = view;
  }
}
