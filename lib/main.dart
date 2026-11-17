import 'package:flutter/material.dart';
import 'widgets/radius_sliders.dart';
import 'widgets/rounded_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD0BCFF),
          centerTitle: true,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _topLeft = 0;
  double _topRight = 0;
  double _bottomLeft = 0;
  double _bottomRight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            RoundedBox(
              topLeft: _topLeft,
              topRight: _topRight,
              bottomLeft: _bottomLeft,
              bottomRight: _bottomRight,
            ),
            const SizedBox(height: 48),
            RadiusSliders(
              topLeft: _topLeft,
              topRight: _topRight,
              bottomLeft: _bottomLeft,
              bottomRight: _bottomRight,
              onTopLeftChanged: (v) => setState(() => _topLeft = v),
              onTopRightChanged: (v) => setState(() => _topRight = v),
              onBottomLeftChanged: (v) => setState(() => _bottomLeft = v),
              onBottomRightChanged: (v) => setState(() => _bottomRight = v),
            ),
          ],
        ),
      ),
    );
  }
}