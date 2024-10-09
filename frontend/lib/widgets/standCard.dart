import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/standModel.dart';
import '../services/stand_service.dart';

class StandCard extends StatelessWidget {
  final Stand stand;
  final StandService standService;
  final VoidCallback onBuyItem;
  final VoidCallback onPlayGame;
  final VoidCallback? onEditStand;  // Callback pour modifier le stand
  final VoidCallback? onDeleteStand;  // Callback pour supprimer le stand
  final bool canEditOrDelete;

  StandCard({
    required this.stand,
    required this.standService,
    required this.onBuyItem,
    required this.onPlayGame,
    this.onEditStand,
    this.onDeleteStand,
    required this.canEditOrDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stand.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Type: ${stand.type}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              "Stock: ${stand.stock}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              "Description: ${stand.description?.isEmpty ?? true ? 'Aucune description' : stand.description}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _showStandActions(context),
              child: Text('Interagir'),
            ),
            if (canEditOrDelete) ...[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: onEditStand,
                    child: Text('Modifier'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  ElevatedButton(
                    onPressed: onDeleteStand,
                    child: Text('Supprimer'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              )
            ],
          ],
        ),
      ),
    );
  }

  void _showStandActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Actions pour le stand ${stand.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: onBuyItem,
                child: Text('Acheter un article'),
              ),
              ElevatedButton(
                onPressed: onPlayGame,
                child: Text('Jouer à un jeu'),
              ),
            ],
          ),
        );
      },
    );
  }
}
