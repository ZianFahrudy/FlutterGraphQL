// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataPokemonModel _$DataPokemonModelFromJson(Map<String, dynamic> json) =>
    DataPokemonModel(
      pokemons: Pokemon.fromJson(json['pokemons'] as Map<String, dynamic>),
    );

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      count: json['count'] as int,
      next: json['next'] as String,
      previous: json['previous'] as String,
      status: json['status'] as bool,
      message: json['message'] as String,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

PokemonResult _$PokemonResultFromJson(Map<String, dynamic> json) =>
    PokemonResult(
      url: json['url'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );
