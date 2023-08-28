import 'package:custom_bottom_navigation_bar/style_1/stype_one_screen.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_home.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_library.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_profile.dart';
import 'package:custom_bottom_navigation_bar/widget/app_color.dart';
import 'package:custom_bottom_navigation_bar/widget/customPainter.dart';
import 'package:custom_bottom_navigation_bar/widget/item_bottom_menu.dart';
import 'package:flutter/material.dart';

class StyleOneOne extends StatefulWidget {
  const StyleOneOne({super.key});

  @override
  State<StyleOneOne> createState() => _StyleOneOneState();
}

class _StyleOneOneState extends State<StyleOneOne> {
  int currentIndex=1;
  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );
  List<Widget> lisScreen=[
    const TabLibrary(),
    const TabHome(),
    const TabProfile(),
  ];
  double heightNavigation = 58;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text('Style 1.1'),
      ),
      body: buildPageView(),

      bottomNavigationBar: Stack(
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
                bottomTapped(1);
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
            height: heightNavigation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customTab('menu_book','Thư viện',currentIndex == 0?true:false,(){
                  bottomTapped(0);
                }),

                Container(
                  width: size.width * 0.20,
                ),
                customTab('menu_profile','Hồ sơ',currentIndex == 2?true:false,(){
                  bottomTapped(2);
                }),
              ],
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
      children:lisScreen,
    );
  }
  void pageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  void bottomTapped(int index) {
    setState(() {
      currentIndex = index;
     // pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      pageController.jumpToPage(currentIndex);
    });
  }
}
