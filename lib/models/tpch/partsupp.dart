import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';
import 'package:nosql_gui/models/tpch/part.dart';
import 'package:provider/provider.dart';

import '../../provider/data_provider.dart';
import '../../repository/data.dart';
import '../../screens/dashboard/components/partsupp_collection_table.dart';


class Partsupp extends BaseCollection{
  String part;
  String partsuppKey;
  String availqty;
  String supplycost;
  String comment;


  Partsupp(String id, this.part, this.partsuppKey, this.availqty, this.supplycost, this.comment) : super(id);

  DataRow getRow(SelectedCallBack callback,
      List<String> selectedIds,) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(partsuppKey)),
        DataCell(Text(Data().partList.firstWhere((element) => element.id == part).name),
            onTap: (){
              Part par = Data().partList.firstWhere((element) => element.id == part);
              Data().tempPartList.clear();
              Data().tempPartList.add(par);

              Provider.of<DataProvider>(Data().context, listen: false).updateTempFlag("PART");

            }),
        DataCell(Text(availqty)),
        DataCell(Text(supplycost)),
        DataCell(Text(comment)),
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }

  Partsupp.fromJson(Map<String, dynamic> json):
        partsuppKey = json['PS_SUPPKEY'].toString(),
        availqty = json['PS_AVAILQTY'].toString(),
        supplycost = json['PS_SUPPLYCOST'].toString(),
        comment = json['PS_COMMENT'].toString(),
        part = json['PS_PARTKEY'].toString(),
        super(json['PS_SUPPKEY'].toString()+ "_" + json['PS_PARTKEY'].toString());
}

