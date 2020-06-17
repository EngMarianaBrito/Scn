import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/controllers/nutricionist_list_controller.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/nutricionist_profile_page.dart';

class CardNutricionist extends StatelessWidget {
  final int nutricionistId;
  final double rating;
  final String name, formation, profileImage, descripition;
  CardNutricionist(this.nutricionistId, this.name, this.formation, this.rating,
      this.profileImage, this.descripition);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NutricionistListController>(
      builder: (_) {
        return ListTile(
          onTap: () => Get.to(
            ProfileNutricionistPage(nutricionistId, name, formation, rating,
                profileImage, descripition),
          ),
          title: Text(name),
          subtitle: Container(
            margin: EdgeInsets.only(top: 5.0),
            child: SmoothStarRating(
              rating: rating,
              isReadOnly: true,
              size: 20,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 5,
              allowHalfRating: true,
              spacing: 2.0,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).primaryColor,
            backgroundImage: NetworkImage(
              profileImage,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }
}
