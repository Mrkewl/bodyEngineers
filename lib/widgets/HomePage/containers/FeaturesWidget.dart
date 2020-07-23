import 'package:flutter/material.dart';

final featuresWidget = (features) => Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: features
                .map<Widget>((featureRow) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: featureRow
                        .map<Widget>((feature) => featureButton(feature))
                        .toList()))
                .toList())));

void onFeaturePressed(name) {
  switch (name.toString().toLowerCase()) {
    case "dashboard":
      break;
    case "exercise":
      break;
    case "dashboard":
      break;
    default:
      break;
  }
}

Widget featureButton(feature) => Material(
    borderRadius: BorderRadius.circular(4),
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(4),
      radius: 40,
      onTap: () => onFeaturePressed(feature["name"]),
      splashColor: Colors.grey,
      child: Column(children: <Widget>[
        Container(
          width: 40,
          height: 40,
          child: feature["icon"] ??
              Icon(
                Icons.warning,
                size: 30,
              ),
        ),
        Text(
          feature["name"],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ]),
    ));
