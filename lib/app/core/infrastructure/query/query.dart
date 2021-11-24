class Query {
  static const pokemonList = '''
  query pokemons(\$limit: Int, \$offset: Int) {
      pokemons(limit: \$limit, offset: \$offset) {
        count
        next
        previous
        status
        message
        results {
          url
          name
          image
        }
      }
    }
''';

  static const detailPokemon = '''
query pokemon(\$name: String!) {
  pokemon(name: \$name) {
    id
    name
    abilities {
      ability {
        name
      }
    }
    moves {
      move {
        name
      }
    }
    types {
      type {
        name
      }
    }
    message
    status
  }
}
  ''';
}
