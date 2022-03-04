import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';
import 'package:nosql_gui/models/tpch/part.dart';
import 'package:nosql_gui/models/tpch/partsupp.dart';
import 'package:provider/provider.dart';

import '../../provider/data_provider.dart';
import '../../repository/data.dart';
import '../../screens/dashboard/components/lineitem_collection_table.dart';
import 'order.dart';


class Lineitem extends BaseCollection{

  String order;
  String part;
  String partsupp;
  String lineNumber;
  String quantity;
  String extendedPrice;
  String discount;
  String tax;
  String returnFlag;
  String lineStatus;
  String shipDate;
  String commitDate;
  String receiptDate;
  String shipInstruct;
  String shipMode;
  String comment;

  Lineitem(String id, this.order, this.part, this.partsupp, this.lineNumber,
      this.quantity, this.extendedPrice, this.discount, this.tax,
      this.returnFlag, this.lineStatus, this.shipDate, this.commitDate,
      this.receiptDate, this.shipInstruct, this.shipMode, this.comment) : super(id);

  DataRow getRow(SelectedCallBack callback,
      List<String> selectedIds,) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(order),
            onTap: (){
              Order or = Data().orderList.firstWhere((element) => element.id == order);
              Data().tempOrderList.clear();
              Data().tempOrderList.add(or);

              Provider.of<DataProvider>(Data().context, listen: false).updateTempFlag("ORDER");

            }),
        DataCell(Text(Data().partList.firstWhere((element) => element.id == part).name),
            onTap: (){
              Part par = Data().partList.firstWhere((element) => element.id == part);
              Data().tempPartList.clear();
              Data().tempPartList.add(par);

              Provider.of<DataProvider>(Data().context, listen: false).updateTempFlag("PART");

            }),
        DataCell(Text(partsupp),
            onTap: (){
              Partsupp parsup = Data().partsuppList.firstWhere((element) => element.id == partsupp+"_"+part);
              Data().tempPartsuppList.clear();
              Data().tempPartsuppList.add(parsup);

              Provider.of<DataProvider>(Data().context, listen: false).updateTempFlag("PARTSUPP");

            }),

        DataCell(Text(lineNumber)),
        DataCell(Text(quantity)),
        DataCell(Text(extendedPrice)),
        DataCell(Text(discount)),
        DataCell(Text(tax)),
        DataCell(Text(returnFlag)),
        DataCell(Text(lineStatus)),
        DataCell(Text(shipDate)),
        DataCell(Text(commitDate)),
        DataCell(Text(receiptDate)),
        DataCell(Text(shipInstruct)),
        DataCell(Text(shipMode)),
        DataCell(Text(comment)),
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }


  Lineitem.fromJson(Map<String, dynamic> json):
      order = json['L_ORDERKEY'].toString(),
      part = json['L_PARTKEY'].toString(),
      partsupp = json['L_SUPPKEY'].toString(),
      lineNumber = json['L_LINENUMBER'].toString(),
      quantity = json['L_QUANTITY'].toString(),
      extendedPrice = json['L_EXTENDEDPRICE'].toString(),
      discount = json['L_DISCOUNT'].toString(),
      tax = json['L_TAX'].toString(),
      returnFlag = json['L_RETURNFLAG'].toString(),
      lineStatus = json['L_LINESTATUS'].toString(),
      shipDate = json['L_SHIPDATE'].toString(),
      commitDate = json['L_COMMITDATE'].toString(),
      receiptDate = json['L_RECEIPTDATE'].toString(),
      shipInstruct = json['L_SHIPINSTRUCT'].toString(),
      shipMode = json['L_SHIPMODE'].toString(),
      comment = json['L_COMMENT'].toString(),
    super(json['L_PARTKEY'].toString() + "_" +  json['L_SUPPKEY'].toString());


}