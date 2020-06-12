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
        this.name,
        this.formation,
        this.crn,
        this.stars,
        this.description,
    });

    final String name;
    final String formation;
    final String crn;
    final dynamic stars;
    final String description;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"] == null ? null : json["name"],
        formation: json["formation"] == null ? null : json["formation"],
        crn: json["crn"] == null ? null : json["crn"],
        stars: json["stars"] == null ? null : json["stars"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "formation": formation == null ? null : formation,
        "crn": crn == null ? null : crn,
        "stars": stars == null ? null : stars,
        "description": description == null ? null : description,
    };
}