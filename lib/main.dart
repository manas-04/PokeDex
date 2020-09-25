import 'package:flutter/material.dart';

import './Widgets/mainScreenGrid.dart';

void main() => runApp(
      MaterialApp(
        title: "PokeDex",
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.purple,
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        routes: {
          'mainScreen': (ctx) => HomePage(),
        },
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to PokeDex',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
        backgroundColor: Colors.cyan.shade600,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.85,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 255, 153, 1),
                    Color.fromRGBO(33, 120, 179, 1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          PokemonGrid(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('mainScreen');
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.cyan.shade600,
      ),
    );
  }
}
