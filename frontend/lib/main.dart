import 'package:Kermisys/screens/kermesse_detail_screen.dart';
import 'package:Kermisys/screens/stand_list_screen.dart';
import 'package:Kermisys/screens/token_purchase_screen.dart';
import 'package:flutter/material.dart';
import 'models/kermesse.dart';
import 'screens/login_screen.dart';
import 'screens/kermesse_list_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kermesse App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',  // Assure que l'écran de connexion est le premier
      routes: {
        '/login': (context) => LoginScreen(),
        '/kermesse': (context) => KermesseApp(), // Inclut le Drawer et la liste des kermesses
        '/profile': (context) => ProfileScreen(),
        '/kermesse_detail': (context) => KermesseDetailScreen(
          kermesse: ModalRoute.of(context)!.settings.arguments as Kermesse,
        ),
        '/stand_list': (context) => StandListScreen(
          kermesseId: ModalRoute.of(context)!.settings.arguments as int,
        ),
        '/purchase_tokens': (context) => TokenPurchaseScreen(),
      },
    );
  }
}

class KermesseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kermesse App')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Liste des Kermesses'),
              onTap: () {
                Navigator.pushNamed(context, '/kermesse');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mon Profil'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Déconnexion'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
            Divider(), // Séparation pour organiser les sections
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Détails Kermesse'),
              onTap: () {
                // Navigue vers l'écran des détails d'une kermesse, un exemple fictif d'ID
                Navigator.pushNamed(context, '/kermesse_detail', arguments: Kermesse(id: 1, name: "Kermesse", location: "Paris", startDate: "2024-01-01", endDate: "2024-01-02", description: ''));
              },
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text('Liste des Stands'),
              onTap: () {
                // Navigue vers l'écran de la liste des stands, un exemple fictif d'ID de kermesse
                Navigator.pushNamed(context, '/stand_list', arguments: 1);
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Acheter des Jetons'),
              onTap: () {
                // Navigue vers l'écran d'achat de jetons
                Navigator.pushNamed(context, '/purchase_tokens');
              },
            ),
          ],
        ),
      ),
      body: KermesseListScreen(), // Affiche la liste des kermesses
    );
  }
}
