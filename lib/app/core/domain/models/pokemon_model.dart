import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class DataPokemonModel {
  final Pokemon pokemons;
  DataPokemonModel({
    required this.pokemons,
  });

  factory DataPokemonModel.fromJson(Map<String, dynamic> json) =>
      _$DataPokemonModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class Pokemon {
  final int count;
  final String next;
  final String previous;
  final bool status;
  final String message;
  final List<PokemonResult> results;
  Pokemon({
    required this.count,
    required this.next,
    required this.previous,
    required this.status,
    required this.message,
    required this.results,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class PokemonResult {
  final String url;
  final String name;
  final String image;
  PokemonResult({
    required this.url,
    required this.name,
    required this.image,
  });

  factory PokemonResult.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultFromJson(json);
}
