class PowerStats {
  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;

  PowerStats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory PowerStats.fromJson(Map<String, dynamic> json) {
    return PowerStats(
      intelligence: json['intelligence'],
      strength: json['strength'],
      speed: json['speed'],
      durability: json['durability'],
      power: json['power'],
      combat: json['combat'],
    );
  }
}

class Appearance {
  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  Appearance({
    required this.gender,
    required this.race,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });

  factory Appearance.fromJson(Map<String, dynamic> json) {
    return Appearance(
      gender: json['gender'] ?? 'Desconocido',
      race: json['race'] ?? 'Desconocido',
      height: List<String>.from(json['height'] ?? []),
      weight: List<String>.from(json['weight'] ?? []),
      eyeColor: json['eyeColor'] ?? 'Desconocido',
      hairColor: json['hairColor'] ?? 'Desconocido',
    );
  }
}

class Biography {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  Biography({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  factory Biography.fromJson(Map<String, dynamic> json) {
    return Biography(
      fullName: json['fullName'] ?? 'Desconocido',
      alterEgos: json['alterEgos'] ?? 'Desconocido',
      aliases: List<String>.from(json['aliases'] ?? []),
      placeOfBirth: json['placeOfBirth'] ?? 'Desconocido',
      firstAppearance: json['firstAppearance'] ?? 'Desconocido',
      publisher: json['publisher'] ?? 'Desconocido',
      alignment: json['alignment'] ?? 'Desconocido',
    );
  }
}

class Work {
  final String occupation;
  final String base;

  Work({
    required this.occupation,
    required this.base,
  });

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      occupation: json['occupation'] ?? 'Desconocido',
      base: json['base'] ?? 'Desconocido',
    );
  }
}

class Connections {
  final String groupAffiliation;
  final String relatives;

  Connections({
    required this.groupAffiliation,
    required this.relatives,
  });

  factory Connections.fromJson(Map<String, dynamic> json) {
    return Connections(
      groupAffiliation: json['groupAffiliation'] ?? 'Desconocido',
      relatives: json['relatives'] ?? 'Desconocido',
    );
  }
}

class Images {
  final String xs;
  final String sm;
  final String md;
  final String lg;

  Images({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      xs: json['xs'] ?? 'URL no disponible',
      sm: json['sm'] ?? 'URL no disponible',
      md: json['md'] ?? 'URL no disponible',
      lg: json['lg'] ?? 'URL no disponible',
    );
  }
}

class SuperHero {
  final int id;
  final String name;
  final String slug;
  final PowerStats powerstats;
  final Appearance appearance;
  final Biography biography;
  final Work work;
  final Connections connections;
  final Images images;

  SuperHero({
    required this.id,
    required this.name,
    required this.slug,
    required this.powerstats,
    required this.appearance,
    required this.biography,
    required this.work,
    required this.connections,
    required this.images,
  });

  factory SuperHero.fromJson(Map<String, dynamic> json) {
    return SuperHero(
      id: json['id'],
      name: json['name'] ?? 'Desconocido',
      slug: json['slug'] ?? 'Desconocido',
      powerstats: PowerStats.fromJson(json['powerstats'] ?? {}),
      appearance: Appearance.fromJson(json['appearance'] ?? {}),
      biography: Biography.fromJson(json['biography'] ?? {}),
      work: Work.fromJson(json['work'] ?? {}),
      connections: Connections.fromJson(json['connections'] ?? {}),
      images: Images.fromJson(json['images'] ?? {}),
    );
  }
}
