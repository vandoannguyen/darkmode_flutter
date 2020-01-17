import 'package:darkmode/base/BasePresenter.dart';
import 'package:darkmode/base/BaseView.dart';

import 'WallpaperViewModel.dart';

class WallpaperPresenter implements BasePresenter {
  BaseView _baseView;
  WallpaperViewModel _viewModel;

  WallpaperPresenter(this._viewModel);

  @override
  void init(BaseView view) {
    // TODO: implement init
    _baseView = view;
  }
}
