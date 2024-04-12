import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/view/widgets/previous_widget.dart';
import 'package:responsive_ui/ui/view/widgets/next_widget.dart';
import 'package:responsive_ui/ui/view/widgets/play_list_widget.dart';
import 'package:responsive_ui/ui/view/widgets/play_pause_widget.dart';
import 'package:responsive_ui/ui/view/widgets/random_order_widget.dart';
import 'package:responsive_ui/ui/view/widgets/range_widget.dart';
import 'package:responsive_ui/cors/shared/widgets/screen_widget.dart';
import 'package:responsive_ui/ui/controller/controller.dart';
import 'package:responsive_ui/ui/view/widgets/repeat_widget.dart';
import 'package:responsive_ui/ui/view/widgets/slider_music_widget.dart';
import 'package:responsive_ui/ui/view/widgets/slider_volume_widget.dart';
import 'package:responsive_ui/ui/view/widgets/volume_widget.dart';

class PageTablet extends StatelessWidget {
  final String current;
  final Controller controller;
  const PageTablet({super.key, required this.current, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(title: const Text('is Tablet')),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenWidget(color: Colors.yellow.shade300, current: '$current px'),
            Expanded(
              child: PlayListWidget(controller: controller, colorShade300: Colors.yellow.shade300, colorAccent: Colors.yellowAccent),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow.shade300,
        padding: const EdgeInsets.only(bottom: 18),
        height: size.height * 0.155,
        child: Column(
          children: [
            SliderMusicWidget(controller: controller, color: Colors.yellowAccent),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    PreviousWidget(controller: controller),
                    PlayPauseWidget(controller: controller, iconSize: 35),
                    NextWidget(controller: controller),
                    Text(
                        '${controller.formatDuration(controller.currentPositionSong)}/ ${controller.formatDuration(controller.playList[controller.currentSongIndex].duration - controller.currentPositionSong)}'),
                    SizedBox(width: size.height * 0.03),
                    RangeWidget(controller: controller),
                  ],
                ),
                Row(
                  children: [
                    SliderVolumeWidget(controller: controller, color: Colors.yellowAccent),
                    VolumeWidget(controller: controller),
                    RepeatWidget(controller: controller),
                    RandomOrderWidget(controller: controller),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
