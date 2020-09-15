/*
 * File: scr014.dart
 * Project: CVideo
 * File Created: Monday, 13th July 2020 12:45 pm
 * Author: luonglv39 (luonglvse130702@fpt.edu.vn)
 * -----
 * Last Modified: Monday, 13th July 2020 5:07 pm
 * Modified By: luonglv39 (luonglvse130702@fpt.edu.vn>)
 * -----
 * Copyright (c) Daxua Team
 */
import 'package:chewie/chewie.dart';
import 'package:cvideo_employer_mobile/src/app_components/app_colors.dart';
import 'package:cvideo_employer_mobile/src/models/scr009/video_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class SCR009 extends StatefulWidget {
  const SCR009({Key key}) : super(key: key);

  @override
  _SCR009State createState() => _SCR009State();
}

class _SCR009State extends State<SCR009> {
  ChewieController chewieController;
  VideoPlayerController videoPlayerController;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        SCR009Arguments args = ModalRoute.of(context).settings.arguments;

        /// Get video player controller
        videoPlayerController =
            VideoPlayerController.network(args.videoInfo.videoUrl);

        /// Configure Chewie controlelr
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          autoInitialize: true,
          aspectRatio: args.videoInfo.aspectRatio,
          placeholder: Center(
            child: Image.network(args.videoInfo.coverUrl),
          ),
        );
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: size.width,
        height: size.height,
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (chewieController != null) chewieController.dispose();
    if (videoPlayerController != null) videoPlayerController.dispose();
  }
}

class SCR009Arguments {
  final VideoInfo videoInfo;

  SCR009Arguments({this.videoInfo});
}
