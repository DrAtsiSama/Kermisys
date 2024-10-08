import 'package:flutter/material.dart';
import '../models/kermesse.dart';
import '../services/kermesse_service.dart';

class KermesseListScreen extends StatefulWidget {
  @override
  _KermesseListScreenState createState() => _KermesseListScreenState();
}

class _KermesseListScreenState extends State<KermesseListScreen> {
  final KermesseService _kermesseService = KermesseService();
  List<Kermesse> _kermesses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchKermesses();
  }

  Future<void> _fetchKermesses() async {
    try {
      final kermesses = await _kermesseService.fetchKermesses(); // Appel au service
      setState(() {
        _kermesses = kermesses;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print("Erreur lors du chargement des kermesses : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Kermesses'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _kermesses.length,
        itemBuilder: (context, index) {
          final kermesse = _kermesses[index];
          return ListTile(
            title: Text(kermesse.name),
            subtitle: Text(kermesse.location),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/kermesse_detail',
                arguments: kermesse,
              );
            },
          );
        },
      ),
    );
  }
}
