import 'package:flutter/material.dart';
import 'package:learn_graphql/app/core/data/blocs/pokemon/detail_pokemon_bloc.dart';
import 'package:learn_graphql/app/core/domain/models/detail_pokemon_model.dart';
import 'package:learn_graphql/app/core/injection/injection.dart';

class DetailPokemonPage extends StatefulWidget {
  const DetailPokemonPage({Key? key, required this.pokeName}) : super(key: key);

  final String pokeName;

  @override
  State<DetailPokemonPage> createState() => _DetailPokemonPageState();
}

class _DetailPokemonPageState extends State<DetailPokemonPage> {
  final detailPokemonBloc = getIt<DetailPokemonBloc>();
  @override
  void initState() {
    detailPokemonBloc.fetchPokemonList(widget.pokeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokeName),
      ),
      body: Center(
        child: StreamBuilder<DataDetailPokemonModel?>(
            stream: detailPokemonBloc.data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Name: ${data.pokemon.name}'),
                    Text('Ability: ${data.pokemon.abilities[0].ability.name}'),
                    Text('Move: ${data.pokemon.moves[0].move.name}'),
                    Text('Type: ${data.pokemon.types[0].type.name}'),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
