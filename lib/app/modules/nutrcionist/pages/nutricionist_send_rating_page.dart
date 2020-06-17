import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/controllers/nutricionist_profile_controller.dart';
import 'package:nutricao/app/shared/globals.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class NutricionistSendRatingPage extends StatelessWidget {
  final int nutricionistId;
  final Globals globals = Get.find();
  final NutricionistProfileController controller = Get.find<NutricionistProfileController>();
  NutricionistSendRatingPage(this.nutricionistId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          globals.logo,
          fit: BoxFit.contain,
          width: 50.0,
          height: 50.0,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: globals.primaryColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Como foi sua experiência com este profissional?',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: SmoothStarRating(
                rating: 0.0,
                onRated: (value) => controller.setRating(value),
                isReadOnly: false,
                size: 35,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                allowHalfRating: true,
                spacing: 2.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextFormField(
                onChanged: controller.setComment,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Comentário',
                  hintText: 'Deixe um comentário'
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () => controller.sendNutricionistRating(nutricionistId),
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Avaliar',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
