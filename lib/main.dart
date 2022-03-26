import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'KanTech'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _fontSize = 10000.0;
  List<List<int>> _results = [[], [], [], [], [], []];
  // List<List<int>> _results = [[], [], [], [], [], []];
  double _screenHeight = 0;
  double? _appBarHeight;
  final int _numOfRow = 6;
  double _heightWithoutAppBar = 0;
  double _heightPerRowWithoutAppBar = 0;
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    _screenHeight = MediaQuery.of(context).size.height;
    _appBarHeight = AppBar().preferredSize.height;
    _heightWithoutAppBar = _screenHeight - _appBarHeight!;
    _heightPerRowWithoutAppBar = _heightWithoutAppBar / _numOfRow;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: _heightPerRowWithoutAppBar,
                width: screenWidth,
                alignment: const Alignment(0, 0),
                color: Colors.blue[50],
                child: displayOneRow(3)),
            Container(
                height: _heightPerRowWithoutAppBar,
                width: screenWidth,
                alignment: const Alignment(0, 0),
                color: Colors.blue[100],
                child: displayOneRow(2)),
            Container(
                height: _heightPerRowWithoutAppBar,
                width: screenWidth,
                alignment: const Alignment(0, 0),
                color: Colors.blue[200],
                child: displayOneRow(1)),
            Container(
                height: _heightPerRowWithoutAppBar,
                width: screenWidth,
                alignment: const Alignment(0, 0),
                color: Colors.blue[300],
                child: displayOneRow(0)),
            Container(
                height: _heightPerRowWithoutAppBar,
                width: screenWidth,
                alignment: const Alignment(0, 0),
                color: Colors.blue[400],
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Icon(Icons.looks_6, size: _fontSize)),
                      FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Icon(Icons.looks_5, size: _fontSize)),
                      FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Icon(Icons.looks_4, size: _fontSize)),
                      FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Icon(Icons.looks_3, size: _fontSize)),
                      FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Icon(Icons.looks_two, size: _fontSize)),
                      FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Icon(Icons.looks_one, size: _fontSize)),
                    ])),
            Container(
              height: (_screenHeight - _appBarHeight!) / 6,
              width: screenWidth,
              alignment: const Alignment(0, 0),
              color: Colors.blue,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    displayButtons(5),
                    displayButtons(4),
                    displayButtons(3),
                    displayButtons(2),
                    displayButtons(1),
                    displayButtons(0)
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget displayOneRow(int _row) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      FittedBox(fit: BoxFit.fitHeight, child: displayIcon(5, _row)),
      FittedBox(fit: BoxFit.fitHeight, child: displayIcon(4, _row)),
      FittedBox(fit: BoxFit.fitHeight, child: displayIcon(3, _row)),
      FittedBox(fit: BoxFit.fitHeight, child: displayIcon(2, _row)),
      FittedBox(fit: BoxFit.fitHeight, child: displayIcon(1, _row)),
      FittedBox(fit: BoxFit.fitHeight, child: displayIcon(0, _row)),
    ]);
  }

  Widget displayButtons(int _standingNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
            fit: BoxFit.fitWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                    fit: BoxFit.fitHeight,
                    child: IconButton(
                        iconSize: 1000,
                        icon: const Icon(Icons.trip_origin),
                        tooltip: 'hit',
                        onPressed: () {
                          setState(() {
                            hit(_standingNum);
                          });
                        })),
                FittedBox(
                    fit: BoxFit.fitHeight,
                    child: IconButton(
                        iconSize: 1000,
                        icon: const Icon(Icons.clear),
                        tooltip: 'missed',
                        onPressed: () {
                          setState(() {
                            missed(_standingNum);
                          });
                        })),
              ],
            )),
        FittedBox(
            fit: BoxFit.fitWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                    fit: BoxFit.fitHeight,
                    child: IconButton(
                        iconSize: 1000,
                        icon: const Icon(Icons.question_mark),
                        tooltip: 'unknown',
                        onPressed: () {
                          setState(() {
                            question(_standingNum);
                          });
                        })),
                FittedBox(
                    fit: BoxFit.fitHeight,
                    child: IconButton(
                        iconSize: 1000,
                        icon: const Icon(Icons.backspace),
                        tooltip: 'undo',
                        onPressed: () {
                          setState(() {
                            undo(_standingNum);
                          });
                        })),
              ],
            )),
      ],
    );
  }

  void hit(int i) {
    if (_results[i].length > 3) return;
    _results[i].add(1);
  }

  void missed(int i) {
    if (_results[i].length > 3) return;
    _results[i].add(0);
  }

  void question(int i) {
    if (_results[i].length > 3) return;
    _results[i].add(2);
  }

  void undo(int i) {
    if (_results[i].isEmpty) return;
    _results[i].removeAt(_results[i].length - 1);
  }

  Icon displayIcon(int i, int j) {
    if (_results[i].length <= j) return const Icon(Icons.remove, size: 1000.0);
    if (_results[i][j] == 1) {
      return const Icon(Icons.trip_origin, size: 10000.0);
    }
    if (_results[i][j] == 0) {
      return const Icon(Icons.clear, size: 10000.0);
    }
    if (_results[i][j] == 2) {
      return const Icon(Icons.question_mark, size: 10000.0);
    }
    return const Icon(Icons.more_horiz, size: 10000.0);
  }
}
