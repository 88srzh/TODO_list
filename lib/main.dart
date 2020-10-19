import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/database.dart';
import './pages/home_page.dart';
import 'package:intl/date_symbol_data_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ignore: missing_required_param
        ChangeNotifierProvider<Database>(builder: (_) => Database(),)
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
          home: HomePage(),
        ),
    );
  }
}
