import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'models/kermesse.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart'; // Import du RegisterScreen
import 'screens/forgot_password_screen.dart'; // Import du ForgotPasswordScreen
import 'screens/kermesse_list_screen.dart';
import 'screens/kermesse_detail_screen.dart';
import 'screens/stand_list_screen.dart';
import 'screens/token_purchase_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/child_management_screen.dart'; // Import de la nouvelle page

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisez Stripe avec votre clé publique
  Stripe.publishableKey = 'votre_clé_publique'; // Remplacez par votre clé publique Stripe

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
      initialRoute: '/login', // L'écran de connexion est le premier
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(), // Nouvelle route pour l'inscription
        '/forgot_password': (context) => ForgotPasswordScreen(), // Nouvelle route pour mot de passe oublié
        '/kermesse': (context) => KermesseApp(),
        '/profile': (context) => ProfileScreen(),
        '/kermesse_detail': (context) => KermesseDetailScreen(
          kermesse: ModalRoute.of(context)!.settings.arguments as Kermesse,
        ),
        '/stand_list': (context) => StandListScreen(
          kermesseId: ModalRoute.of(context)!.settings.arguments as int,
        ),
        '/purchase_tokens': (context) => TokenPurchaseScreen(),
        '/child_management': (context) => ChildManagementScreen(), // Nouvelle route
      },
    );
  }
}

class KermesseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kermesse App'),
      ),
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
              leading: Icon(Icons.child_care),
              title: Text('Gestion des Enfants'),
              onTap: () {
                Navigator.pushNamed(context, '/child_management');
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Acheter des Jetons'),
              onTap: () {
                Navigator.pushNamed(context, '/purchase_tokens');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Déconnexion'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: KermesseListScreen(), // Affiche la liste des kermesses
    );
  }
}
