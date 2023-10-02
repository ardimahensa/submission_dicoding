import 'dart:convert';

import 'package:submission_dicoding/model/model_pokemon.dart';

import 'package:http/http.dart' as http;

class PokeApi {
  Future<PokemonList> fetchPokemon() async {
    final res = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));

    if (res.statusCode == 200) {
      return PokemonList.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Data Tidak Ada');
    }
  }

  Future<PokemonDetail> fetchPokemonDetail(url) async {
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      return PokemonDetail.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Data Tidak Ada');
    }
  }
}
