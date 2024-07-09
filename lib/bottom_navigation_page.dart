
import 'package:flutter/material.dart';
import 'package:hottstar1/profile.dart';




import 'Search.dart';
import 'Video_Player.dart';
import 'home.dart';
import 'location.dart';


class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  int _index=0;
  final screen=[
    Home(),
    search(),
    VideoPlayerWidget(videoUrl: 'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',),
    Profile(),
    LocationExample()


  ];

  void tap(index){
    setState(() {
      _index=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: screen[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "person",),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),
        BottomNavigationBarItem(icon: Icon(Icons.video_collection_rounded),label: "New & Hot"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined),label: "location"),
      ],
        currentIndex: _index,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.cyan,

        onTap: tap,
      ),


    );
  }
}
