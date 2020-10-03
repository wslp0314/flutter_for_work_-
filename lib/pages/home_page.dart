import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Swiper.,
                )
              ],
            ),
          ),
       ),
    );



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
