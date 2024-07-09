


import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hottstar1/theme_provider.dart';
import 'package:provider/provider.dart';

import 'Video_Player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final Theme_text=MediaQuery.of(context).platformBrightness==Brightness.dark
  ?"DarkTheme"
  : "LightTheme";

  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> a = [
    "picture/1.jpeg",
    "picture/2.jpeg",
    "picture/3.jpeg",
    "picture/4.jpeg",
    "picture/5.jpeg",
    "picture/6.jpeg",
  ];
  List<String> b = [
    "picture/1.jpeg",
    "picture/2.jpeg",
    "picture/3.jpeg",
    "picture/4.jpeg",
    "picture/1.jpeg",
    "picture/2.jpeg",
    "picture/3.jpeg",
    "picture/4.jpeg",
    "picture/1.jpeg",
    "picture/2.jpeg",
    "picture/3.jpeg",
    "picture/4.jpeg",
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
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      items: a.map((item) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            image: DecorationImage(
                              image: AssetImage(item),
                              fit: BoxFit.fill,
                            ),
                          ),
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
                    Positioned(
                      top: 3,
                      left: 10,
                      child: Container(
                        height: 50,
                        width: 70,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("picture/file.png")),
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.orange,
                        ),
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [_animation.value - 0.5, _animation.value, _animation.value + 0.1],
                                  colors: [
                                    Colors.orangeAccent.withOpacity(0),
                                    Colors.white,
                                    Colors.orangeAccent.withOpacity(0),
                                  ],
                                ).createShader(bounds);
                              },
                              child: Text(
                                'subscribe',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF2d3039),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const VideoPlayerWidget(videoUrl: 'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',),),
                              );
                            },
                            icon: Icon(
                              Icons.play_arrow_sharp,size: 30,
                              color: Colors.white,
                            ),
                          ),
                          Text( "Watch Free",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF2d3039)
                      ),
                      child: IconButton(
                        onPressed: () {  },
                        icon: Icon(
                          Icons.add,size: 20,color: Colors.white,
                        ),

                      ),

                    ),
                  ],
                ),
                Center(
                  child: DotsIndicator(
                    dotsCount: a.length,
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
                SizedBox(height: 10),
                Divider(),
                Row(
                  children: [
                    Text(
                      "Latest Release$Theme_text!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),

                SizedBox(
                  height:  MediaQuery.of(context).size.width/2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Container(
                        height:MediaQuery.of(context).size.height/4 ,
                        width: MediaQuery.of(context).size.height/4,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(b[index],fit: BoxFit.fill,),
                            //SizedBox(height: 8),
                            // Text(
                            //   text[index],
                            //   style: TextStyle(color: Colors.white),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Divider(),
                Row(
                  children: [
                    Text(
                      "Latest Release$Theme_text!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),

                SizedBox(
                  height:  MediaQuery.of(context).size.width/2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Container(
                        height:MediaQuery.of(context).size.height/4 ,
                        width: MediaQuery.of(context).size.height/4,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(b[index],fit: BoxFit.fill,),
                            //SizedBox(height: 8),
                            // Text(
                            //   text[index],
                            //   style: TextStyle(color: Colors.white),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Divider(),
                Row(
                  children: [
                    Text(
                      "Latest Release$Theme_text!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),

                SizedBox(
                  height:  MediaQuery.of(context).size.width/2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Container(
                        height:MediaQuery.of(context).size.height/4 ,
                        width: MediaQuery.of(context).size.height/4,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(b[index],fit: BoxFit.fill,),
                            //SizedBox(height: 8),
                            // Text(
                            //   text[index],
                            //   style: TextStyle(color: Colors.white),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Divider(),
                Row(
                  children: [
                    Text(
                      "Latest Release$Theme_text!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),

                SizedBox(
                  height:  MediaQuery.of(context).size.width/2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Container(
                        height:MediaQuery.of(context).size.height/4 ,
                        width: MediaQuery.of(context).size.height/4,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(b[index],fit: BoxFit.fill,),
                            //SizedBox(height: 8),
                            // Text(
                            //   text[index],
                            //   style: TextStyle(color: Colors.white),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Divider(),
                Row(
                  children: [
                    Text(
                      "Latest Release$Theme_text!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),

                SizedBox(
                  height:  MediaQuery.of(context).size.width/2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Container(
                        height:MediaQuery.of(context).size.height/4 ,
                        width: MediaQuery.of(context).size.height/4,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(b[index],fit: BoxFit.fill,),
                            //SizedBox(height: 8),
                            // Text(
                            //   text[index],
                            //   style: TextStyle(color: Colors.white),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //SizedBox(height: 10),
                Divider(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch(value: themeProvider.isDakMode,
      onChanged: (value){
      final provider = Provider.of<ThemeProvider>(context,listen:false );
       provider.toggleTheme(value);
      },);
  }
}

