import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperWt extends StatelessWidget {
  final List swiperList;
  const SwiperWt({Key key, this.swiperList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            '${swiperList[index]}',
            fit: BoxFit.cover
          );
        },
        itemCount: swiperList.length,
        pagination: SwiperPagination(),
        control: new SwiperControl(),
        autoplay: true,
      )
    );
  }
}

 