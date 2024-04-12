import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

class PlayListWidget extends StatelessWidget {
  final Color colorShade300;
  final Color colorAccent;
  final Controller controller;

  const PlayListWidget({super.key, required this.controller, required this.colorShade300, required this.colorAccent});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.playList.length,
        itemBuilder: (context, index) {
          return Container(
            color: colorShade300,
            margin: const EdgeInsets.only(top: 10),
            child: Center(
              child: ListTile(
                leading: Container(
                  width: 80,
                  color: colorAccent,
                ),
                title: Text(controller.playList[index].title),
                subtitle: Text(controller.playList[index].artist),
                trailing: Text(
                  controller.formatDuration(controller.playList[index].duration),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
