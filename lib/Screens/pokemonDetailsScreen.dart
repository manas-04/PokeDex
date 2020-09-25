import 'package:flutter/material.dart';

import '../pokemon.dart';
import '../Widgets/gradientContainer.dart';
import '../assets/color.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailScreen({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          '${pokemon.name}',
          style: TextStyle(
            fontFamily: 'Sahitya',
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * 0.70,
            width: MediaQuery.of(context).size.width * 0.85,
            left: MediaQuery.of(context).size.width * 0.075,
            top: MediaQuery.of(context).size.height * 0.13,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    '${pokemon.name}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  GradientContainerRow(),
                  Text(
                    'Average Height : ${pokemon.height}',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Text(
                    'Average Weight : ${pokemon.weight}',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Text(
                    'Types :',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: 80,
                                child: Center(
                                    child: Text(
                                  t,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                )),
                                decoration: BoxDecoration(
                                  color: getColor(t),
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  Text(
                    'Weakness :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.weaknesses
                          .map((t) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 28,
                                  width: 70,
                                  child: Center(
                                    child: Text(t),
                                  ),
                                  decoration: BoxDecoration(
                                    color: getColor(t),
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 225,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(pokemon.img),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
