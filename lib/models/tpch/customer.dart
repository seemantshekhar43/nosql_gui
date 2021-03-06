import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';
import 'package:provider/provider.dart';

import '../../provider/data_provider.dart';
import '../../repository/data.dart';

import '../../screens/dashboard/components/customer_collection_table.dart';
import 'nation.dart';

class Customer extends BaseCollection {
  String name;
  String address;
  String phone;
  String acctbal;
  String mktsegment;
  String comment;
  String nation;

  Customer(String id, this.name, this.address, this.phone, this.acctbal,
      this.mktsegment, this.comment, this.nation)
      : super(id);

  //3
  DataRow getRow(
    SelectedCallBack callback,
    List<String> selectedIds,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(name)),
        DataCell(Text(address)),
        DataCell(Text(phone)),
        DataCell(Text(acctbal)),
        DataCell(Text(mktsegment)),
        DataCell(Text(comment)),
        DataCell(Text(Data().nationList.firstWhere((element) => element.id == nation).name),
            onTap: (){
              Nation nat = Data().nationList.firstWhere((element) => element.id == nation);
              Data().tempNationList.clear();
              Data().tempNationList.add(nat);
              Provider.of<DataProvider>(Data().context, listen: false).updateTempFlag("NATION");
        }),
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }

  //1
  Customer.fromJson(Map<String, dynamic> json)
      : name = json['C_NAME'].toString(),
        address = json['C_ADDRESS'].toString(),
        phone = json['C_PHONE'].toString(),
        acctbal = json['C_ACCTBAL'].toString(),
        mktsegment = json['C_MKTSEGMENT'].toString(),
        comment = json['C_COMMENT'].toString(),
        nation = json['C_NATIONKEY'].toString(),
        super(json['C_CUSTKEY'].toString());
}
