import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/database.dart';
import './pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Database>(builder: (_) => Database(),)
      ],
          child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [
            // const Locale('en'),
            const Locale('ru', 'RU')
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
              primaryColor: Colors.red,
              accentColor: Colors.redAccent,
              fontFamily: "CormorantInfant"),
          title: 'Task App',
          home: HomePage(),
        ),
    );
  }
}
