import 'dart:convert';

class Nutricionist {
    Nutricionist({
        this.data,
    });

    final List<Datum> data;

    factory Nutricionist.fromRawJson(String str) => Nutricionist.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Nutricionist.fromJson(Map<String, dynamic> json) => Nutricionist(
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
        this.stars,
        this.name,
        this.description,
        this.formation,
        this.crn,
        this.profileImage,
    });

    final int id;
    final int userId;
    final int stars;
    final String name;
    final dynamic description;
    final String formation;
    final String crn;
    final String profileImage;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        stars: json["stars"] == null ? null : json["stars"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"],
        formation: json["formation"] == null ? null : json["formation"],
        crn: json["crn"] == null ? null : json["crn"],
        profileImage: json["profile_image"] == null ? null : json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "stars": stars == null ? null : stars,
        "name": name == null ? null : name,
        "description": description,
        "formation": formation == null ? null : formation,
        "crn": crn == null ? null : crn,
        "profile_image": profileImage == null ? null : profileImage,
    };
}
