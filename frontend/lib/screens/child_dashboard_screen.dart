import 'package:flutter/material.dart';
import 'models/user_model.dart';
import 'models/stand_interaction_model.dart';

class ChildDashboardScreen extends StatelessWidget {
  final User parent; // Représente le parent connecté
  final List<User> children; // Liste des enfants du parent
  final List<StandInteraction> interactions; // Interactions des enfants avec les stands

  ChildDashboardScreen({required this.parent, required this.children, required this.interactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord des enfants'),
      ),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) {
          final child = children[index];
          final childInteractions = interactions.where((interaction) => interaction.userId == child.id).toList();

          return ExpansionTile(
            title: Text('Enfant : ${child.name}'),
            children: childInteractions.map((interaction) {
              return ListTile(
                title: Text('Stand : ${interaction.standId}'),
                subtitle: Text('Jetons utilisés : ${interaction.tokensUsed}, Points gagnés : ${interaction.pointsAwarded}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
