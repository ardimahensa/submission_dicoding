import 'package:flutter/material.dart';

import '../api/poke_api.dart';

import '../model/model_pokemon.dart';

class DetailPage extends StatelessWidget {
  final minWidth = 500.0;
  final String url;
  static late Future<PokemonDetail> pokemon;

  const DetailPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PokeApi().fetchPokemonDetail(url),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //data ada
            final pokemon = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text(pokemon!.name),
                centerTitle: true,
                iconTheme: const IconThemeData(color: Colors.black),
                titleTextStyle: const TextStyle(
                    color: Colors.black,
                    letterSpacing: 5,
                    fontSize: 27,
                    fontFamily: 'PikachuBold',
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                backgroundColor: Colors.yellow,
              ),
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/pokemongo.png"),
                    fit: BoxFit.fitWidth,
                    opacity: 0.3,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.yellow[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Default',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontFamily: 'PikachuLight',
                                      letterSpacing: 5),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Image.network(pokemon.sprites.front,
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.fill),
                                  ),
                                  Expanded(
                                    child: Image.network(pokemon.sprites.back,
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.fill),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.yellow[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                const Text(
                                  'Shiny',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontFamily: 'PikachuLight',
                                      letterSpacing: 5),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                          pokemon.sprites.frontShiny,
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.fill),
                                    ),
                                    Expanded(
                                      child: Image.network(
                                          pokemon.sprites.backShiny,
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.fill),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(18),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.yellow[50],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tinggi: ${pokemon.height}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                'Berat: ${pokemon.weight}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            //kalau error
            Center(child: Text('Error Di $snapshot.error'));
          }
          return const Scaffold(body: CircularProgressIndicator());
        });
  }
}
