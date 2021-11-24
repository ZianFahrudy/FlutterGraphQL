// ignore_for_file: avoid_print

import 'package:injectable/injectable.dart';
import 'package:learn_graphql/app/core/domain/models/pokemon_model.dart';
import 'package:learn_graphql/app/core/domain/repositories/pokemon/pokemon_repository.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class PokemonListBloc {
  final PokemonRepository _repository;
  PokemonListBloc(this._repository);

  final _pokemonList = BehaviorSubject<DataPokemonModel?>();

  Function(DataPokemonModel) get updatePokemon => _pokemonList.sink.add;
  Stream<DataPokemonModel?> get data => _pokemonList.stream;

  fetchPokemonList() {
    _pokemonList.value = null;

    final result = _repository.getPokemonList();

    result.listen((event) {
      event.fold((error) {
        print('Something error when request pokemon list $error');
        _pokemonList.addError(error);
      }, (value) => updatePokemon(value));
    });
  }

  dispose() {
    _pokemonList.close();
  }
}
