// To parse this JSON data, do
//
//     final reviewsResponse = reviewsResponseFromJson(jsonString);

import 'dart:convert';

ReviewsResponse reviewsResponseFromJson(String str) => ReviewsResponse.fromJson(json.decode(str));

String reviewsResponseToJson(ReviewsResponse data) => json.encode(data.toJson());

class ReviewsResponse {
  int? id;
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  ReviewsResponse({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) => ReviewsResponse(
    id: json["id"],
    page: json["page"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "page": page,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  String? author;
  AuthorDetails? authorDetails;
  String? content;
  DateTime? createdAt;
  String? id;
  DateTime? updatedAt;
  String? url;

  Result({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    author: json["author"],
    authorDetails: json["author_details"] == null ? null : AuthorDetails.fromJson(json["author_details"]),
    content: json["content"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "author_details": authorDetails?.toJson(),
    "content": content,
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "updated_at": updatedAt?.toIso8601String(),
    "url": url,
  };
}

class AuthorDetails {
  String? name;
  String? username;
  String? avatarPath;
  double? rating;

  AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
    name: json["name"],
    username: json["username"],
    avatarPath: json["avatar_path"],
    rating: json["rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "avatar_path": avatarPath,
    "rating": rating,
  };
}
