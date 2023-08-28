import 'package:custom_bottom_navigation_bar/tabs/tab_library.dart';
import 'package:custom_bottom_navigation_bar/widget/item_bottom_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tabs/tab_home.dart';
import '../tabs/tab_profile.dart';
import '../widget/app_color.dart';

class StyleThree extends StatefulWidget {
  const StyleThree({super.key});

  @override
  State<StyleThree> createState() => _StyleThreeState();
}

class _StyleThreeState extends State<StyleThree> with SingleTickerProviderStateMixin{
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
  List<BottomNavigationBarItem> lisTab(){
    return [   BottomNavigationBarItem(
      icon: itemMenu('menu_book',currentIndex==0?true:false,library),
      label: '',
    ),
      BottomNavigationBarItem(
        icon: itemMenu('menu_calender',currentIndex==1?true:false,schedule),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: itemMenu('menu_profile',currentIndex==2?true:false,profile),
        label: '',
      ),];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StyleThree'), backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
      body: buildPageView(),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: lisTab(),
        currentIndex: currentIndex,
        selectedFontSize: 0,// change height
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          bottomTapped(index);
        },
        backgroundColor: AppColor.primary,

      ),
    );
  }
  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: lisScreen,
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
      pageController.jumpToPage(index);
     // pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
