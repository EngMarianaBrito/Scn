import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/widgets/profile_image_nutricionist.dart';

class ProfileNutricionistPage extends StatelessWidget {
  final double rating;
  final String name, formation, profileImage;
  ProfileNutricionistPage(
      this.name, this.formation, this.rating, this.profileImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: NutricionistPageHeader(profileImage: profileImage, minView: 400.0),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          name,
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Theme.of(context).primaryColor),
                        ),
                        subtitle: Text(formation),
                        trailing: SmoothStarRating(
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
                      Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem'
                          'ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum;',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Divider(),
                      ),
                      Container(
                        child: Text(
                          'Avaliações',
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Theme.of(context).primaryColor),
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
          )
        ],
      ),
    );
  }
}

// Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Stack(
//             children: <Widget>[
//               Container(
//                 width: _width,
//                 child: Image.network(
//                   profileImage,
//                   width: _width,
//                 ),
//               ),
//               Positioned(
//                 right: 20.0,
//                 bottom: 20.0,
//                 child: FlatButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                     side: BorderSide(color: Colors.white),
//                   ),
//                   onPressed: () => Get.to(NutricionistRequestPage()),
//                   color: Theme.of(context).primaryColor,
//                   child: Text(
//                     'Solicitar consulta',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: 2 + 1,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (context, index) {
//                   if (index == 0) {
//                     return Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           ListTile(
//                             contentPadding: EdgeInsets.zero,
//                             title: Text(
//                               name,
//                               style: TextStyle(
//                                   fontSize: 22.0,
//                                   color: Theme.of(context).primaryColor),
//                             ),
//                             subtitle: Text(formation),
//                             trailing: SmoothStarRating(
//                               rating: rating,
//                               isReadOnly: true,
//                               size: 20,
//                               filledIconData: Icons.star,
//                               halfFilledIconData: Icons.star_half,
//                               defaultIconData: Icons.star_border,
//                               starCount: 5,
//                               allowHalfRating: true,
//                               spacing: 2.0,
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
//                             child: Text(
//                               'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem'
//                               'ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum;',
//                               style: TextStyle(fontSize: 16.0),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 10.0, vertical: 10.0),
//                             child: Divider(),
//                           ),
//                           Container(
//                             child: Text(
//                               'Avaliações',
//                               style: TextStyle(
//                                   fontSize: 22.0,
//                                   color: Theme.of(context).primaryColor),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                   return Container(
//                     margin: EdgeInsets.only(top: 5.0),
//                       child: ListTile(
//                     leading: CircleAvatar(),
//                     title: Text('Paciente X'),
//                     subtitle: Text(
//                         'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum '),
//                   ));
//                 }),
//           )
//         ],
//       )
