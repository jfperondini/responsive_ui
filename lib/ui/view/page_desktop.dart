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

class PageDesktop extends StatelessWidget {
  final String current;
  final Controller controller;

  const PageDesktop({super.key, required this.current, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(title: const Text('is Desktop')),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: size.width * 0.50,
              child: ScreenWidget(color: Colors.red.shade300, current: '$current px'),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: size.width * 0.40,
                height: double.infinity,
                child: Container(
                  color: Colors.red.shade300,
                  child: PlayListWidget(controller: controller, colorShade300: Colors.red.shade300, colorAccent: Colors.redAccent),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red.shade300,
        padding: const EdgeInsets.only(bottom: 18),
        height: size.height * 0.155,
        child: Column(
          children: [
            SliderMusicWidget(controller: controller, color: Colors.redAccent),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    PreviousWidget(controller: controller),
                    PlayPauseWidget(controller: controller, iconSize: 35),
                    NextWidget(controller: controller),
                    Text(
                      '${controller.formatDuration(
                        controller.currentPositionSong,
                      )}/ ${controller.formatDuration(
                        controller.playList[controller.currentSongIndex].duration - controller.currentPositionSong,
                      )}',
                    ),
                    SizedBox(width: size.height * 0.03),
                    RangeWidget(controller: controller),
                  ],
                ),
                Row(
                  children: [
                    SliderVolumeWidget(controller: controller, color: Colors.redAccent),
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
