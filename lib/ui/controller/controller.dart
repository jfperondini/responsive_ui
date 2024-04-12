import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:responsive_ui/domain/model/play_list_model.dart';

class Controller extends ChangeNotifier {
  bool isShuffle = false;
  bool isPlaying = false;
  bool isVolume = false;
  bool isTrumb = false;

  IconData currentIcon = Icons.repeat;
  double currentPositionSong = 0;
  double currentPositionVolume = 0.5;
  late Timer _timer;

  String tooltipTextRepeat = 'Repetição desativada';

  int currentSongIndex = 0;

  List<PlayListModel> playList = [
    PlayListModel('Title 1', 'Artist 1', 160),
    PlayListModel('Title 2', 'Artist 2', 180),
    PlayListModel('Title 3', 'Artist 3', 160),
    PlayListModel('Title 4', 'Artist 4', 245),
    PlayListModel('Title 5', 'Artist 5', 164),
    PlayListModel('Title 6', 'Artist 6', 179),
    PlayListModel('Title 7', 'Artist 7', 266),
    PlayListModel('Title 8', 'Artist 8', 199),
  ];

  String formatDuration(double duration) {
    int minutes = duration ~/ 60;
    int seconds = (duration % 60).toInt();
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  toggleShuffle() {
    isShuffle = !isShuffle;
    if (isShuffle) {
      playList.shuffle();
      currentSongIndex = 0;
    } else {
      playList.sort((a, b) => playList.indexOf(a).compareTo(playList.indexOf(b)));
      currentSongIndex = 0;
    }
    notifyListeners();
  }

  togglePlayPause() {
    isPlaying = !isPlaying;
    isPlaying ? play() : pause();
    notifyListeners();
  }

  toggleVolume() {
    isVolume = !isVolume;
    isVolume ? currentPositionVolume = 0 : currentPositionVolume = 0.5;
    notifyListeners();
  }

  seekToVolume(double position) {
    currentPositionVolume = position;
    notifyListeners();
  }

  play() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentPositionSong < playList[currentSongIndex].duration) {
        currentPositionSong += 1;
        notifyListeners();
      } else {
        if (currentIcon == Icons.repeat_one) {
          currentPositionSong = 0;
          notifyListeners();
        } else if (currentIcon == Icons.repeat_on && currentSongIndex == playList.length - 1) {
          currentSongIndex = 0;
          currentPositionSong = 0;
          notifyListeners();
        } else {
          if (currentSongIndex < playList.length - 1) {
            nextSong();
            currentPositionSong = 0;
            notifyListeners();
          } else {
            pause();
            notifyListeners();
          }
        }
      }
    });
    notifyListeners();
  }

  pause() {
    _timer.cancel();
    notifyListeners();
  }

  seekToSong(double position) {
    if (position >= 0 && position <= playList[currentSongIndex].duration) {
      currentPositionSong = position;
      notifyListeners();
    }
  }

  nextSong() {
    if (isShuffle) {
      currentSongIndex = Random().nextInt(playList.length);
    } else {
      currentSongIndex = (currentSongIndex + 1) % playList.length;
    }
    currentPositionSong = 0;
    notifyListeners();
  }

  previousSong() {
    if (isShuffle) {
      currentSongIndex = Random().nextInt(playList.length);
    } else {
      currentSongIndex = (currentSongIndex - 1) % playList.length;
      if (currentSongIndex < 0) {
        currentSongIndex = playList.length - 1;
      }
    }
    currentPositionSong = 0;
    notifyListeners();
  }

  toggleRepeat() {
    switch (currentIcon) {
      case Icons.repeat:
        currentIcon = Icons.repeat_on;
        tooltipTextRepeat = 'Repeat enabled';
        break;
      case Icons.repeat_on:
        currentIcon = Icons.repeat_one;
        tooltipTextRepeat = 'Repeat one';
        break;
      default:
        currentIcon = Icons.repeat;
        tooltipTextRepeat = 'Repeat disabled';
    }
    notifyListeners();
  }
}
