import 'package:add/artlistingpages/artlist_page.dart';
import 'package:add/constants/text.dart/colors.dart';

import 'package:add/pages/letsstart/lets_start.dart';
import 'package:add/provider/google_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GoogleSignProvider(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
            textTheme:
                const TextTheme(bodyLarge: TextStyle(color: kPrimaryTextcolor)),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 1.0 // set the background color to white
                ),
          ),
          debugShowCheckedModeBanner: false,
          home: const ListenAuthChanges()),
    );
  }
}

class ListenAuthChanges extends StatelessWidget {
  const ListenAuthChanges({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const ArtlistScreen();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something Went Wrong!'),
              );
            } else {
              return const LetsStart();
            }
          }),
    );
  }
}
