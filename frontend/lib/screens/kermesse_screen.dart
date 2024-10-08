import 'package:flutter/material.dart';
import '../models/kermesse.dart';
import '../services/kermesse_service.dart';
import 'kermesse_detail_screen.dart';

class KermesseListScreen extends StatefulWidget {
  @override
  _KermesseListScreenState createState() => _KermesseListScreenState();
}

class _KermesseListScreenState extends State<KermesseListScreen> {
  late Future<List<Kermesse>> _kermesses;

  @override
  void initState() {
    super.initState();
    _kermesses = KermesseService().fetchKermesses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des Kermesses')),
      body: FutureBuilder<List<Kermesse>>(
        future: _kermesses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final kermesse = snapshot.data![index];
                return ListTile(
                  title: Text(kermesse.name),
                  subtitle: Text(kermesse.location),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KermesseDetailScreen(kermesse: kermesse),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('Aucune kermesse disponible'));
          }
        },
      ),
    );
  }
}
