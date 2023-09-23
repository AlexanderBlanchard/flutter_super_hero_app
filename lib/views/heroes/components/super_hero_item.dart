import 'package:app_superheroes/models/superhero.dart';
import 'package:app_superheroes/styles/text_styles.dart';
import 'package:app_superheroes/views/heroes/components/super_hero_detail.dart';
import 'package:flutter/material.dart';

class SuperheroItem extends StatelessWidget {
  final SuperHero hero;
  const SuperheroItem({Key? key, required this.hero}) : super(key: key);

  void _showSuperheroDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SuperHeroDetail(hero: hero),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: 'hero-superhero-${hero.id}',
      child: GestureDetector(
        onTap: () {
          _showSuperheroDetailDialog(context);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Flexible(
                flex: 7,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    hero.images.md,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      hero.name,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
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
