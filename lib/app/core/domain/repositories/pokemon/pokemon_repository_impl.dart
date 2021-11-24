// ignore_for_file: avoid_print

import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_graphql/app/core/domain/models/detail_pokemon_model.dart';
import 'package:learn_graphql/app/core/domain/models/pokemon_model.dart';
import 'package:dartz/dartz.dart';
import 'package:learn_graphql/app/core/domain/repositories/pokemon/pokemon_repository.dart';
import 'package:learn_graphql/app/core/infrastructure/exception/failure.dart';
import 'package:learn_graphql/app/core/infrastructure/query/query.dart';
import 'package:learn_graphql/app/core/network/graphql_config.dart';

@LazySingleton(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  final _client = GraphQLConfig.clientToQuery();

  @override
  Stream<Either<Failure, DataPokemonModel>> getPokemonList() async* {
    try {
      QueryResult result = await _client.query(QueryOptions(
          document: gql(Query.pokemonList), variables: {"limit": 20}));
      var data = DataPokemonModel.fromJson(result.data!);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        print(data.pokemons.status);
        yield right(data);
      }
    } catch (e) {
      print('print $e');
      yield left(Failure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, DataDetailPokemonModel>> getDetailPokemon(
      String name) async* {
    try {
      QueryResult result = await _client.query(QueryOptions(
          document: gql(Query.detailPokemon), variables: {"name": name}));
      var data = DataDetailPokemonModel.fromJson(result.data!);

      if (result.hasException) {
        print(result.exception?.graphqlErrors[0].message);
      } else if (result.data != null) {
        print(data.pokemon.name);
        yield right(data);
      }
    } catch (e) {
      print('print $e');
      yield left(Failure(e.toString()));
    }
  }

  ///THIS IS A SAMPLE FOR MAKING MUTABLE REQUEST
  ///login
  static String login(String email, String password) {
    return '''
            mutation{
              login(data: {
                input:"$email",
                password: "$password"
              }){
                token
                user{
                  _id
                  email
                  phonenumber
                  referralCode
                  username
                  emailVerified
                }
              }
            }
        ''';
  }

  // //Example on how to implement mutation
  // Future<String> Login(String email, password) async {
  //   try {
  //     ///initializing GraphQLConfig
  //     GraphQLConfig graphQLConfiguration = GraphQLConfig();
  //     GraphQLClient _client = graphQLConfiguration.clientToQuery();
  //     QueryResult result = await _client.mutate(
  //       MutationOptions(
  //         document: gql(login(email, password)), // this
  //       ),
  //     );
  //     if (result.hasException) {
  //       print(result.exception?.graphqlErrors[0]?.message);
  //     } else if (result.data != null) {
  //       //  parse your response here and return
  //       // var data = User.fromJson(result.data["register"]);
  //     }

  //     return "";
  //   } catch (e) {
  //     print(e);
  //     return "";
  //   }
  // }
}
