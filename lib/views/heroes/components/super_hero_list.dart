import 'package:app_superheroes/models/superhero.dart';
import 'package:app_superheroes/views/heroes/components/super_hero_item.dart';
import 'package:app_superheroes/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class SuperheroList extends StatefulWidget {
  final List<SuperHero> superheroList;
  final String searchTerm;
  final Function(String) onSearchChanged;

  const SuperheroList({
    Key? key,
    required this.superheroList,
    required this.searchTerm,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  State<SuperheroList> createState() => _SuperheroListState();
}

class _SuperheroListState extends State<SuperheroList> {
  List<SuperHero> _filteredSuperheroes = [];

  @override
  void didUpdateWidget(covariant SuperheroList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _filteredSuperheroes = widget.superheroList
        .where((hero) =>
            hero.name.toLowerCase().contains(widget.searchTerm.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(
          onChanged: widget.onSearchChanged,
          onSubmitted: (value) {},
          hintText: "Escribe aquí el nombre del superhéroe...",
        ),
        Divider(),
        Expanded(
          child: _filteredSuperheroes.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: _filteredSuperheroes.length,
                  itemBuilder: (context, index) {
                    return SuperheroItem(hero: _filteredSuperheroes[index]);
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        "No hay superhéroes con ese nombre",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
