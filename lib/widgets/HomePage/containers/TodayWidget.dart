import 'package:flutter/material.dart';

final todayWidget = () => Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
    child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Today",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Container(
                    height: 30,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      color: Colors.white,
                      child: Text(
                        "ADD",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    intakeWidget(),
                    burnedWidget(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    //stepsWidget(),
                  ],
                ),
              ),
            ])));

final intakeWidget = () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          Icons.restaurant,
          size: 30,
          color: Colors.green[400],
        ),
        Text(
          '200',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          ' kcal',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );

final burnedWidget = () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          Icons.whatshot,
          size: 30,
          color: Colors.red[400],
        ),
        Text(
          '200',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          ' kcal',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );

final stepsWidget = () => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          Icons.directions_walk,
          size: 30,
          color: Colors.blue[400],
        ),
        Text(
          '3456',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          ' steps',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
