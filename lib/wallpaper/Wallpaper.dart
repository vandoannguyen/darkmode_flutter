import 'dart:math';

import 'package:darkmode/base/BaseView.dart';
import 'package:darkmode/wallpaper/WallpaperPresenter.dart';
import 'package:darkmode/wallpaper/WallpaperViewModel.dart';
import 'package:darkmode/wallpaper_detail/WallPaperDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Wallpaper extends StatefulWidget {
  var callBack;
  dynamic data = {};
  WallpaperPresenter _presenter;
  WallpaperViewModel _viewModel;
  Wallpaper(this.callBack) {
    _viewModel = new WallpaperViewModel();
    _viewModel.data = data;
  }

  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper>
    with SingleTickerProviderStateMixin
    implements BaseView {
  TabController _tabController;
  PageController _pageViewController;

  @override
  void initState() {
    widget._presenter = new WallpaperPresenter(widget._viewModel);
    widget._presenter.init(this);
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _pageViewController = new PageController(initialPage: 0, keepPage: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.callBack();
    Navigator.pop(context);
//    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.callBack();
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Wallpaper",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        bottom: TabBar(
          onTap: (posotion) {
            _pageViewController.animateToPage(posotion,
                duration: Duration(milliseconds: 400), curve: Curves.linear);
          },
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.wb_sunny)),
            Tab(icon: Icon(Icons.tonality)),
          ],
        ),
      ),
      body: Container(
          child: PageView.builder(
              itemCount: 2,
              controller: _pageViewController,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, position) {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  physics: ScrollPhysics(),
                  itemCount: 35,
                  itemBuilder: (BuildContext context, int index) => Card(
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                        child: Hero(
                      tag: "hero${index}${position}",
                      child: GestureDetector(
                        onTap: () {
                          itemClick(index, position);
                        },
                        child: Image.asset(
                            position == 0
                                ? "android/app/src/main/assets/wallpaper/light/${index}.jpg"
                                : "android/app/src/main/assets/wallpaper/dark/${index}.jpg",
                            fit: BoxFit.cover),
                      ),
                    )),
                  ),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isEven ? 2.7 : 3),
                  scrollDirection: Axis.vertical,
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                );
              })),
    );
  }

  ranDomSize() {
    return (new Random().nextInt(5) * 0.1) + 2.5;
  }

  void itemClick(int index, position) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WallpaperDetail(index, position)));
//    IntentAnimation.intentNomal(context: context, screen: WallpaperDetail(index, position), option: Ri, duration: null)
  }

  @override
  uiUpdate(viewModel) {
    // TODO: implement uiUpdate
    return null;
  }
}
