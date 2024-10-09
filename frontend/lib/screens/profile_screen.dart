import 'package:flutter/material.dart';
import '../models/transactionModel.dart';
import '../services/auth_service.dart';
import '../models/user.dart';
import '../services/payment_service.dart'; // Service de paiement pour récupérer les transactions

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _authService = AuthService();
  final PaymentService _paymentService = PaymentService();
  User? user; // Utiliser le modèle User pour stocker les données utilisateur
  int? tokens; // Variable pour stocker les tokens de l'utilisateur
  List<Transaction> transactions = []; // Liste des transactions
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    try {
      // Récupérer les infos utilisateur
      final userData = await _authService.getUserProfile();
      // Récupérer les tokens
      final userTokens = await _authService.getUserTokens(); // Nouvelle méthode pour récupérer les tokens
      // Récupérer les transactions
      final userTransactions = await _paymentService.getUserTransactions(userData?.id);

      setState(() {
        user = userData;
        tokens = userTokens;
        transactions = userTransactions;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print("Erreur lors du chargement des données de profil : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Utilisateur'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nom d\'utilisateur : ${user?.username ?? 'Non disponible'}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Email : ${user?.email ?? 'Non disponible'}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Tokens disponibles : ${tokens ?? 'Non disponible'}',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              SizedBox(height: 20),
              Text(
                'Transactions récentes :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              transactions.isEmpty
                  ? Text('Aucune transaction disponible.')
                  : Column(
                children: transactions
                    .map((transaction) => ListTile(
                  title: Text('Transaction : ${transaction?.id}'),
                  subtitle: Text('Montant : ${transaction.amount}'),
                ))
                    .toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _authService.logout();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('Déconnexion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
