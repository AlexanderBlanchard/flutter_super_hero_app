import 'package:flutter/material.dart';

class LoadingItem extends StatelessWidget {
  final String message;
  const LoadingItem({super.key, this.message = "Cargando elementos..."});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              message,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
