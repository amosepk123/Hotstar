


import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'Video_Player.dart';


class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> with SingleTickerProviderStateMixin {

  int _currentIndex = 0;


  @override



  List<VideoPlayerWidget> Video = [
    VideoPlayerWidget(videoUrl: 'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',),
    VideoPlayerWidget(videoUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',),
    VideoPlayerWidget(videoUrl: 'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',),
    VideoPlayerWidget(videoUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4 ',),

  ];
  List<String> b = [
    "picture/1.jpeg",
    "picture/2.jpeg",
    "picture/3.jpeg",
    "picture/4.jpeg",
  ];
  List text = [
    "1",
    "2",
    "3",
    "4",

  ];

  List<String> d = [
    "picture/cr1.png",
    "picture/cr2.png",
    "picture/cr3.png",
    "picture/cr4.png",
  ];

  List<String> e = [
    "1",
    "2",
    "3",
    "4",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.black,),
                    hintText: "search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                ),
                Stack(
                  children: [

                    CarouselSlider(
                      items: Video.map((video) {
                        return Container(
                          child: video,
                        );
                      }).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        height: 350,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),

                  ],
                ),

                Center(
                  child: DotsIndicator(
                    dotsCount: Video.length,
                    position: _currentIndex.toInt(),
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: Colors.blue,
                      spacing: EdgeInsets.all(5),
                      size: const Size.square(8.0),
                      activeSize: const Size(20.0, 8.0),
                      shape: const Border(),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  height: 500,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // number of items in each row
                        mainAxisSpacing: 5.0, // spacing between rows
                        crossAxisSpacing: 5.0, // spacing between columns
                      ),
                      itemCount: 20,
                      itemBuilder: (BuildContext c ,index)
                      {
                        return Container(
                          height: 100,
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("picture/5.jpeg"),
                                      fit: BoxFit.fill,
                                    ),

                                    borderRadius: BorderRadius.circular(10)

                                ),
                              ),
                            ],
                          ),
                        );
                      }

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
// class ChangeThemeButtonWidget extends StatelessWidget {
//   const ChangeThemeButtonWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     return Switch(value: themeProvider.isDakMode,
//       onChanged: (value){
//         final provider = Provider.of<ThemeProvider>(context,listen:false );
//         provider.toggleTheme(value);
//       },);
//   }
// }

