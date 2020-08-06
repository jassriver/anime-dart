import 'dart:convert';

import 'package:anime_dart/app/core/details/domain/entities/anime_details.dart';
import 'package:flutter/foundation.dart';

class AnimeDetailsModel extends AnimeDetails {
  final String id;
  final String title;
  final String synopsis;
  final String imageUrl;
  final Map<String, String> imageHttpHeaders;
  final String year;
  final List<String> genres;

  AnimeDetailsModel({
    this.id,
    this.title,
    this.synopsis,
    this.imageUrl,
    this.imageHttpHeaders,
    this.year,
    this.genres,
  });

  AnimeDetailsModel copyWith({
    String id,
    String title,
    String synopsis,
    String imageUrl,
    Map<String, String> imageHttpHeaders,
    String year,
    List<String> genres,
  }) {
    return AnimeDetailsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      synopsis: synopsis ?? this.synopsis,
      imageUrl: imageUrl ?? this.imageUrl,
      imageHttpHeaders: imageHttpHeaders ?? this.imageHttpHeaders,
      year: year ?? this.year,
      genres: genres ?? this.genres,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'synopsis': synopsis,
      'imageUrl': imageUrl,
      'imageHttpHeaders': imageHttpHeaders,
      'year': year,
      'genres': genres,
    };
  }

  factory AnimeDetailsModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AnimeDetailsModel(
      id: map['id'],
      title: map['title'],
      synopsis: map['synopsis'],
      imageUrl: map['imageUrl'],
      imageHttpHeaders: Map<String, String>.from(map['imageHttpHeaders']),
      year: map['year'],
      genres: List<String>.from(map['genres']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimeDetailsModel.fromJson(String source) =>
      AnimeDetailsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnimeDetailsModel(id: $id, title: $title, synopsis: $synopsis, imageUrl: $imageUrl, imageHttpHeaders: $imageHttpHeaders, year: $year, genres: $genres)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AnimeDetailsModel &&
        o.id == id &&
        o.title == title &&
        o.synopsis == synopsis &&
        o.imageUrl == imageUrl &&
        mapEquals(o.imageHttpHeaders, imageHttpHeaders) &&
        o.year == year &&
        listEquals(o.genres, genres);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        synopsis.hashCode ^
        imageUrl.hashCode ^
        imageHttpHeaders.hashCode ^
        year.hashCode ^
        genres.hashCode;
  }
}
