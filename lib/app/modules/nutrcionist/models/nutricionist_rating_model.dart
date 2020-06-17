import 'dart:convert';

class NutricionistRatings {
    NutricionistRatings({
        this.data,
    });

    final List<Datum> data;

    factory NutricionistRatings.fromRawJson(String str) => NutricionistRatings.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NutricionistRatings.fromJson(Map<String, dynamic> json) => NutricionistRatings(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.userId,
        this.name,
        this.comment,
        this.rating,
        this.profileImage,
        this.nutricionistId,
        this.createdAt,
        this.updatedAt,
    });

    final int id;
    final int userId;
    final String name;
    final String comment;
    final double rating;
    final String profileImage;
    final int nutricionistId;
    final DateTime createdAt;
    final DateTime updatedAt;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        name: json["name"] == null ? null : json["name"],
        comment: json["comment"] == null ? null : json["comment"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        profileImage: json["profile_image"] == null ? null : json["profile_image"],
        nutricionistId: json["nutricionist_id"] == null ? null : json["nutricionist_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "name": name == null ? null : name,
        "comment": comment == null ? null : comment,
        "rating": rating == null ? null : rating,
        "profile_image": profileImage == null ? null : profileImage,
        "nutricionist_id": nutricionistId == null ? null : nutricionistId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}