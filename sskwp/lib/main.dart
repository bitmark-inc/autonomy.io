import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulation Sketchbook: Works in Process',
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> lightImage = [
    'assets/light_page_1.png',
    'assets/light_page_2.png',
    'assets/light_page_3.png',
    'assets/light_page_4.png',
    'assets/light_page_5.png'
  ];
  final List<String> dartImage = [
    'assets/dark_page_1.png',
    'assets/dark_page_2.png',
    'assets/dark_page_3.png',
    'assets/dark_page_4.png',
    'assets/dark_page_5.png'
  ];

  List<String> display = [];
  bool isLight = true;
  bool isFullScreen = false;
  @override
  void initState() {
    super.initState();
    final window = WidgetsBinding.instance.window;
    if (window.platformBrightness == Brightness.light) {
      display = lightImage;
      isLight = true;
    } else {
      display = dartImage;
      isLight = false;
    }

    window.onPlatformBrightnessChanged = () {
      setState(() {
        if (window.platformBrightness == Brightness.light) {
          display = lightImage;
          isLight = true;
        } else {
          display = dartImage;
          isLight = false;
        }
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLight ? Colors.white : Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: display.length,
            itemBuilder: (context, index) => Image.asset(display[index]),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (!isFullScreen) {
                    document.documentElement?.requestFullscreen();
                  } else {
                    document.exitFullscreen();
                  }
                  isFullScreen = !isFullScreen;
                });
              },
              icon: Icon(
                isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                color: isLight ? Colors.black : Colors.white,
                size: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
