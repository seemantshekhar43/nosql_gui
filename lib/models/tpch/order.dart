import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';

import '../../tables.dart';
import 'customer.dart';
import 'lineitem.dart';

class Order extends BaseCollection {
  String orderstatus;
  String totalprice;
  String orderdate;
  String orderpriority;
  String clerk;
  String shippriority;
  String comment;
  String customer;
  // List<Lineitem> lineItems;

  Order(
    id,
    this.orderstatus,
    this.totalprice,
    this.orderdate,
    this.orderpriority,
    this.clerk,
    this.shippriority,
    this.comment,
    this.customer,
    // this.lineItems
  ) : super(id);

  //3
  DataRow getRow(
    SelectedCallBack callback,
    List<String> selectedIds,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(orderstatus)),
        DataCell(Text(totalprice)),
        DataCell(Text(orderdate)),
        DataCell(Text(orderpriority)),
        DataCell(Text(clerk)),
        DataCell(Text(shippriority)),
        DataCell(Text(comment)),
        DataCell(Text(customer))
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }

  //1
  Order.fromJson(Map<String, dynamic> json)
      : orderstatus = json['O_ORDERSTATUS'].toString(),
        totalprice = json['O_TOTALPRICE'].toString(),
        orderdate = json['O_ORDERDATE'].toString(),
        orderpriority = json['O_ORDERPRIORITY'].toString(),
        clerk = json['O_CLERK'].toString(),
        shippriority = json['O_SHIPPRIORITY'].toString(),
        comment = json['O_COMMENT'].toString(),
        customer = json['O_CUSTKEY'].toString(),
        super(json['O_ORDERKEY'].toString());
}
