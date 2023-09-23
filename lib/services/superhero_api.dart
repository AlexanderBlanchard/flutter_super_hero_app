import 'package:app_superheroes/models/superhero.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SuperheroApi {
  final String baseUrl = 'https://akabab.github.io/superhero-api/api';

  final client = http.Client();

  Future<List<SuperHero>> getAllSuperheroes() async {
    final response = await client.get(Uri.parse('$baseUrl/all.json'));

    if (response.statusCode == 200) {
      List<dynamic> superheroList = json.decode(response.body);
      return superheroList.map((json) => SuperHero.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener la lista de superhéroes');
    }
  }

  Future<SuperHero> getSuperheroById(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/id/$id.json'));

    if (response.statusCode == 200) {
      return SuperHero.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener el superhéroe con ID: $id');
    }
  }

  Future<PowerStats> getPowerStatsById(int id) async {
    final response =
        await client.get(Uri.parse('$baseUrl/powerstats/$id.json'));

    if (response.statusCode == 200) {
      return PowerStats.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Error al obtener las estadísticas de poder del superhéroe con ID: $id');
    }
  }

  Future<Appearance> getAppearanceById(int id) async {
    final response =
        await client.get(Uri.parse('$baseUrl/appearance/$id.json'));

    if (response.statusCode == 200) {
      return Appearance.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Error al obtener la apariencia del superhéroe con ID: $id');
    }
  }

  Future<Biography> getBiographyById(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/biography/$id.json'));

    if (response.statusCode == 200) {
      return Biography.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Error al obtener la biografía del superhéroe con ID: $id');
    }
  }

  Future<Connections> getConnectionsById(int id) async {
    final response =
        await client.get(Uri.parse('$baseUrl/connections/$id.json'));

    if (response.statusCode == 200) {
      return Connections.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Error al obtener las conexiones del superhéroe con ID: $id');
    }
  }

  Future<Work> getWorkById(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/work/$id.json'));

    if (response.statusCode == 200) {
      return Work.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al obtener el trabajo del superhéroe con ID: $id');
    }
  }

  void dispose() {
    client.close();
  }
}
