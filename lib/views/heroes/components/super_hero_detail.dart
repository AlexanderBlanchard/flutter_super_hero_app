import 'package:app_superheroes/models/superhero.dart';
import 'package:flutter/material.dart';

class SuperHeroDetail extends StatefulWidget {
  final SuperHero hero;
  const SuperHeroDetail({Key? key, required this.hero}) : super(key: key);

  @override
  _SuperHeroDetailState createState() => _SuperHeroDetailState();
}

class _SuperHeroDetailState extends State<SuperHeroDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.hero.name),
      ),
      body: SingleChildScrollView(
        // Agregado SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                // Agregado Flexible
                child: Hero(
                  tag: 'hero-${widget.hero.slug}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      widget.hero.images.lg,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width *
                          0.4, // Agregado ancho
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hero.name,
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nombre Completo: ${widget.hero.biography.fullName}',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'Primera Aparición: ${widget.hero.biography.firstAppearance}',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Inteligencia: ${widget.hero.powerstats.intelligence}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Fuerza: ${widget.hero.powerstats.strength}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      // Puedes agregar más detalles si lo deseas
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
