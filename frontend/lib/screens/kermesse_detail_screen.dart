import 'package:flutter/material.dart';
import '../models/kermesse.dart';
import '../services/kermesse_service.dart';
import '../services/stand_service.dart';

class KermesseDetailScreen extends StatefulWidget {
  final Kermesse kermesse;

  KermesseDetailScreen({required this.kermesse});

  @override
  _KermesseDetailScreenState createState() => _KermesseDetailScreenState();
}

class _KermesseDetailScreenState extends State<KermesseDetailScreen> {
  final KermesseService _kermesseService = KermesseService();
  final StandService _standService = StandService();
  bool _isJoined = false; // Indique si l'utilisateur a rejoint la kermesse
  bool _isLoading = true; // Indique si les données sont en cours de chargement

  @override
  void initState() {
    super.initState();
    _checkIfUserJoined(); // Vérifie si l'utilisateur a déjà rejoint la kermesse
  }

  // Vérifie si l'utilisateur a rejoint la kermesse
  Future<void> _checkIfUserJoined() async {
    try {
      final bool joined =
      await _kermesseService.isUserJoined(widget.kermesse.id);
      setState(() {
        _isJoined = joined;
        _isLoading = false;
      });
      print('Utilisateur inscrit à la kermesse : $_isJoined');
    } catch (error) {
      setState(() {
        _isJoined = false;
        _isLoading = false;
      });
      print("Erreur lors de la vérification de l'inscription : $error");
    }
  }

  // Méthode pour rejoindre la kermesse
  Future<void> _joinKermesse() async {
    try {
      await _kermesseService.joinKermesse(widget.kermesse.id);
      await _checkIfUserJoined(); // Met à jour l'état après l'action
    } catch (error) {
      print("Erreur lors de l'inscription à la kermesse : $error");
    }
  }

  // Méthode pour quitter la kermesse
  Future<void> _leaveKermesse() async {
    try {
      await _kermesseService.leaveKermesse(widget.kermesse.id);
      await _checkIfUserJoined(); // Met à jour l'état après l'action
    } catch (error) {
      print("Erreur lors de la désinscription à la kermesse : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Valeur de _isJoined dans build: $_isJoined');
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Kermesse'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nom : ${widget.kermesse.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Localisation : ${widget.kermesse.location}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Description : ${widget.kermesse.description ?? 'Aucune description'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            if (_isJoined) ...[
              ElevatedButton(
                onPressed: () {
                  // Naviguer vers la liste des stands
                  Navigator.pushNamed(
                    context,
                    '/stand_list',
                    arguments: widget.kermesse.id,
                  );
                },
                child: Text('Voir les stands'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _leaveKermesse,
                child: Text('Quitter la kermesse'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Couleur du bouton
                ),
              ),
            ] else ...[
              ElevatedButton(
                onPressed: _joinKermesse,
                child: Text('Rejoindre la kermesse'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
