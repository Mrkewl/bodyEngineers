import 'package:body_engineer/widgets/HomePage/containers/AppBar.dart';
import 'package:body_engineer/widgets/HomePage/containers/FeaturesWidget.dart';
import 'package:body_engineer/widgets/HomePage/containers/SideDrawer.dart';
import 'package:body_engineer/widgets/HomePage/containers/TodayWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    var _features = [
      [
        {
          "name": "Dashboard",
          "icon": Icon(
            Icons.dashboard,
            size: 30,
            color: Colors.blue[900],
          )
        },
        {
          "name": "Exercises",
          "icon": Icon(
            Icons.directions_run,
            size: 30,
            color: Colors.green[700],
          )
        },
        {
          "name": "Programs",
          "icon": Icon(
            Icons.book,
            size: 30,
            color: Colors.purple[400],
          )
        },
        {
          "name": "Calendar",
          "icon": Icon(
            Icons.calendar_today,
            size: 30,
            color: Colors.yellow[700],
          )
        }
      ],
    ];
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: applicationBar(),
      drawer: sideDrawer(context),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            featuresWidget(_features),
            todayWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
