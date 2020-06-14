import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/nutrcionist_request_page.dart';

class NutricionistPageHeader extends SliverPersistentHeaderDelegate {
  final double minView;
  final String profileImage;
  NutricionistPageHeader({this.profileImage, this.minView});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double _width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Container(
          width: _width,
          child: Image.network(
            profileImage,
            width: _width,
          ),
        ),
        Positioned(
          right: 20.0,
          bottom: 20.0,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: BorderSide(color: Colors.white),
            ),
            onPressed: () => Get.to(NutricionistRequestPage()),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Solicitar consulta',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    ));
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => minView + 100.0;

  @override
  double get minExtent => minView;
}
