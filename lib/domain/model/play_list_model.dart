class PlayListModel {
  final String title;
  final String artist;
  final double duration;

  PlayListModel(
    this.title,
    this.artist,
    this.duration,
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'artist': artist,
      'duration': duration,
    };
  }

  factory PlayListModel.fromJson(Map<String, dynamic> map) {
    return PlayListModel(
      map['title'] ?? '',
      map['artist'] ?? '',
      map['duration'] ?? 0.0,
    );
  }

  
}

