import 'package:app_superheroes/models/superhero.dart';
import 'package:app_superheroes/services/superhero_api.dart';
import 'package:app_superheroes/views/heroes/components/super_hero_list.dart';
import 'package:app_superheroes/widgets/loading_item.dart';
import 'package:flutter/material.dart';

class SuperheroesPage extends StatefulWidget {
  const SuperheroesPage({Key? key}) : super(key: key);

  @override
  State<SuperheroesPage> createState() => _SuperheroesPageState();
}

class _SuperheroesPageState extends State<SuperheroesPage> {
  late List<SuperHero> superheroes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Superheroes")),
      body: FutureBuilder(
        future: SuperheroApi().getAllSuperheroes(limit: 15),
        builder: (context, AsyncSnapshot<List<SuperHero>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            superheroes = snapshot.data!;
            return SuperheroList(superheroList: superheroes);
          } else {
            return const LoadingItem(
              message: "Cargando superhéroes...",
            );
          }
        },
      ),
    );
  }
}
