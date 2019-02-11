import 'package:flutter/material.dart';
import 'package:pokeapp/pokemon.dart';

class PokeDetail extends StatelessWidget {

  final Pokemon pokemon;

  PokeDetail({this.pokemon});

bodyWiget() => Stack(
  children: <Widget>[
    Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Text(pokemon.name,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text("hight: ${pokemon.height}"),
            Text("weight: ${pokemon.weight}"),
            Text("type: ${pokemon.type}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: pokemon.type.map((t)=>FilterChip(label: Text(t),backgroundColor: Colors.green, onSelected: (b){},)).toList(),
            ),
            Text("weakness"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: pokemon.weaknesses.map((t)=>FilterChip(label: Text(t),backgroundColor: Colors.green, onSelected: (b){},)).toList(),
            ),

          ],
        ),
      ),
    )
  ],
);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(backgroundColor: Colors.cyan, elevation:  0.0, title: Text(pokemon.name),),
      body: bodyWiget(),
      
    );

  }
}
