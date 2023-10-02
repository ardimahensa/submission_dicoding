class PokemonList {
  late List<PokemonResult> pokemonResult;

  PokemonList({required this.pokemonResult});

  PokemonList.fromJson(Map<String, dynamic> json) {
    pokemonResult = <PokemonResult>[];

    json['results'].forEach((item) {
      pokemonResult.add(PokemonResult.fromJson(item));
    });
  }
}

class PokemonResult {
  late String name;
  late String url;

  PokemonResult({required this.name, required this.url});

  PokemonResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class PokemonDetail {
  late String name;
  late int weight;
  late int height;
  late PokemonSprites sprites;

  PokemonDetail(
      {required this.name,
      required this.height,
      required this.weight,
      required this.sprites});

  PokemonDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    weight = json['weight'];
    height = json['height'];
    sprites = PokemonSprites.fromJson(json['sprites']);
  }
}

class PokemonSprites {
  late String front;
  late String back;
  late String frontShiny;
  late String backShiny;

  PokemonSprites({required this.back, required this.front});

  PokemonSprites.fromJson(Map<String, dynamic> json) {
    front = json['front_default'];
    back = json['back_default'];
    frontShiny = json['front_shiny'];
    backShiny = json['back_shiny'];
  }
}
