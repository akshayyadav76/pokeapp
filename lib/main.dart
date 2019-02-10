import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokeapp/pokemon.dart';


void main(){

  runApp(MaterialApp(
    title:  "poke App",
    debugShowCheckedModeBanner: false,
    theme: ThemeData( primaryColor: Colors.green),
    home: HomePage(),
    
  ));
}


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {return new HomePageState();}

}

class HomePageState extends State<HomePage> {
  PokeHub pokeHub;
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    print("this");


  }

  fetchData() async {
    var res = await http.get(url);
    var decodevalue = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodevalue);

    print(pokeHub);


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("poke app"),),
      body: GridView.count(crossAxisCount: 2,children: pokeHub.pokemon.map((Pokemon poke) => Padding(padding: const EdgeInsets.all(2.0),child: Card(
        elevation:  5.0,
        child: Column(
          children: <Widget>[
            Container(
              height: 100.0,
              width:  100.0,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(poke.img))),
            )
          ],
        ),
      ),)).toList() ,),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: (){} ,child: Icon(Icons.ac_unit),),

    );
  }
}


