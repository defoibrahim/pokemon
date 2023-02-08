// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
    Pokemon({
        this.id,
        this.name,
        this.image,
    });

    int? id;
    String? name;
    String? image;

    Pokemon copyWith({
        int? id,
        String? name,
        String? image,
    }) => 
        Pokemon(
            id: id ?? this.id,
            name: name ?? this.name,
            image: image ?? this.image,
        );

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        image: json['sprites']['other']['home']["front_default"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,//! check image after save locally
    };
}
