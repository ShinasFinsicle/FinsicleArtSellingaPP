import 'package:add/constants/constant_colors.dart';
import 'package:add/pages/art/artlist_page.dart';
import 'package:add/pages/authpage/google_auth.dart';

import 'package:add/pages/letsstart/lets_start.dart';
import 'package:add/provider/art/art_details_provider.dart';
import 'package:add/provider/art/artimage_galllery_provider.dart';
import 'package:add/provider/auth_provider/google_sign_provider.dart';
import 'package:add/provider/payment_provider/payment_selector_provider.dart';
import 'package:add/provider/status/statusupdate_provider.dart';
import 'package:add/provider/user/address_model_provider.dart';
import 'package:add/provider/user/address_provider.dart';
import 'package:add/provider/user/profile_provider.dart';
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
        ChangeNotifierProvider(
          create: (_) => ArtImageGallery(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddressProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ArtDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddressDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PaymentSelectionProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StatusUpdateProvider(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: ('Poppins reg'),
            textTheme:
                const TextTheme(bodyLarge: TextStyle(color: kPrimaryTextcolor)),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                  fontSize: 16,
                  color: kPrimaryTextcolor,
                  fontFamily: ('Poppins'),
                ),
                iconTheme: IconThemeData(
                  color: kPrimaryTextcolor,
                ),
                backgroundColor: Colors.white,
                elevation: 1.0),
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
              return const GoogleAuthPage();
            }
          }),
    );
  }
}
