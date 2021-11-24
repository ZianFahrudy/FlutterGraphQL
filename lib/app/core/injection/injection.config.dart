// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/blocs/pokemon/detail_pokemon_bloc.dart' as _i5;
import '../data/blocs/pokemon/pokemon_list_bloc.dart' as _i6;
import '../domain/repositories/pokemon/pokemon_repository.dart' as _i3;
import '../domain/repositories/pokemon/pokemon_repository_impl.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.PokemonRepository>(() => _i4.PokemonRepositoryImpl());
  gh.factory<_i5.DetailPokemonBloc>(
      () => _i5.DetailPokemonBloc(get<_i3.PokemonRepository>()));
  gh.factory<_i6.PokemonListBloc>(
      () => _i6.PokemonListBloc(get<_i3.PokemonRepository>()));
  return get;
}
