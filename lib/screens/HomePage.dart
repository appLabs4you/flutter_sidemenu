import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final arrayOfCountries = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Estonia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Greece',
    'Hungary',
    'Iceland',
    'Ireland',
    'Italy',
    'Kazakhstan',
    'Kosovo',
    'Latvia',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia',
    'Malta',
    'Moldova',
    'Monaco',
    'Montenegro',
    'Netherlands',
    'Norway',
    'Poland',
    'Portugal',
    'Romania',
    'Russia',
    'San Marino',
    'Serbia',
    'Slovakia',
    'Slovenia',
    'Spain',
    'Sweden',
    'Switzerland',
    'Turkey',
    'Ukraine',
    'United Kingdom',
    'Vatican City'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color:Colors.white,
        child: Column(
      children: <Widget>[
        ListView.builder(
          itemCount: arrayOfCountries.length,
          itemBuilder: (context, index) {
            return Card(
              //                           <-- Card widget
              child: ListTile(
                leading: Icon(Icons.photo_album),
                title: Text(arrayOfCountries[index]),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            );
          },
        )
      ],
    ));
  }
}
