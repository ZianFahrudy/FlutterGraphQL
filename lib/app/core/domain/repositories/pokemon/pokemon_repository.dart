import 'package:dartz/dartz.dart';
import 'package:learn_graphql/app/core/domain/models/detail_pokemon_model.dart';
import 'package:learn_graphql/app/core/domain/models/pokemon_model.dart';
import 'package:learn_graphql/app/core/infrastructure/exception/failure.dart';

abstract class PokemonRepository {
  Stream<Either<Failure, DataPokemonModel>> getPokemonList();
  Stream<Either<Failure, DataDetailPokemonModel>> getDetailPokemon(String name);
}
