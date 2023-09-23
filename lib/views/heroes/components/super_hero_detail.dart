import 'package:app_superheroes/models/superhero.dart';
import 'package:app_superheroes/views/heroes/components/details_tab_info.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SuperHeroDetail extends StatefulWidget {
  final SuperHero hero;
  const SuperHeroDetail({Key? key, required this.hero}) : super(key: key);

  @override
  _SuperHeroDetailState createState() => _SuperHeroDetailState();
}

class _SuperHeroDetailState extends State<SuperHeroDetail> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle tabStyle =
        screenWidth < 350 ? TextStyle(fontSize: 16) : TextStyle(fontSize: 10);

    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Text(
              widget.hero.name,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blueGrey, Colors.blue],
                ),
              ),
              child: Center(
                child: Container(
                  height: screenHeight * 0.45,
                  padding: EdgeInsets.all(20.0),
                  child: Hero(
                    tag: 'hero-${widget.hero.slug}',
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: widget.hero.images.lg,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TabBar(
              tabs: [
                Tab(icon: Icon(Icons.bar_chart)), // Estadísticas
                Tab(icon: Icon(Icons.person)), // Apariencia
                Tab(icon: Icon(Icons.description)), // Biografía
                Tab(icon: Icon(Icons.work)), // Trabajo
                Tab(icon: Icon(Icons.people)), // Conexiones
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Estadísticas
                  DetailsTabInfo(
                    items: [
                      InfoItem(
                          title: "Inteligencia",
                          icon: Icons.bubble_chart_outlined,
                          value: widget.hero.powerstats.intelligence),
                      InfoItem(
                          title: "Fuerza",
                          icon: Icons.fitness_center,
                          value: widget.hero.powerstats.strength),
                      InfoItem(
                          title: "Velocidad",
                          icon: Icons.speed,
                          value: widget.hero.powerstats.speed),
                      InfoItem(
                          title: "Durabilidad",
                          icon: Icons.shield,
                          value: widget.hero.powerstats.durability),
                      InfoItem(
                          title: "Poder",
                          icon: Icons.power,
                          value: widget.hero.powerstats.power),
                      InfoItem(
                          title: "Combate",
                          icon: Icons.sports_kabaddi,
                          value: widget.hero.powerstats.combat),
                    ],
                  ),

                  // Apariencia
                  DetailsTabInfo(
                    items: [
                      InfoItem(
                          title: "Género",
                          icon: Icons.person,
                          value: widget.hero.appearance.gender),
                      InfoItem(
                          title: "Raza",
                          icon: Icons.group,
                          value: widget.hero.appearance.race),
                      InfoItem(
                          title: "Altura",
                          icon: Icons.height,
                          value: widget.hero.appearance.height.join(' / ')),
                      InfoItem(
                          title: "Peso",
                          icon: Icons.line_weight,
                          value: widget.hero.appearance.weight.join(' / ')),
                      InfoItem(
                          title: "Color de ojos",
                          icon: Icons.remove_red_eye_outlined,
                          value: widget.hero.appearance.eyeColor),
                      InfoItem(
                          title: "Color de pelo",
                          icon: Icons.format_color_fill_outlined,
                          value: widget.hero.appearance.hairColor),
                    ],
                  ),
                  // Biografía
                  DetailsTabInfo(
                    items: [
                      InfoItem(
                          title: "Nombre Completo",
                          icon: Icons.text_fields_outlined,
                          value: widget.hero.biography.fullName),
                      InfoItem(
                          title: "Alter Ego",
                          icon: Icons.text_fields_outlined,
                          value: widget.hero.biography.alterEgos),
                      InfoItem(
                          title: "Alias",
                          icon: Icons.text_fields_outlined,
                          value: widget.hero.biography.aliases),
                      InfoItem(
                          title: "Lugar de Nacimiento",
                          icon: Icons.brightness_high_outlined,
                          value: widget.hero.biography.placeOfBirth),
                      InfoItem(
                          title: "Primera aparición",
                          icon: Icons.approval_outlined,
                          value: widget.hero.biography.firstAppearance),
                    ],
                  ),
                  // Trabajo
                  DetailsTabInfo(
                    items: [
                      InfoItem(
                          title: "Ocupación",
                          icon: Icons.work,
                          value: widget.hero.work.occupation),
                      InfoItem(
                          title: "Base",
                          icon: Icons.home_work,
                          value: widget.hero.work.base),
                    ],
                  ),
                  // Conexiones
                  DetailsTabInfo(
                    items: [
                      InfoItem(
                          title: "Grupos",
                          icon: Icons.group_work,
                          value: widget.hero.connections.groupAffiliation),
                      InfoItem(
                          title: "Relaciones",
                          icon: Icons.family_restroom,
                          value: widget.hero.connections.relatives),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
