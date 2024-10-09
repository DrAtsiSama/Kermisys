import 'package:flutter/material.dart';
import '../services/stand_service.dart';

class CreateStandScreen extends StatefulWidget {
  final int kermesseId;

  CreateStandScreen({required this.kermesseId});

  @override
  _CreateStandScreenState createState() => _CreateStandScreenState();
}

class _CreateStandScreenState extends State<CreateStandScreen> {
  final _formKey = GlobalKey<FormState>();
  final StandService _standService = StandService();

  String _name = '';
  String _description = '';
  int _stock = 0;
  String _type = ''; // Ajout de la variable 'type'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un Stand'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Kermesse ID: ${widget.kermesseId}'),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom du stand'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du stand';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  _description = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Stock'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le stock';
                  }
                  return null;
                },
                onSaved: (value) {
                  _stock = int.parse(value ?? '0');
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le type';
                  }
                  return null;
                },
                onSaved: (value) {
                  _type = value ?? '';
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Créer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        // Ajoutez 'type' lors de l'appel de createStand
        await _standService.createStand(
          kermesseId: widget.kermesseId,
          name: _name,
          description: _description,
          stock: _stock,
          type: _type, // Ajout du paramètre 'type'
        );
        // Retournez à la liste des stands après la création
        Navigator.pop(context);
      } catch (error) {
        print('Erreur lors de la création du stand : $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de la création du stand')),
        );
      }
    }
  }
}
