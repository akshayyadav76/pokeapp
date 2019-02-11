import 'package:flutter/material.dart';
import 'package:pokeapp/pokemon.dart';

class PokeDetail extends StatelessWidget {

  final Pokemon pokemon;

  PokeDetail({this.pokemon});

    bodyWiget(BuildContext context) => Stack(children: <Widget>[
    Positioned(
      height: MediaQuery.of(context).size.height /1.5,
      width: MediaQuery.of(context).size.width -20,left: 10.0,
      top:  MediaQuery.of(context).size.height *0.1,

      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
              SizedBox(height: 20,),
              Text(pokemon.name,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              Text("hight: ${pokemon.height}"),
              Text("weight: ${pokemon.weight}"),

              Text("type"),
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
      ),
    ),

    Align(
      alignment: Alignment.topCenter,
      child:  Hero(tag:  pokemon.img, child: Container(height: 120.0, width: 120.0,
      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(pokemon.img),fit:
      BoxFit.cover)),),),
    ),
  ],
);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(backgroundColor: Colors.cyan, elevation:  0.0, title: Text(pokemon.name),),
      body: bodyWiget(context),
      
    );

  }
}
