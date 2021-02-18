class MoviesList {
  String videosId;
  String title;
  String description;
  String slug;
  String release;
  String isPaid;
  String runtime;
  String videoQuality;
  String thumbnailUrl;
  String posterUrl;

  MoviesList(
      {videosId,
      title,
      description,
      slug,
      release,
      isPaid,
      runtime,
      videoQuality,
      thumbnailUrl,
      posterUrl});

  MoviesList.fromJson(Map<String, dynamic> json) {
    videosId = json['videos_id'];
    title = json['title'];
    description = json['description'];
    slug = json['slug'];
    release = json['release'];
    isPaid = json['is_paid'];
    runtime = json['runtime'];
    videoQuality = json['video_quality'];
    thumbnailUrl = json['thumbnail_url'];
    posterUrl = json['poster_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['videos_id'] = videosId;
    data['title'] = title;
    data['description'] = description;
    data['slug'] = slug;
    data['release'] = release;
    data['is_paid'] = isPaid;
    data['runtime'] = runtime;
    data['video_quality'] = videoQuality;
    data['thumbnail_url'] = thumbnailUrl;
    data['poster_url'] = posterUrl;
    return data;
  }
}
