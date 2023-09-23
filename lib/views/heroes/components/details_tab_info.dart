import 'package:flutter/material.dart';

class DetailsTabInfo extends StatelessWidget {
  final List<InfoItem> items;

  const DetailsTabInfo({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icono
              Icon(items[index].icon, size: 24.0),

              // Espaciado entre ícono y título
              SizedBox(width: 16.0),

              // Título
              Expanded(
                child: Text(
                  items[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // Valor alineado a la derecha
              Expanded(
                child: Text(
                  items[index].value.toString(),
                  textAlign: TextAlign.right,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class InfoItem {
  final String title;
  final IconData icon;
  final dynamic value;

  InfoItem({
    required this.title,
    required this.icon,
    required this.value,
  });
}
