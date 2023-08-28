import 'package:flutter/material.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({super.key});

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> with AutomaticKeepAliveClientMixin<TabProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: Column(
            children: [
              Text('profile'),
              Container(height:400 ,color: Colors.blueAccent,),
              //Container(height:400 ,color: Colors.black12,),
              Container(height:400 ,color: Colors.brown,),
              //Container(height:400 ,color: Colors.black,),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
