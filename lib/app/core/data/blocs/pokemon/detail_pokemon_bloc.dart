// ignore_for_file: avoid_print

import 'package:injectable/injectable.dart';
import 'package:learn_graphql/app/core/domain/models/detail_pokemon_model.dart';
import 'package:learn_graphql/app/core/domain/repositories/pokemon/pokemon_repository.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class DetailPokemonBloc {
  final PokemonRepository _repository;
  DetailPokemonBloc(this._repository);

  final _detailPokemon = BehaviorSubject<DataDetailPokemonModel?>();

  Function(DataDetailPokemonModel) get updatePokemon => _detailPokemon.sink.add;
  Stream<DataDetailPokemonModel?> get data => _detailPokemon.stream;

  fetchPokemonList(String pokeName) {
    _detailPokemon.value = null;

    final result = _repository.getDetailPokemon(pokeName);

    result.listen((event) {
      event.fold((error) {
        print('Something error when request pokemon list $error');
        _detailPokemon.addError(error);
      }, (value) => updatePokemon(value));
    });
  }

  dispose() {
    _detailPokemon.close();
  }
}
