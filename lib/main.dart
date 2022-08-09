import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Container(
            width: 1000, child: Image.asset('assets/images/logo.png')),
        backgroundColor: Colors.red,
        nextScreen: const MainScreen(),
        splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MainScreen> {
  int counter = 0;
  int memoryValue = 0;
  int backup = 0;
  double buttonWidth = 50;
  void increment() {
    setState(() {
      counter++;
      backup = counter;
    });
  }

  void increment2by() {
    setState(() {
      counter += 2;
      backup = counter;
    });
  }

  void increment3by() {
    setState(() {
      counter += 3;
      backup = counter;
    });
  }

  void setMemory() {
    setState(() {
      memoryValue = counter;
    });
  }

  void getMemory() {
    setState(() {
      counter = memoryValue;
      backup = counter;
    });
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

  void accident() {
    setState(() {
      counter = backup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Counter'),
      ),
      body: Column(
        children: [
          const Center(
              child: const Text(
            'You can count numbers easily',
            style: TextStyle(color: Colors.green, fontSize: 30),
          )),
          Image.asset('assets/images/math.jpg'),
          Container(
            width: 400,
            color: Colors.red,
          ),
          SizedBox(
            height: 50,
            child: Text(
              '$counter',
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: buttonWidth,
                    child: Card(
                      child: ElevatedButton(
                          onPressed: increment,
                          child: Text('by one',
                              style: const TextStyle(fontSize: 30))),
                    )),
                SizedBox(
                    height: buttonWidth,
                    child: Card(
                      child: ElevatedButton(
                          onPressed: increment2by,
                          child: Text('by two',
                              style: const TextStyle(fontSize: 30))),
                    )),
                SizedBox(
                  height: buttonWidth,
                  child: Card(
                    child: ElevatedButton(
                        onPressed: increment3by,
                        child: Text('by three',
                            style: const TextStyle(fontSize: 30))),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: buttonWidth,
                    child: Card(
                      child: ElevatedButton(
                          onPressed: reset,
                          child: Text('Reset',
                              style: const TextStyle(fontSize: 30))),
                    )),
                SizedBox(
                    height: buttonWidth,
                    child: Card(
                      child: ElevatedButton(
                          onPressed: setMemory,
                          child: Text('Set Memory',
                              style: const TextStyle(fontSize: 30))),
                    )),
                SizedBox(
                    height: buttonWidth,
                    child: Card(
                      child: ElevatedButton(
                          onPressed: getMemory,
                          child: Text('Get Memory',
                              style: const TextStyle(fontSize: 30))),
                    )),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: ElevatedButton(
                      onPressed: accident,
                      child: Text('Accident',
                          style: const TextStyle(fontSize: 30))),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Developed by sachira madhushan',
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
