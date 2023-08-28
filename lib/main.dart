import 'package:custom_bottom_navigation_bar/style_1/style_one_one_screen.dart';
import 'package:custom_bottom_navigation_bar/style_1/stype_one_screen.dart';
import 'package:custom_bottom_navigation_bar/style_2/style_two.dart';
import 'package:custom_bottom_navigation_bar/style_3/style_three.dart';
import 'package:custom_bottom_navigation_bar/style_4/style_four.dart';
import 'package:custom_bottom_navigation_bar/style_five/style_five.dart';
import 'package:custom_bottom_navigation_bar/style_sevent/style_seven_screen.dart';
import 'package:custom_bottom_navigation_bar/style_six/style_six_screen.dart';
import 'package:custom_bottom_navigation_bar/widget/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guide Book',
      theme: ThemeData(
       // colorScheme: AppColor.primary,
        primaryColor: AppColor.primary,
        useMaterial3: true,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text('Tu'),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Text('Style 1'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StyleOne()));
              },
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Text('Style 1.1'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StyleOneOne()));
              },
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Text('Style 2'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StyleTwo()));
              },
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Text('Style 3'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StyleThree()));
              },
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Text('Style 4'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StyleFour()));
              },
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Text('Style 5'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StyleFiveScreen()));
              },
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Text('Style 6'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StyleSixScreen()));
              },
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: const Text('Style 7'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StyleSevenScreen()));
              },
            ),
          ),
        ],),
      ),
    );
  }

}


