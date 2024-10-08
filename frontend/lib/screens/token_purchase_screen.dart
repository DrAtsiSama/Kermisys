import 'package:flutter/material.dart';
import '../services/token_service.dart';

class TokenPurchaseScreen extends StatefulWidget {
  @override
  _TokenPurchaseScreenState createState() => _TokenPurchaseScreenState();
}

class _TokenPurchaseScreenState extends State<TokenPurchaseScreen> {
  final TokenService _tokenService = TokenService();
  final TextEditingController _tokenAmountController = TextEditingController();
  bool _isProcessing = false;
  String _message = '';

  Future<void> _purchaseTokens() async {
    setState(() {
      _isProcessing = true;
      _message = '';
    });

    try {
      int amount = int.parse(_tokenAmountController.text);
      await _tokenService.buyTokens(1, amount); // Exemple avec userId = 1
      setState(() {
        _message = 'Achat réussi';
      });
    } catch (e) {
      setState(() {
        _message = 'Erreur lors de l\'achat des jetons: $e';
      });
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
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
                : ElevatedButton(
              onPressed: _purchaseTokens,
              child: Text('Acheter'),
            ),
            SizedBox(height: 20),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
