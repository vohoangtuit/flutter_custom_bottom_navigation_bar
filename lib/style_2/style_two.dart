import 'package:custom_bottom_navigation_bar/tabs/tab_home.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_library.dart';
import 'package:custom_bottom_navigation_bar/tabs/tab_profile.dart';
import 'package:custom_bottom_navigation_bar/widget/app_color.dart';
import 'package:custom_bottom_navigation_bar/widget/item_bottom_menu.dart';
import 'package:flutter/material.dart';

class StyleTwo extends StatefulWidget {
  const StyleTwo({super.key});

  @override
  State<StyleTwo> createState() => _StyleTwoState();
}

class _StyleTwoState extends State<StyleTwo> {
  final List<Widget> screens=[
    const TabLibrary(),
    const TabHome(),
    const TabProfile(),
  ];

  int currentScreen=1;
  List<BottomNavigationBarItem> listTabs(){

    return [

      BottomNavigationBarItem(
      icon: itemMenu('menu_book',currentScreen==0?true:false,library),
      //icon: Icon(Icons.add),
      label: '',
    ),
      BottomNavigationBarItem(
       icon: itemMenu('menu_calender',currentScreen==1?true:false,schedule),
        //icon: Icon(Icons.add),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: itemMenu('menu_profile',currentScreen==2?true:false,profile),
       // icon: Icon(Icons.add),
        label: '',
      ),];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StyleTwo'), backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
      body: screens[currentScreen],
      bottomNavigationBar: SafeArea(

        child: Container(
          //height: 78,
          child: BottomNavigationBar(
            backgroundColor: AppColor.primary,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,// change height
            currentIndex:  currentScreen,
            onTap: (index){
              _tabChange(index);
            },
            items: listTabs(),
          ),
        ),
      ),
    );
  }
   _tabChange(int index){
    setState(() {
      setState(() {
        currentScreen=index;
        screens[currentScreen];
      });
    });
  }
}
