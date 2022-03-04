import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';
import 'package:nosql_gui/models/tpch/customer.dart';
import 'package:nosql_gui/models/tpch/lineitem.dart';
import 'package:nosql_gui/repository/data.dart';
import 'package:provider/provider.dart';

import '../../provider/data_provider.dart';
import '../../screens/dashboard/components/order_collection_table.dart';



class Order extends BaseCollection {
  String customer;
  String orderstatus;
  String totalprice;
  String orderdate;
  String orderpriority;
  String clerk;
  String shippriority;
  String comment;
  String lineitems;

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
    this.lineitems
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
        DataCell(Text(Data().customerList.firstWhere((element) => element.id == customer).name),
            onTap: (){
              Customer cus = Data().customerList.firstWhere((element) => element.id == customer);
              Data().tempCustomerList.clear();
              Data().tempCustomerList.add(cus);

              Provider.of<DataProvider>(Data().context, listen: false).updateTempFlag("CUSTOMER");

            }),
        DataCell(Text(totalLineItems(id).toString()),
            onTap: (){
              List<Lineitem> list = Data().lineItemList.where((element) => element.order == id).toList();

              Data().tempLineItemList.clear();
              Data().tempLineItemList.addAll(list);

              Provider.of<DataProvider>(Data().context, listen: false).updateTempFlag("LINEITEM");

            }),
      ],
      onSelectChanged: (newState) {
        callback(id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(id.toString()),
    );
  }


  int totalLineItems (orderKey){
    int count = 0;
    for(var item in Data().lineItemList){
      if(item.order == orderKey){
        count++;
      }
    }
    return count;
  }

  Order.fromJson(Map<String, dynamic> json)
      : orderstatus = json['O_ORDERSTATUS'].toString(),
        totalprice = json['O_TOTALPRICE'].toString(),
        orderdate = json['O_ORDERDATE'].toString(),
        orderpriority = json['O_ORDERPRIORITY'].toString(),
        clerk = json['O_CLERK'].toString(),
        shippriority = json['O_SHIPPRIORITY'].toString(),
        comment = json['O_COMMENT'].toString(),
        customer = json['O_CUSTKEY'].toString(),
        lineitems = "0",
        super(json['O_ORDERKEY'].toString());
}
