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
  bool _isJoined = false; // Indicateur si l'utilisateur a rejoint la kermesse
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkIfUserJoined(); // Vérifie si l'utilisateur a déjà rejoint la kermesse
  }

  // Vérifie si l'utilisateur a rejoint la kermesse
  Future<void> _checkIfUserJoined() async {
    try {
      final bool joined = await _kermesseService.isUserJoined(widget.kermesse.id);
      setState(() {
        _isJoined = joined;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print("Erreur lors de la vérification de l'inscription : $error");
    }
  }

  // Méthode pour rejoindre la kermesse
  Future<void> _joinKermesse() async {
    try {
      await _kermesseService.joinKermesse(widget.kermesse.id);
      setState(() {
        _isJoined = true;
      });
    } catch (error) {
      print("Erreur lors de l'inscription à la kermesse : $error");
    }
  }

  // Méthode pour quitter la kermesse
  Future<void> _leaveKermesse() async {
    try {
      await _kermesseService.leaveKermesse(widget.kermesse.id);
      setState(() {
        _isJoined = false;
      });
    } catch (error) {
      print("Erreur lors du désinscription à la kermesse : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
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
              'Description : ${widget.kermesse.description}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            _isJoined
                ? ElevatedButton(
              onPressed: () {
                // L'utilisateur a rejoint la kermesse, on l'envoie vers la liste des stands
                Navigator.pushNamed(
                  context,
                  '/stand_list',
                  arguments: widget.kermesse.id,
                );
              },
              child: Text('Voir les stands'),
            )
                : ElevatedButton(
              onPressed: _joinKermesse,
              child: Text('Rejoindre la kermesse'),
            ),
            SizedBox(height: 10),
            _isJoined
                ? ElevatedButton(
              onPressed: _leaveKermesse,
              child: Text('Quitter la kermesse'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Couleur du bouton Quitter
              ),
            )
                : Container(), // Si l'utilisateur n'a pas rejoint, ne rien afficher
          ],
        ),
      ),
    );
  }
}
