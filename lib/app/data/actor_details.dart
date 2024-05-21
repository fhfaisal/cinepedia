// To parse this JSON data, do
//
//     final actorDetailsResponse = actorDetailsResponseFromJson(jsonString);

import 'dart:convert';

ActorDetailsResponse actorDetailsResponseFromJson(String str) => ActorDetailsResponse.fromJson(json.decode(str));

String actorDetailsResponseToJson(ActorDetailsResponse data) => json.encode(data.toJson());

class ActorDetailsResponse {
  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  DateTime? birthday;
  dynamic deathday;
  int? gender;
  dynamic homepage;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;

  ActorDetailsResponse({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  factory ActorDetailsResponse.fromJson(Map<String, dynamic> json) => ActorDetailsResponse(
    adult: json["adult"],
    alsoKnownAs: json["also_known_as"] == null ? [] : List<String>.from(json["also_known_as"]!.map((x) => x)),
    biography: json["biography"],
    birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
    deathday: json["deathday"],
    gender: json["gender"],
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    knownForDepartment: json["known_for_department"],
    name: json["name"],
    placeOfBirth: json["place_of_birth"],
    popularity: json["popularity"]?.toDouble(),
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "also_known_as": alsoKnownAs == null ? [] : List<dynamic>.from(alsoKnownAs!.map((x) => x)),
    "biography": biography,
    "birthday": "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    "deathday": deathday,
    "gender": gender,
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "known_for_department": knownForDepartment,
    "name": name,
    "place_of_birth": placeOfBirth,
    "popularity": popularity,
    "profile_path": profilePath,
  };
}
