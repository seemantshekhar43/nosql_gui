import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nosql_gui/provider/history_provider.dart';
import 'package:nosql_gui/repository/data.dart';
import '/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'controllers/menu_controller.dart';
import 'models/tpch/part.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HistoryProvider()),
    ],
      child: MyApp()));
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
          future: loadData(), // function where you call your api
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {  // AsyncSnapshot<Your object type>
            if( snapshot.connectionState == ConnectionState.waiting){
              return  Center(child: Text('Please wait its loading...'));
            }else{
              if (snapshot.hasError)
                return Center(child: Text('Error: ${snapshot.error}'));
              else
                return MainScreen();  // snapshot.data  :- get your object which is pass from your downloadData() function
            }
          },
        ),
      ),
    );
  }

  Future<String> loadData()async{

    //2
    String partsJson = await rootBundle.loadString('tpch_10mb/PART.json');
    List partsData = jsonDecode(partsJson).toList();
    partsData.forEach((element) {
      Part part = Part.fromJson(element);
      Data.partList.add(part);
    });

    String orderJSON = await rootBundle.loadString('tpch_10mb/ORDER.json');
    List orderData = jsonDecode(partsJson).toList();
    orderData.forEach((element) {
      Part part = Part.fromJson(element);
      Data.partList.add(part);
    });

    String customerJson = await rootBundle.loadString('tpch_10mb/PART.json');
    List customerData = jsonDecode(customerJson).toList();
    customerData.forEach((element) {
      Customer customer = Customer.fromJson(element);
      Data.customerList.add(customer);
    });

    String nationJson = await rootBundle.loadString('tpch_10mb/NATION.json');
    List orderData = jsonDecode(nationJson).toList();
    orderData.forEach((element) {
      Nation nation = Nation.fromJson(element);
      Data.nationList.add(nation);
    });

    // String regionJson = await rootBundle.loadString('tpch_10mb/REGION.json');
    // List regionData = jsonDecode(regionJson).toList();
    // regionData.forEach((element) {
    //   Region region = Region.fromJson(element);
    //   Data.regionList.add(region);
    //
    // });


    return "true";
  }
}