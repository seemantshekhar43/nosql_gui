import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';

import '../../tables.dart';
import 'region.dart';

class Nation extends BaseCollection {
  String name;
  String comment;
  Region region;

  Nation(String id, this.name, this.comment, this.region) : super(id);

  DataRow getRow(SelectedCallBack callback,
      List<String> selectedIds,) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(name)),
        DataCell(Text(comment)),
        DataCell(Text(region.name))
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }
}