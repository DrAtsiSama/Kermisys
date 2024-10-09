import 'package:flutter/material.dart';
import '../models/standModel.dart';
import '../services/stand_service.dart';
import '../services/auth_service.dart';  // Import pour récupérer le rôle
import '../widgets/standCard.dart';
import 'create_stand_screen.dart';

class StandListScreen extends StatefulWidget {
  final int kermesseId;

  StandListScreen({required this.kermesseId});

  @override
  _StandListScreenState createState() => _StandListScreenState();
}

class _StandListScreenState extends State<StandListScreen> {
  final StandService _standService = StandService();
  final AuthService _authService = AuthService();  // Instance pour gérer l'authentification
  List<Stand> _stands = [];
  bool _isLoading = true;
  String? _userRole;  // Variable pour stocker le rôle de l'utilisateur
  int? _userId;  // Stocker l'ID de l'utilisateur connecté

  @override
  void initState() {
    super.initState();
    _fetchStands();
    _getUserRole();  // Récupérer le rôle de l'utilisateur lors de l'initialisation
  }

  // Méthode pour récupérer le rôle et l'ID de l'utilisateur
  Future<void> _getUserRole() async {
    try {
      final user = await _authService.getProfile();  // On suppose que cette méthode renvoie les infos de l'utilisateur connecté
      setState(() {
        _userRole = user['role'];  // Assigner le rôle de l'utilisateur
        _userId = user['id'];  // Assigner l'ID de l'utilisateur
      });
    } catch (error) {
      print("Erreur lors de la récupération du rôle de l'utilisateur : $error");
    }
  }

  Future<void> _fetchStands() async {
    try {
      final stands = await _standService.getStandsByKermesseId(kermesseId: widget.kermesseId);
      setState(() {
        _stands = stands;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _stands = []; // Pour éviter les erreurs si la liste est vide
      });
      print("Erreur lors du chargement des stands : $error");
    }
  }

  void _onBuyItem(Stand stand) async {
    try {
      final updatedStock = await _standService.interactWithStand(stand.id, 'buy_item');
      setState(() {
        stand.stock = updatedStock;
      });
    } catch (error) {
      print("Erreur lors de l'achat d'un article : $error");
    }
  }

  void _onPlayGame(Stand stand) async {
    try {
      await _standService.interactWithStand(stand.id, 'play_game');
    } catch (error) {
      print("Erreur lors de la participation au jeu : $error");
    }
  }

  // Naviguer vers la page de création de stand
  void _navigateToCreateStand() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateStandScreen(kermesseId: widget.kermesseId),
      ),
    );

    // Si le stand a été créé avec succès
    if (result == true) {
      _fetchStands();  // Recharger la liste des stands
    }
  }

  void _onEditStand(Stand stand) {
    // Logique de modification du stand (à implémenter)
    print("Modifier stand : ${stand.name}");
  }

  void _onDeleteStand(Stand stand) {
    // Logique de suppression du stand (à implémenter)
    print("Supprimer stand : ${stand.name}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Stands'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _stands.isEmpty
          ? Center(
        child: Text(
          'Aucun stand disponible pour le moment',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: _stands.length,
        itemBuilder: (context, index) {
          final stand = _stands[index];
          final canEditOrDelete = (_userRole == 'admin' || _userRole == 'organisateur' || stand.ownerId == _userId);  // Vérifie si l'utilisateur peut modifier ou supprimer

          return StandCard(
            stand: stand,
            standService: _standService,
            onBuyItem: () => _onBuyItem(stand),
            onPlayGame: () => _onPlayGame(stand),
            onEditStand: () => _onEditStand(stand),  // Passer le callback pour modification
            onDeleteStand: () => _onDeleteStand(stand),  // Passer le callback pour suppression
            canEditOrDelete: canEditOrDelete,  // Permet d'afficher ou non les boutons
          );
        },
      ),
      floatingActionButton: (_userRole == 'admin' || _userRole == 'organisateur' || _userRole == 'parent')
          ? FloatingActionButton(
        onPressed: _navigateToCreateStand,  // Naviguer vers la page de création de stand
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      )
          : null,
    );
  }
}
