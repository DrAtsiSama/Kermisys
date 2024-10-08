import 'package:flutter/material.dart';
import '../models/standModel.dart';
import '../services/stand_service.dart';

class StandListScreen extends StatefulWidget {
  final int kermesseId;

  StandListScreen({required this.kermesseId});

  @override
  _StandListScreenState createState() => _StandListScreenState();
}

class _StandListScreenState extends State<StandListScreen> {
  final StandService _standService = StandService();
  List<Stand> _stands = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchStands();
  }

  Future<void> _fetchStands() async {
    try {
      final stands = await _standService.getStandsByKermesseId(widget.kermesseId);
      setState(() {
        _stands = stands;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print("Erreur lors du chargement des stands : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Stands'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _stands.length,
        itemBuilder: (context, index) {
          final stand = _stands[index];
          return _buildStandCard(stand);
        },
      ),
    );
  }

  // Widget pour afficher les stands sous forme de Card
  Widget _buildStandCard(Stand stand) {
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
              "Description: ${stand.description.isEmpty ? 'Aucune description' : stand.description}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _showStandActions(stand),
                  child: Text('Interagir'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Fonction pour afficher les actions liées au stand
  void _showStandActions(Stand stand) {
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
                onPressed: () async {
                  try {
                    await _standService.interactWithStand(stand.id, 'buy_item');
                    Navigator.pop(context);
                  } catch (error) {
                    print('Erreur lors de l\'interaction : $error');
                  }
                },
                child: Text('Acheter un article'),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await _standService.interactWithStand(stand.id, 'play_game');
                    Navigator.pop(context);
                  } catch (error) {
                    print('Erreur lors de l\'interaction : $error');
                  }
                },
                child: Text('Jouer à un jeu'),
              ),
            ],
          ),
        );
      },
    );
  }
}
