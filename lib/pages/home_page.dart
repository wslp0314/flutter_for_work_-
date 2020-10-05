import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1831347686,445775906&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1831347686,445775906&fm=26&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1831347686,445775906&fm=26&gp=0.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:MediaQuery.removePadding(
         removeTop: true,
         context: context,
         child: Stack(
           children: [
             NotificationListener (
                 child: ListView(
                   children: [
                     _banner,
                     Text("姜贞羽"),
                   ],
                 ),

                 onNotification:(notification ) {
                   if (notification is ScrollUpdateNotification &&
                       notification.depth ==0)
                   _onScroll(notification.metrics.pixels);


                 }
             ),
             Opacity(opacity: appBarAlpha,
             child: Container(
               height: 80,
               decoration: BoxDecoration(color: Colors.white),
               child: Center(
                 child: Text("首页"),
               ),
             ),
             )
           ],
         ),
       ),

    );



  }

  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        autoplay: true,
        loop: true,
        pagination: SwiperPagination(),
        itemCount: _imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(_imageUrls[index],fit: BoxFit.contain);
        },
      ),
    );
  }
  double appBarAlpha = 0;

  void _onScroll(pixels) {
    double alpha = pixels / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha >= 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
      print(alpha);
    });
  }
//  Widget get _banner {
//    return Container(
//      height: 160,
//      child: Swiper(
//        autoplay: true,
//        loop: true,
//        pagination: SwiperPagination(),
//        itemCount: bannerList.length,
//        itemBuilder: (BuildContext context, int index) {
//          return CachedImage(
//            imageUrl: bannerList[index].icon,
//            fit: BoxFit.fill,
//          );
//        },
//        onTap: (index) {
////          NavigatorUtil.push(
////              context,
////              WebView(
////                url: bannerList[index].url,
////                hideAppBar: bannerList[index].hideAppBar,
////                title: bannerList[index].title,
////              ));
//        },
//      ),
//    );
}
