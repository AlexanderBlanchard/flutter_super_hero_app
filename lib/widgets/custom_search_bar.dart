import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final String hintText;

  const CustomSearchBar({
    Key? key,
    required this.onChanged,
    this.onSubmitted,
    this.hintText = "Buscar...",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240), // Fondo claro
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white, // Ícono de búsqueda de color negro
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.0), // Hint de color gris oscuro
            filled: true,
            fillColor: Colors.blue, // Fondo claro
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
        ),
      ),
    );
  }
}
