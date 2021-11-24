// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDetailPokemonModel _$DataDetailPokemonModelFromJson(
        Map<String, dynamic> json) =>
    DataDetailPokemonModel(
      pokemon: PokemonDetail.fromJson(json['pokemon'] as Map<String, dynamic>),
    );

PokemonDetail _$PokemonDetailFromJson(Map<String, dynamic> json) =>
    PokemonDetail(
      id: json['id'] as int,
      name: json['name'] as String,
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => Abilities.fromJson(e as Map<String, dynamic>))
          .toList(),
      moves: (json['moves'] as List<dynamic>)
          .map((e) => Moves.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
      status: json['status'] as bool,
    );

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => Abilities(
      ability: Ability.fromJson(json['ability'] as Map<String, dynamic>),
    );

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      name: json['name'] as String,
    );

Moves _$MovesFromJson(Map<String, dynamic> json) => Moves(
      move: Ability.fromJson(json['move'] as Map<String, dynamic>),
    );

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      type: Ability.fromJson(json['type'] as Map<String, dynamic>),
    );
