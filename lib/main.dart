import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isStacked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('HomePage'),
            child: Screen1(
              onTap: (value) {
                isStacked = value;
                setState(() {});
              },
            ),
          ),
          if (isStacked == true)
            MaterialPage(
              child: Screen2(),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;
          setState(() => isStacked = false);
          return true;
        },
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  Function(bool) onTap;

  Screen1({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator 2.0"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            onTap(true);
          },
          child: Text(
            'Screen 1 \n tap on text to maove to screen2',
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back to Screen 1"),
      ),
      body: Center(
        child: InkWell(
          child: Text(
            'Screen 2 ',
          ),
        ),
      ),
    );
  }
}
