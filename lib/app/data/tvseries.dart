// To parse this JSON data, do
//
//     final tvSeriesResponse = tvSeriesResponseFromJson(jsonString);

import 'dart:convert';

TvSeriesResponse tvSeriesResponseFromJson(String str) => TvSeriesResponse.fromJson(json.decode(str));

String tvSeriesResponseToJson(TvSeriesResponse data) => json.encode(data.toJson());

class TvSeriesResponse {
  int? page;
  List<Result>? results;

  TvSeriesResponse({
    this.page,
    this.results,
  });

  factory TvSeriesResponse.fromJson(Map<String, dynamic> json) => TvSeriesResponse(
    page: json["page"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  OriginalLanguage? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
    id: json["id"],
    originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
    originalLanguage: originalLanguageValues.map[json["original_language"]]!,
    originalName: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
    name: json["name"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id,
    "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => x)),
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_name": originalName,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
    "name": name,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

enum OriginalLanguage {
  EN,
  JA,
  KO
}

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "ja": OriginalLanguage.JA,
  "ko": OriginalLanguage.KO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
