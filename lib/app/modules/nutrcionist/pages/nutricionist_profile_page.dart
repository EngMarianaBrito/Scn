import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/controllers/nutricionist_profile_controller.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/nutricionist_send_rating_page.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProfileNutricionistPage extends StatefulWidget {
  final int nutricionistId;
  final double rating;
  final String name, formation, profileImage, descripition;
  ProfileNutricionistPage(this.nutricionistId, this.name, this.formation, this.rating,
      this.profileImage, this.descripition);

  @override
  _ProfileNutricionistPageState createState() =>
      _ProfileNutricionistPageState();
}

class _ProfileNutricionistPageState extends State<ProfileNutricionistPage> {
  var top = 0.0;
  final NutricionistProfileController controller =
      Get.put<NutricionistProfileController>(NutricionistProfileController());

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              expandedHeight: 350.0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                    background: Stack(
                  children: <Widget>[
                    Container(
                      width: _width,
                      child: Image.network(
                        widget.profileImage,
                        width: _width,
                      ),
                    ),
                  ],
                ));
              })),
        ];
      },
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 22.0, color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text(widget.formation),
                  trailing: SmoothStarRating(
                    rating: widget.rating,
                    isReadOnly: true,
                    size: 20,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,
                  ),
                  onTap: () {
                    Get.to(NutricionistSendRatingPage(widget.nutricionistId));
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    widget.descripition ?? 'Sem descrição.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => Get.toNamed('/nutricionist_request'),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Solicitar consulta',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Divider(),
                ),
                Container(
                  child: Text(
                    'Avaliações',
                    style: TextStyle(
                        fontSize: 22.0, color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: controller.fetchRating(widget.nutricionistId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Get.theme.primaryColor),
                      ),
                    );
                  } else {
                    var data = controller.data.data;

                    if (data.length == 0) {
                      return Container(
                        margin: EdgeInsets.only(top: 40.0),
                        child: Text(
                          'Ainda não há avaliações para este profissional.',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 15.0),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    foregroundColor:
                                        Theme.of(context).primaryColor,
                                    backgroundImage: NetworkImage(
                                        data[index].profileImage.toString()),
                                  ),
                                  title: Text(
                                    data[index].name,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  trailing: SmoothStarRating(
                                    rating: data[index].rating,
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
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 20.0, right: 20.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    data[index].comment,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    ));
  }
}
