import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color getColor(String t) {
  return t == 'Bug'
      ? Hexcolor('A8B820')
      : t == 'Dark'
          ? Hexcolor('705848')
          : t == 'Dragon'
              ? Hexcolor('A27DFA')
              : t == 'Electric'
                  ? Hexcolor('F8D030')
                  : t == 'Fairy'
                      ? Hexcolor('EE99AC')
                      : t == 'Fighting'
                          ? Hexcolor('C03028')
                          : t == 'Fire'
                              ? Hexcolor('F08030')
                              : t == 'Flying'
                                  ? Hexcolor('A890F0')
                                  : t == 'Ghost'
                                      ? Hexcolor('705898')
                                      : t == 'Grass'
                                          ? Hexcolor('78C850')
                                          : t == 'Ground'
                                              ? Hexcolor('E0C068')
                                              : t == 'Ice'
                                                  ? Hexcolor('98D8D8')
                                                  : t == 'Normal'
                                                      ? Hexcolor('A8A878')
                                                      : t == 'Poison'
                                                          ? Hexcolor('C183C1')
                                                          : t == 'Psychic'
                                                              ? Hexcolor(
                                                                  'F85888')
                                                              : t == 'Rock'
                                                                  ? Hexcolor(
                                                                      'B8A038')
                                                                  : t == 'Steel'
                                                                      ? Hexcolor(
                                                                          'B8B8D0')
                                                                      : t == 'Water'
                                                                          ? Hexcolor(
                                                                              '6890F0')
                                                                          : Hexcolor(
                                                                              '68A090');
}
