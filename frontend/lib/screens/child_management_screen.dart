import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/child_service.dart';

class ChildManagementScreen extends StatefulWidget {
  @override
  _ChildManagementScreenState createState() => _ChildManagementScreenState();
}

class _ChildManagementScreenState extends State<ChildManagementScreen> {
  final ChildService _childService = ChildService();
  List<String> _childrenUsernames = [];
  final TextEditingController _childUsernameController = TextEditingController();
  final TextEditingController _tokenAmountController = TextEditingController();
  bool _isLoading = false;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _fetchChildren();
  }

  Future<void> _fetchChildren() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<String> children = await _childService.getChildren();
      setState(() {
        _childrenUsernames = children;
      });
    } catch (e) {
      setState(() {
        _message = 'Erreur lors de la récupération des enfants: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _addChild() async {
    setState(() {
      _isLoading = true;
      _message = '';
    });

    try {
      String username = _childUsernameController.text.trim();
      if (username.isEmpty) {
        throw Exception('Le nom d\'utilisateur ne peut pas être vide');
      }

      await _childService.addChild(username);
      _childUsernameController.clear();
      await _fetchChildren();
      setState(() {
        _message = 'Enfant ajouté avec succès';
      });
    } catch (e) {
      setState(() {
        _message = 'Erreur lors de l\'ajout de l\'enfant: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _removeChild(String username) async {
    setState(() {
      _isLoading = true;
      _message = '';
    });

    try {
      await _childService.removeChild(username);
      await _fetchChildren();
      setState(() {
        _message = 'Enfant supprimé avec succès';
      });
    } catch (e) {
      setState(() {
        _message = 'Erreur lors de la suppression de l\'enfant: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _distributeTokens(String childUsername) async {
    setState(() {
      _isLoading = true;
      _message = '';
    });

    try {
      int amount = int.parse(_tokenAmountController.text);
      if (amount <= 0) {
        throw Exception('Le montant doit être supérieur à zéro');
      }

      await _childService.distributeTokens(amount, childUsername);
      _tokenAmountController.clear();
      setState(() {
        _message = 'Jetons distribués avec succès à $childUsername';
      });
    } catch (e) {
      setState(() {
        _message = 'Erreur lors de la distribution des jetons: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _childUsernameController.dispose();
    _tokenAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gestion des Enfants'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mes Enfants',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _childrenUsernames.isEmpty
                    ? Text('Vous n\'avez pas encore d\'enfants associés.')
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _childrenUsernames.length,
                  itemBuilder: (context, index) {
                    String username = _childrenUsernames[index];
                    return ListTile(
                      title: Text(username),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeChild(username),
                      ),
                    );
                  },
                ),
                Divider(),
                SizedBox(height: 10),
                Text(
                  'Ajouter un Enfant',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _childUsernameController,
                  decoration: InputDecoration(
                    labelText: 'Nom d\'utilisateur de l\'enfant',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addChild,
                  child: Text('Ajouter'),
                ),
                Divider(),
                SizedBox(height: 10),
                Text(
                  'Distribuer des Jetons',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _tokenAmountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nombre de jetons à distribuer',
                  ),
                ),
                SizedBox(height: 10),
                _childrenUsernames.isEmpty
                    ? Text('Ajoutez des enfants pour pouvoir leur distribuer des jetons.')
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _childrenUsernames.map((username) {
                    return ElevatedButton(
                      onPressed: () => _distributeTokens(username),
                      child: Text('Donner à $username'),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  _message,
                  style: TextStyle(
                    color: _message.contains('succès') ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
