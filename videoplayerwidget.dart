import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {

  final String videoUrl;
  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void>_intializeVideoPlayerFuture;
  @override
  void initState(){
    _videoPlayerController=VideoPlayerController.network(widget.videoUrl);
    _intializeVideoPlayerFuture=_videoPlayerController.initialize().then((_){
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      setState(() {

      });
    });
    super.initState();
  }

  void dispose(){
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:_intializeVideoPlayerFuture,
        builder: (contet,snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        return AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
        child: VideoPlayer(_videoPlayerController),
        );
      }else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
        }

    );
  }
}
