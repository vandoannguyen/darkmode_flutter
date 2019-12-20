import 'package:admob_flutter/admob_flutter.dart';
import 'package:darkmode/common/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FAQView extends StatelessWidget {
  BuildContext context;
  var callBack;

  FAQView(this.callBack);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        leading: GestureDetector(
          onTap: () {
            callBack();
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: 50,
            color: Colors.transparent,
            child: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        title: Text(
          "Frequently Asked Questions",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
            child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Html(
                  data: Common.htmlDetail,
                  padding: EdgeInsets.all(15),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AdmobBanner(
              adUnitId: Common.BANNER_ADS,
              adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
            )
          ],
        )),
      ),
    );
  }
}
