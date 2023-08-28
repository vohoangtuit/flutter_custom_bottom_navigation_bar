import 'package:custom_bottom_navigation_bar/tabs/tab_home.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_library.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_profile.dart';
import 'package:custom_bottom_navigation_bar/widget/app_color.dart';
import 'package:custom_bottom_navigation_bar/widget/item_bottom_menu.dart';
import 'package:flutter/material.dart';

class StyleFiveScreen extends StatefulWidget {
  const StyleFiveScreen({super.key});

  @override
  State<StyleFiveScreen> createState() => _StyleFiveScreenState();
}

class _StyleFiveScreenState extends State<StyleFiveScreen>with SingleTickerProviderStateMixin{
  int currentIndex = 1;
  double heightNavigation =55;

  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );
  List<BottomNavigationBarItem> lisTab(){
    return [
      BottomNavigationBarItem(
        icon: itemMenu('menu_book',currentIndex==0?true:false,library),
        //icon: Icon(Icons.add),
        label: '',
      ),

       BottomNavigationBarItem(
        icon: Container(),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: itemMenu('menu_profile',currentIndex==2?true:false,profile),
        // icon: Icon(Icons.add),
        label: '',
      ),

    ];
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Style 5')),
      extendBody: true,
      body:  buildPageView(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
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
              color: currentIndex==1?Colors.blueAccent:Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,// change height
        items: lisTab(),
        currentIndex: currentIndex,
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
      children: const <Widget>[
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
  void bottomTapped(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
