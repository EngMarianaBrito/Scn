import 'dart:convert';

class NutricionistRequests {
    NutricionistRequests({
        this.data,
    });

    final List<Datum> data;

    factory NutricionistRequests.fromRawJson(String str) => NutricionistRequests.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NutricionistRequests.fromJson(Map<String, dynamic> json) => NutricionistRequests(
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
        this.weight,
        this.height,
        this.nutricionistName,
        this.profileImage,
        this.reason,
        this.status,
        this.nutricionistId,
        this.report,
        this.comments,
        this.extraContent,
        this.createdAt,
        this.updatedAt,
    });

    final int id;
    final int userId;
    final double weight;
    final double height;
    final String nutricionistName;
    final String profileImage;
    final String reason;
    final int status;
    final int nutricionistId;
    final dynamic report;
    final dynamic comments;
    final dynamic extraContent;
    final DateTime createdAt;
    final DateTime updatedAt;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        height: json["height"] == null ? null : json["height"].toDouble(),
        nutricionistName: json["nutricionist_name"] == null ? null : json["nutricionist_name"],
        profileImage: json["profile_image"] == null ? null : json["profile_image"],
        reason: json["reason"] == null ? null : json["reason"],
        status: json["status"] == null ? null : json["status"],
        nutricionistId: json["nutricionist_id"] == null ? null : json["nutricionist_id"],
        report: json["report"],
        comments: json["comments"],
        extraContent: json["extra_content"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "weight": weight == null ? null : weight,
        "height": height == null ? null : height,
        "nutricionist_name": nutricionistName == null ? null : nutricionistName,
        "profile_image": profileImage == null ? null : profileImage,
        "reason": reason == null ? null : reason,
        "status": status == null ? null : status,
        "nutricionist_id": nutricionistId == null ? null : nutricionistId,
        "report": report,
        "comments": comments,
        "extra_content": extraContent,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}