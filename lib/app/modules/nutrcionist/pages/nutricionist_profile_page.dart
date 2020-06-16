import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProfileNutricionistPage extends StatefulWidget {
  final double rating;
  final String name, formation, profileImage;
  ProfileNutricionistPage(
      this.name, this.formation, this.rating, this.profileImage);

  @override
  _ProfileNutricionistPageState createState() =>
      _ProfileNutricionistPageState();
}

class _ProfileNutricionistPageState extends State<ProfileNutricionistPage> {
  var top = 0.0;

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
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem'
                    'ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum;',
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
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2 + 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text('Paciente X'),
                        subtitle: Text(
                            'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum '),
                      ));
                }),
          )
        ],
      ),
    ));
  }
}