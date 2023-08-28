import 'package:custom_bottom_navigation_bar/tabs/tab_home.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_library.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_profile.dart';
import 'package:custom_bottom_navigation_bar/widget/app_color.dart';
import 'package:custom_bottom_navigation_bar/widget/customPainter.dart';
import 'package:custom_bottom_navigation_bar/widget/item_bottom_menu.dart';
import 'package:flutter/material.dart';

class StyleOne extends StatefulWidget {
  const StyleOne({super.key});

  @override
  State<StyleOne> createState() => _StyleOneState();
}

class _StyleOneState extends State<StyleOne> {
  int currentIndex = 1;
  double heightNavigation = 58;
  List<Widget> listScreen = [
    const TabLibrary(),
    const TabHome(),
    const TabProfile(),
  ];
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text('Style 1'),
      ),
     body: Stack(
       children: [
         listScreen[currentIndex],
        // buildPageView(),
         Positioned(
           bottom: 0,
           left: 0,
           child: Container(
             width: size.width,
             height: heightNavigation,
             child: Stack(

               children: [
                 CustomPaint(
                   size: Size(size.width, heightNavigation),
                   painter: BNBCustomPainter(),
                 ),
                 Center(
                   heightFactor: 0.56,
                   child:
                   FloatingActionButton(
                     shape: const RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(32.0))
                     ),
                     backgroundColor: AppColor.primary,
                     onPressed: () {
                       setState(() {
                         currentIndex =1;
                       });
                     },
                     child:  Icon(
                       Icons.calendar_month_outlined,
                       color: currentIndex==1?Colors.white:Colors.black26,
                     ),
                     //  elevation: 5.0,
                   ),
                 ),
                 Container(
                   width: size.width,
                   height: 80,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       customTab('menu_book','Thư viện',currentIndex == 0?true:false,(){
                         pageChanged(0);
                       }),

                       Container(
                         width: size.width * 0.20,
                       ),
                       customTab('menu_profile','Hồ sơ',currentIndex == 2?true:false,(){
                         pageChanged(2);
                       }),
                     ],
                   ),
                 )
               ],
             ),
           ),
         )
       ],
     ),
    );
  }
  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children:  const <Widget>[
        TabLibrary(),
        TabHome(),
        TabProfile(),
      ],
    );
  }
  void pageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
