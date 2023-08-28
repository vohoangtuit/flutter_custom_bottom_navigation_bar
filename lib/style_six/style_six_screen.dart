import 'package:custom_bottom_navigation_bar/tabs/tab_home.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_library.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_profile.dart';
import 'package:custom_bottom_navigation_bar/widget/item_bottom_menu.dart';
import 'package:flutter/material.dart';

class StyleSixScreen extends StatefulWidget {
  const StyleSixScreen({super.key});

  @override
  State<StyleSixScreen> createState() => _StyleSixScreenState();
}

class _StyleSixScreenState extends State<StyleSixScreen>with SingleTickerProviderStateMixin {
  TabController? controller;
  int currentIndex=1;
  List<Widget> listScreen=[
    const TabLibrary(),
    const TabHome(),
    const TabProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Style 6')),
      body: TabBarView(
        // Add tabs as widgets
        controller: controller,
        // Add tabs as widgets
        children: listScreen,
      ),
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          padding:  EdgeInsets.only(top: 4,bottom: 0),
            indicator:BoxDecoration(),
            tabs:listTab(),
          indicatorColor: Colors.transparent,
          controller: controller,
          onTap: (index){
           _onChangeIndex(index);
          },
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this,initialIndex:1);
    controller!.addListener(_handleTabSelection);
  }
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  dynamic _handleTabSelection() {
    //if (controller!.indexIsChanging) {
    print('controller!.index ${controller!.index}');
      _onChangeIndex(controller!.index);
   // }
  }
  void _onChangeIndex(int index){
    setState(() {
      currentIndex =index;
    });
  }

  List<Tab> listTab(){
    return <Tab>[
      Tab(
          child: itemMenu('menu_book',currentIndex==0?true:false,'Thư viện')
      ),
      Tab(
          child: itemMenu('menu_calender',currentIndex==1?true:false,'Lịch Tour')
      ),
      Tab(
          child: itemMenu('menu_profile',currentIndex==2?true:false,'Hồ sơ')
      )
    ];
  }
}
