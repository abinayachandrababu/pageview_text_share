import 'package:flutter/material.dart';
import 'package:flutter_pageview_text_share/app_data_text.dart';
import 'package:flutter_pageview_text_share/display_text.dart'  ;
//import 'package:share_plus/share_plus.dart';

class PageViewText extends StatefulWidget {
  const PageViewText({Key? key}) : super(key: key);

  @override
  State<PageViewText> createState() => _PageViewTextState();
}

class _PageViewTextState extends State<PageViewText> {

  var selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          'Ratan Tata',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(value: 1, child: Text("Share")),
            ],
            onSelected: (value){
              if (value ==1){
                //_shareInfo();
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              controller: PageController(viewportFraction: 0.7),
              itemCount: appDataText.length,
              itemBuilder: (context, index) {
                var _quotes = appDataText [index];
                var _scale = selectedPage == index ? 1.0 : 0.8;
                return TweenAnimationBuilder(
                  duration: Duration(microseconds: 300),
                  tween: Tween(begin: _scale, end: _scale),
                  child: DisplayText(appDataText: _quotes),
                  builder: (context, value, child){
                    //2D
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    (selectedPage + 1).toString() + '/' +
                        appDataText.length.toString(),
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _shareInfo(){
    print('-------> Share');

    print(appDataText[selectedPage].text);

    //Share.share(appDataText[selectedPage].text);
  }

}
