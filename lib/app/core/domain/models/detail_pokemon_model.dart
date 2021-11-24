import 'package:json_annotation/json_annotation.dart';

part 'detail_pokemon_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class DataDetailPokemonModel {
  final PokemonDetail pokemon;
  DataDetailPokemonModel({
    required this.pokemon,
  });

  factory DataDetailPokemonModel.fromJson(Map<String, dynamic> json) =>
      _$DataDetailPokemonModelFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class PokemonDetail {
  final int id;
  final String name;
  final List<Abilities> abilities;
  final List<Moves> moves;
  final List<Types> types;
  final String message;
  final bool status;
  PokemonDetail({
    required this.id,
    required this.name,
    required this.abilities,
    required this.moves,
    required this.types,
    required this.message,
    required this.status,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class Abilities {
  Ability ability;
  Abilities({
    required this.ability,
  });

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class Ability {
  final String name;
  Ability({
    required this.name,
  });

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class Moves {
  final Ability move;
  Moves({
    required this.move,
  });

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: false)
class Types {
  Ability type;
  Types({
    required this.type,
  });

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
}
