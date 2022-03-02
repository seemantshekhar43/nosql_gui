import 'package:nosql_gui/models/history.dart';
import 'package:nosql_gui/screens/dashboard/components/nation_collection_table.dart';
import 'package:nosql_gui/screens/dashboard/components/part_collection_table.dart';

import '../../../responsive.dart';
import 'components/region_collection_table.dart';
import 'components/my_fields.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';

import 'components/recent_files.dart';
import 'components/history_details.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}


class _DashboardScreenState extends State<DashboardScreen> {
  History? history;
  bool hasHistory = false;
  String collectionName = "REGION";
  void clickCallback(History h){

    setState(() {
      history = h;
      collectionName = history!.collection;
      hasHistory = true;

    });

  }

  void tableSelectCallback(String table){
    print('table callback called');
    setState(() {
      collectionName = table;
      print(collectionName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(callback: (t) =>tableSelectCallback(t),),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      //MyFiles(),
                      SizedBox(height: defaultPadding),
                      // RecentFiles(),
                      if(collectionName == "REGION")
                      hasHistory ? RegionCollectionTable(title: "REGION", collectionName: "REGION", columns: regionColumnList, historyItem: history,):
                  RegionCollectionTable(title: "REGION", collectionName: "REGION", columns: regionColumnList,),
                      if(collectionName == "NATION")
                        hasHistory ? NationCollectionTable(title: "NATION", collectionName: "NATION", columns: nationColumnList, historyItem: history,):
                        NationCollectionTable(title: "NATION", collectionName: "NATION", columns: nationColumnList,),
                      if(collectionName == "PART")
                        hasHistory ? PartCollectionTable(title: "PART", collectionName: "PART", columns: partColumnList, historyItem: history,):
                        PartCollectionTable(title: "PART", collectionName: "PART", columns: partColumnList,),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) HistoryDetails(callback: clickCallback,),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: HistoryDetails(callback: (h) =>clickCallback(h),)
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


