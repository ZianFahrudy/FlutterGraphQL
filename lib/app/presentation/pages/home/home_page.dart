import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_graphql/app/core/data/blocs/pokemon/pokemon_list_bloc.dart';
import 'package:learn_graphql/app/core/domain/models/pokemon_model.dart';
import 'package:learn_graphql/app/core/injection/injection.dart';
import 'package:learn_graphql/app/presentation/pages/detail_pokemon/detail_pokemon_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pokemonBloc = getIt<PokemonListBloc>();

  @override
  void initState() {
    pokemonBloc.fetchPokemonList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon'),
        ),
        body: StreamBuilder<DataPokemonModel?>(
            stream: pokemonBloc.data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return ListView.builder(
                    itemCount: data.pokemons.results.length,
                    itemBuilder: (context, i) => ListTile(
                          onTap: () => Get.to<void>(
                              DetailPokemonPage(
                                  pokeName: data.pokemons.results[i].name),
                              transition: Transition.cupertino),
                          leading: Image.network(
                            data.pokemons.results[i].image,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            data.pokemons.results[i].name,
                          ),
                        ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
