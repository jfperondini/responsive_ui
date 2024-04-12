import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/view/widgets/previous_widget.dart';
import 'package:responsive_ui/ui/view/widgets/next_widget.dart';
import 'package:responsive_ui/ui/view/widgets/play_pause_widget.dart';
import 'package:responsive_ui/ui/view/widgets/random_order_widget.dart';
import 'package:responsive_ui/ui/view/widgets/range_widget.dart';
import 'package:responsive_ui/cors/shared/widgets/screen_widget.dart';
import 'package:responsive_ui/ui/controller/controller.dart';
import 'package:responsive_ui/ui/view/widgets/repeat_widget.dart';
import 'package:responsive_ui/ui/view/widgets/slider_music_widget.dart';

class PageMobile extends StatelessWidget {
  final String current;
  final Controller controller;
  const PageMobile({super.key, required this.current, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(title: const Text('is Mobile ')),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenWidget(color: Colors.blue.shade300, current: '$current px'),
              SizedBox(height: size.width * 0.03),
              RangeWidget(controller: controller),
              SizedBox(height: size.width * 0.02),
              SliderMusicWidget(controller: controller, color: Colors.blueGrey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.formatDuration(controller.currentPositionSong)),
                  Text(controller.formatDuration(controller.playList[controller.currentSongIndex].duration - controller.currentPositionSong)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RandomOrderWidget(controller: controller),
                  PreviousWidget(controller: controller),
                  PlayPauseWidget(controller: controller, iconSize: 75),
                  NextWidget(controller: controller),
                  RepeatWidget(controller: controller)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
