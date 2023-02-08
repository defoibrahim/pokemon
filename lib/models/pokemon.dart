// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    this.name,
    this.url,
    this.isFavourite,
  });

  String? name;
  String? url;
  bool? isFavourite;

  Pokemon copyWith({
    String? name,
    String? url,
    bool? isFavourite,
  }) =>
      Pokemon(
        name: name ?? name,
        url: url ?? url,
        isFavourite: isFavourite ?? isFavourite,
      );

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json['url'],
        isFavourite: false,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url, //! check image after save locally
      };

  factory Pokemon.fromRawJson(String str) => Pokemon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}

extension PokemonExtension on Pokemon {
  String get id {
    final data = url?.split('/');
    data?.removeLast();
    return data?.last ?? '1';
  }

  String get getImageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}
