import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';
import 'package:provider/provider.dart';

import '../../provider/data_provider.dart';
import '../../repository/data.dart';
import '../../screens/dashboard/components/supplier_collection_table.dart';
import 'nation.dart';

class Supplier extends BaseCollection{

  String name;
  String address;
  String phone;
  String acctBal;
  String comment;
  String nation;

  Supplier(String id, this.name, this.address, this.phone, this.acctBal,
      this.comment, this.nation) : super(id);


  DataRow getRow(SelectedCallBack callback,
      List<String> selectedIds,) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(name)),
        DataCell(Text(address)),
        DataCell(Text(phone)),
        DataCell(Text(acctBal)),
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

  Supplier.fromJson(Map<String, dynamic> json):
        name = json['S_NAME'].toString(),
        address = json['S_ADDRESS'].toString(),
        phone = json['S_PHONE'].toString(),
        acctBal = json['S_ACCTBAL'].toString(),
        nation = json['S_NATIONKEY'].toString(),
        comment = json['S_COMMENT'].toString(),
        super(json['S_SUPPKEY'].toString());
}

