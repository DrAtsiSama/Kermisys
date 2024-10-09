import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../services/token_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenPurchaseScreen extends StatefulWidget {
  @override
  _TokenPurchaseScreenState createState() => _TokenPurchaseScreenState();
}

class _TokenPurchaseScreenState extends State<TokenPurchaseScreen> {
  final TokenService _tokenService = TokenService();
  final TextEditingController _tokenAmountController = TextEditingController();
  bool _isProcessing = false;
  String _message = '';
  int? _userId; // ID de l'utilisateur connecté

  @override
  void initState() {
    super.initState();
    // Initialisez Stripe avec votre clé publique
    Stripe.publishableKey = 'votre_clé_publique'; // Remplacez par votre clé publique Stripe

    _getUserId();
  }

  Future<void> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = prefs.getInt('userId');
    });
  }

  Future<void> _purchaseTokens() async {
    setState(() {
      _isProcessing = true;
      _message = '';
    });

    try {
      int amount = int.parse(_tokenAmountController.text);

      // Obtenez le clientSecret depuis votre backend
      String clientSecret = await _tokenService.createPaymentIntent(amount);

      // Initialisez le paiement avec Stripe
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Votre Nom de Marchand',
          // Si vous utilisez le mode Test, ajoutez la ligne suivante :
          // testEnv: true,
        ),
      );

      // Affichez la feuille de paiement
      await Stripe.instance.presentPaymentSheet();

      // Si le paiement est réussi, mettez à jour les jetons de l'utilisateur
      if (_userId != null) {
        await _tokenService.buyTokens(_userId!, amount);
      } else {
        throw Exception('Utilisateur non connecté');
      }

      setState(() {
        _message = 'Achat réussi';
      });
    } catch (e) {
      if (e is StripeException) {
        setState(() {
          _message = 'Paiement annulé ou échoué : ${e.error.localizedMessage}';
        });
      } else {
        setState(() {
          _message = 'Erreur lors de l\'achat des jetons: $e';
        });
      }
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  // Nouvelle méthode pour ajouter des jetons sans paiement
  Future<void> _addTokens() async {
    setState(() {
      _isProcessing = true;
      _message = '';
    });

    try {
      int amount = int.parse(_tokenAmountController.text);

      if (_userId != null) {
        await _tokenService.buyTokens(_userId!, amount);
      } else {
        throw Exception('Utilisateur non connecté');
      }

      setState(() {
        _message = 'Jetons ajoutés avec succès';
      });
    } catch (e) {
      setState(() {
        _message = 'Erreur lors de l\'ajout des jetons: $e';
      });
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  @override
  void dispose() {
    _tokenAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acheter des Jetons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _tokenAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nombre de jetons',
              ),
            ),
            SizedBox(height: 20),
            _isProcessing
                ? Center(child: CircularProgressIndicator())
                : Column(
              children: [
                ElevatedButton(
                  onPressed: _purchaseTokens,
                  child: Text('Acheter'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addTokens,
                  child: Text('Ajouter des jetons'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(
                color: _message.contains('succès') || _message.contains('réussi')
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
