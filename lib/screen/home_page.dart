import 'package:flutter/material.dart';
import 'package:submission_dicoding/api/poke_api.dart';
import 'package:submission_dicoding/model/model_pokemon.dart';
import 'package:submission_dicoding/screen/detail_page.dart';

import '../theme/toggle_theme.dart';

class HomePage extends StatelessWidget {
  final Future<PokemonList>? pokemonList;

  const HomePage({super.key, this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('POKEMON HERE!'),
        titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 27,
            fontFamily: 'PikachuLight',
            letterSpacing: 3,
            fontWeight: FontWeight.bold),
        backgroundColor: Colors.yellow,
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/maskot.png"),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
        ),
        child: FutureBuilder(
          future: PokeApi().fetchPokemon(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //kalau ada data
              return PokemonListView(pokemonList: snapshot.data!.pokemonResult);
            } else if (snapshot.hasError) {
              //kalau error
              Center(child: Text("Error di ${snapshot.error}"));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class PokemonListView extends StatefulWidget {
  final dynamic pokemonList;
  const PokemonListView({super.key, required this.pokemonList});

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  bool isLiked = false;
  detailPokemon(context, url) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage(url: url)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.pokemonList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50,
          child: ListTile(
            title: Text(widget.pokemonList[index].name),
            onTap: () {
              detailPokemon(context, widget.pokemonList[index].url);
            },
          ),
        );
      },
    );
  }
}
