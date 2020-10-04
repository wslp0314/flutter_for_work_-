import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
       body: Center(
          child: Container(
            child: Text("首页",),
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
