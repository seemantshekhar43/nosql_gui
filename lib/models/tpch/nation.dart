import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';
import 'package:nosql_gui/repository/data.dart';

import '../../tables.dart';


class Nation extends BaseCollection {
  String name;
  String comment;
  String region;

  Nation(String id, this.name, this.comment, this.region) : super(id);

  DataRow getRow(SelectedCallBack callback,
      List<String> selectedIds,) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(name)),
        DataCell(Text(comment)),
        DataCell(Text(Data.regionList.firstWhere((element) => element.id == region).name)),
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }

  Nation.fromJson(Map<String, dynamic> json):
        name = json['N_NAME'].toString(),
        comment = json['N_COMMENT'].toString(),
        region = json['N_REGIONKEY'].toString(),
        super(json['N_NATIONKEY'].toString());
}