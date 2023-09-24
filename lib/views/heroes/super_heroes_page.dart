import 'package:app_superheroes/models/superhero.dart';
import 'package:app_superheroes/services/superhero_api.dart';
import 'package:app_superheroes/views/heroes/about_it.dart';
import 'package:app_superheroes/views/heroes/components/super_hero_list.dart';
import 'package:app_superheroes/widgets/loading_item.dart';
import 'package:flutter/material.dart';

class SuperheroesPage extends StatefulWidget {
  const SuperheroesPage({Key? key}) : super(key: key);

  @override
  State<SuperheroesPage> createState() => _SuperheroesPageState();
}

class _SuperheroesPageState extends State<SuperheroesPage> {
  List<SuperHero> superheroes = [];
  List<SuperHero> filteredSuperheroes = [];

  String _searchText = '';
  int _currentPage = 1;
  final int _itemsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _loadSuperheroes();
  }

  _loadSuperheroes() async {
    superheroes = await SuperheroApi().getAllSuperheroes();
    setState(() {
      _currentPage = 1;
      _updateFilteredSuperheroes();
    });
  }

  _filterSuperheroes(String text) {
    setState(() {
      _searchText = text;
      _currentPage = 1;
      _updateFilteredSuperheroes();
    });
  }

  _updateFilteredSuperheroes() {
    if (superheroes == null) return;

    filteredSuperheroes = superheroes!
        .where((hero) =>
            _searchText.isEmpty ||
            hero.name.toLowerCase().contains(_searchText.toLowerCase()))
        .skip((_currentPage - 1) * _itemsPerPage)
        .take(_itemsPerPage)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Superheroes"),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AcercaDeScreen()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: superheroes == null
                ? const LoadingItem(message: "Cargando superhéroes...")
                : SuperheroList(
                    superheroList: filteredSuperheroes!,
                    searchTerm: _searchText,
                    onSearchChanged: _filterSuperheroes,
                  ),
          ),
          // Botones de navegación
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _currentPage == 1
                    ? null
                    : () {
                        setState(() {
                          _currentPage--;
                          _updateFilteredSuperheroes();
                        });
                      },
                child: Text("Anterior"),
              ),
              Text("Página $_currentPage"),
              ElevatedButton(
                onPressed: (filteredSuperheroes == null ||
                        filteredSuperheroes!.length < _itemsPerPage)
                    ? null
                    : () {
                        setState(() {
                          _currentPage++;
                          _updateFilteredSuperheroes();
                        });
                      },
                child: Text("Siguiente"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
