import 'package:admob_flutter/admob_flutter.dart';
import 'package:darkmode/common/Common.dart';
import 'package:flutter/material.dart';

class FAQView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text(
          "Frequently Asked Questions",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
//            Expanded(
//                child: SingleChildScrollView(
//                    child: Html(
//              data: """<div>${Common.htmlDetail}</div>""",
//              padding: EdgeInsets.all(15),
//            ))),
            Container(
              height: 150,
              child: AdmobBanner(
                adSize: AdmobBannerSize.LARGE_BANNER,
                adUnitId: Common.BANNER_ADS,
              ),
            )
          ],
        ),
      ),
    );
  }
}
