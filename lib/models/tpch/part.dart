import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';

import '../../screens/dashboard/components/part_collection_table.dart';

class Part extends BaseCollection{
  String name;
  String mfgr;
  String brand;
  String type;
  String size;
  String container;
  String retailprice;
  String comment;

  Part(String id, this.name, this.mfgr, this.brand, this.type, this.size,
      this.container, this.retailprice, this.comment): super(id);

  //3
  DataRow getRow(SelectedCallBack callback,
      List<String> selectedIds,) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(name)),
        DataCell(Text(mfgr)),
        DataCell(Text(brand)),
        DataCell(Text(type)),
        DataCell(Text(size)),
        DataCell(Text(container)),
        DataCell(Text(retailprice)),
        DataCell(Text(comment))
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }

  //1
  Part.fromJson(Map<String, dynamic> json):
    name = json['P_NAME'].toString(),
    mfgr = json['P_MFGR'].toString(),
    brand = json['P_BRAND'].toString(),
    type = json['P_TYPE'].toString(),
    size = json['P_SIZE'].toString(),
    container = json['P_CONTAINER'].toString(),
    retailprice = json['P_RETAILPRICE'].toString(),
    comment = json['P_COMMENT'].toString(),
        super(json['P_PARTKEY'].toString());

}