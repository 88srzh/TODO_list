import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/database.dart';
import 'package:todo_list/pages/loginPage.dart';
import 'package:todo_list/pages/home_page.dart';
import 'package:todo_list/pages/registration.dart';
import 'package:todo_list/services/authorization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ignore: missing_required_param
        ChangeNotifierProvider<Database>(
          create: (_) => Database(),
        ),
        Provider<AuthentificationService>(
            create: (_) => AuthentificationService(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) =>
              context.read<AuthentificationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('ru', ''),
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.red,
            primaryColor: Colors.red,
            accentColor: Colors.redAccent,
            fontFamily: "CormorantInfant"),
        title: 'Task App',
        home: AuthentificationWrapper(),
        routes: <String, WidgetBuilder>{
        '/pages/registration.dart': (BuildContext context) => RegistrationPage(),
      }
      ),
    );
  }
}

class AuthentificationWrapper extends StatelessWidget {
  const AuthentificationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    // return RegistrationPage();
    return LoginPage();
  }
}
