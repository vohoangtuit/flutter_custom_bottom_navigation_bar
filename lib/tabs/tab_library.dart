import 'package:flutter/material.dart';

class TabLibrary extends StatefulWidget {
  const TabLibrary({super.key});

  @override
  State<TabLibrary> createState() => _TabLibraryState();
}

class _TabLibraryState extends State<TabLibrary> with AutomaticKeepAliveClientMixin<TabLibrary>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('TabLibrary'),
            Container(height:400 ,color: Colors.black,),
          //  Container(height:400 ,color: Colors.red,),
            //Container(height:400 ,color: Colors.black,),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
