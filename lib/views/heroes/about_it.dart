import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey[200], // Color de fondo
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centrar contenido verticalmente
          children: <Widget>[
            Text(
              'SuperHeroes App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/superhero.png'),
            ),
            SizedBox(height: 15),
            Text(
              'Creada por',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Alexander Miguel González Blanchard',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30), // Espacio adicional después de tu nombre
            Text(
              '2023',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
