// To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromJson(jsonString);

import 'dart:convert';

CreditsResponse creditsResponseFromJson(String str) => CreditsResponse.fromJson(json.decode(str));

String creditsResponseToJson(CreditsResponse data) => json.encode(data.toJson());

class CreditsResponse {
  int? id;
  List<Cast>? cast;
  List<Cast>? crew;

  CreditsResponse({
    this.id,
    this.cast,
    this.crew,
  });

  factory CreditsResponse.fromJson(Map<String, dynamic> json) => CreditsResponse(
    id: json["id"],
    cast: json["cast"] == null ? [] : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
    crew: json["crew"] == null ? [] : List<Cast>.from(json["crew"]!.map((x) => Cast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cast": cast == null ? [] : List<dynamic>.from(cast!.map((x) => x.toJson())),
    "crew": crew == null ? [] : List<dynamic>.from(crew!.map((x) => x.toJson())),
  };
}

class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  String? department;
  String? job;
  dynamic knownFor;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
    this.knownFor,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    knownForDepartment: json["known_for_department"],
    name: json["name"],
    originalName: json["original_name"],
    popularity: json["popularity"]?.toDouble(),
    profilePath: json["profile_path"],
    castId: json["cast_id"],
    character: json["character"],
    creditId: json["credit_id"],
    order: json["order"],
    department: json["department"],
    job: json["job"],
    knownFor: json["known_for"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for_department": knownForDepartment,
    "name": name,
    "original_name": originalName,
    "popularity": popularity,
    "profile_path": profilePath,
    "cast_id": castId,
    "character": character,
    "credit_id": creditId,
    "order": order,
    "department": department,
    "job": job,
    "known_for": knownFor,
  };
}
