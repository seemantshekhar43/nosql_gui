import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';

import '../../screens/dashboard/components/part_collection_table.dart';



class Region extends BaseCollection{
  String name;
  String comment;

  Region(String id, this.name, this.comment) : super(id);

  DataRow getRow(
      SelectedCallBack callback,
      List<String> selectedIds,
      ) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(name)),
        DataCell(Text(comment)),
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }

  Region.fromJson(Map<String, dynamic> json):
      name = json['R_NAME'].toString(),
      comment = json['R_COMMENT'].toString(),
      super(json['R_REGIONKEY'].toString());


}