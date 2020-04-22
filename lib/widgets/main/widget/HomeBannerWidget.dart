import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/main/bean/BannerBean.dart';
import 'package:flutter_app/widgets/main/repository/main_repository.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeBannerWidget extends StatelessWidget {
  HomeBannerWidget(this.data, {Key key}) : super(key: key);
  final BannerBean data;

  @override
  Widget build(BuildContext context) {
    if (data != null && data.data != null) {
      return bannerItem(data.data);
    } else {
      return Container();
    }
  }
}

Widget bannerItem(List<Data> data) {
  return AspectRatio(
    aspectRatio: 16/9,
    child: Swiper(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
            child: Stack(
          children: <Widget>[
            new CachedNetworkImage(
                width: double.infinity,
                imageUrl: data[index].imagePath,
                fit: BoxFit.fill,
                fadeInDuration: const Duration(milliseconds: 50)),
          ],
        ));
      },
      pagination: new SwiperPagination(),
      autoplay: true,
    ),
  );
}
