import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../pokemon.dart';
import '../Screens/pokemonDetailsScreen.dart';

class PokemonGrid extends StatefulWidget {
  @override
  _PokemonGridState createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  final String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeHub pokehub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedValue = jsonDecode(res.body);
    pokehub = PokeHub.fromJson(decodedValue);
    print(pokehub);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return pokehub == null
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loading . . . . . . . .',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Sahitya',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(),
              ],
            ),
          )
        : GridView.count(
            crossAxisCount: 2,
            children: pokehub.pokemon
                .map(
                  (Pokemon pokemon) => Padding(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            reverseTransitionDuration:
                                Duration(milliseconds: 400),
                            pageBuilder: (_, __, ___) => PokemonDetailScreen(
                              pokemon: pokemon,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Hero(
                              tag: pokemon.img,
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(pokemon.img),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '${pokemon.name}',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Sahitya',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
  }
}
