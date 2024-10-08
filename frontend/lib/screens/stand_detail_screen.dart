import 'package:flutter/material.dart';
import '../models/standModel.dart';

class StandDetailScreen extends StatelessWidget {
  final Stand stand;

  StandDetailScreen({required this.stand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Stand'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stand.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Type : ${stand.type}"),
            SizedBox(height: 10),
            Text("Stock : ${stand.stock}"),
            SizedBox(height: 10),
            Text("Lieu : ${stand.location}"),
          ],
        ),
      ),
    );
  }
}
