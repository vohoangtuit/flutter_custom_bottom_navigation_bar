import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
 String library ='Thư viện';
 String schedule ='Lịch Tour';
 String profile ='Hồ sơ';
Widget itemMenu(String namePath,bool active,String title ){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
   SvgPicture.asset('assets/svg/$namePath.svg',colorFilter: ColorFilter.mode(active?Colors.white:Colors.black54, BlendMode.srcIn),width: 22,height: 20,),
      const SizedBox(height: 5,),
      Text(title,style: TextStyle(color: active?Colors.white:Colors.black54,fontSize: 12.5),)
    ],
  );
}
 List<BottomNavigationBarItem> listTabs(int position){
  print('position $position');
  return [   BottomNavigationBarItem(
    icon: itemMenu('menu_book',position==0?true:false,library),
    label: '',
  ),
    BottomNavigationBarItem(
      icon: itemMenu('menu_calender',position==1?true:false,schedule),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: itemMenu('menu_profile',position==2?true:false,profile),
      label: '',
    ),];
}
List<BottomNavigationBarItem> listTabsWithOutHome(int position){
  return [   BottomNavigationBarItem(
    icon: itemMenu('menu_book',position==0?true:false,library),
    label: '',
  ),
    BottomNavigationBarItem(
      icon: itemMenu('menu_profile',position==2?true:false,profile),
      label: '',
    ),];
}

Widget customTab( String icon,String lable,bool active,  VoidCallback onSelected){
  return InkWell(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svg/$icon.svg',colorFilter: ColorFilter.mode(active?Colors.white:Colors.black54, BlendMode.srcIn),width: 22,height: 20,),
        Text(lable,style: TextStyle(color: active?Colors.white:Colors.black54,fontSize: 12.5),)
      ],
    ),
    onTap: (){
      onSelected();
    },

  );
}

