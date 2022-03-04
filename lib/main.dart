import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nosql_gui/provider/data_provider.dart';
import 'package:nosql_gui/provider/history_provider.dart';
import 'package:nosql_gui/repository/data.dart';
import '/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'controllers/menu_controller.dart';
import 'models/tpch/customer.dart';
import 'models/tpch/nation.dart';
import 'models/tpch/order.dart';
import 'models/tpch/part.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HistoryProvider()),
    ChangeNotifierProvider(create: (context) => DataProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NoSQL GUI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: FutureBuilder<String>(
          future: Provider.of<DataProvider>(context, listen: false).loadData(), // function where you call your api
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            // AsyncSnapshot<Your object type>
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text('Please wait its loading...'));
            } else {
              if (snapshot.hasError)
                return Center(child: Text('Error: ${snapshot.error}'));
              else
                return MainScreen(); // snapshot.data  :- get your object which is pass from your downloadData() function
            }
          },
        ),
      ),
    );
  }


}
