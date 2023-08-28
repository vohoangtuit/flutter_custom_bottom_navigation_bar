import 'package:custom_bottom_navigation_bar/tabs/tab_library.dart';
import 'package:custom_bottom_navigation_bar/widget/app_color.dart';
import 'package:flutter/material.dart';

import '../tabs/tab_home.dart';
import '../tabs/tab_profile.dart';
import '../widget/item_bottom_menu.dart';

class StyleFour extends StatefulWidget {
  const StyleFour({super.key});

  @override
  State<StyleFour> createState() => _StyleFourState();
}

class _StyleFourState extends State<StyleFour> {
  int positionPage = 1;
  double heightNavigation =55;

  List<Widget> listScreen = [
    const TabLibrary(),
    const TabHome(),
    const TabProfile(),
  ];
  PageController  pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );
  void pageChanged(int index) {
    setState(() {
      positionPage = index;
    });
  }
  void bottomTapped(int index) {
    setState(() {
      positionPage = index;
     // pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      pageController.jumpToPage(index);
    });
  }
  @override
  void initState() {
    super.initState();

  }
  Widget buildPageView() {
    return PageView(
      controller: pageController,
    //  physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: const <Widget>[
        TabLibrary(),
        TabHome(),
        TabProfile(),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Style 4')),
      extendBody: true,
      //body: listScreen[currentIndex],
      body: buildPageView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 55.0,
          width: 55.0,
          child: FloatingActionButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))
            ),
            backgroundColor: AppColor.primary,
            onPressed: () {
              bottomTapped(1);
            },
            child:  Icon(
              Icons.calendar_month_outlined,
              color: positionPage==1?Colors.white:Colors.black54,
            ),
           //  elevation: 5.0,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColor.primary,
        clipBehavior: Clip.antiAlias,

        height: heightNavigation,
        notchMargin: 18.0,
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
        shape: const CircularNotchedRectangle(),

      //elevation:8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            customTab('menu_book','Thư viện',positionPage == 0?true:false,(){
              bottomTapped(0);

            }),
            Container(),
            customTab('menu_profile','Hồ sơ',positionPage == 2?true:false,(){
              bottomTapped(2);
            }),
          ],
        ),
      ),
    );
  }
}
