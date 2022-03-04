import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nosql_gui/models/tpch/customer.dart';
import 'package:nosql_gui/models/tpch/lineitem.dart';
import 'package:nosql_gui/models/tpch/nation.dart';
import 'package:nosql_gui/models/tpch/order.dart';
import 'package:nosql_gui/models/tpch/part.dart';
import 'package:nosql_gui/models/tpch/partsupp.dart';
import 'package:nosql_gui/models/tpch/region.dart';

import '../models/tpch/supplier.dart';
import '../repository/data.dart';

class DataProvider extends ChangeNotifier{
  final List<Region> _regionList = [];
  final List<Nation> _nationList = [];
  final List<Customer> _customerList = [];
  final List<Order> _orderList = [];
  final List<Part> _partList = [];
  final List<Lineitem> _lineItemList = [];
  final List<Supplier> _supplierList = [];
  final List<Partsupp> _partsuppList = [];
  bool tempFlag = false;
  String collectionName = "REGION";


  UnmodifiableListView<Region> get regionList => UnmodifiableListView(_regionList);
  UnmodifiableListView<Nation> get nationList => UnmodifiableListView(_nationList);
  UnmodifiableListView<Customer> get customerList => UnmodifiableListView(_customerList);
  UnmodifiableListView<Order> get orderList => UnmodifiableListView(_orderList);
  UnmodifiableListView<Part> get partList => UnmodifiableListView(_partList);
  UnmodifiableListView<Lineitem> get lineItemList => UnmodifiableListView(_lineItemList);
  UnmodifiableListView<Partsupp> get partsuppList => UnmodifiableListView(_partsuppList);
  UnmodifiableListView<Supplier> get supplierList => UnmodifiableListView(_supplierList);


  Future<String> loadData() async {

    String partsJson = await rootBundle.loadString('tpch_10mb/PART.json');
    List partsData = jsonDecode(partsJson).toList();
    for (var element in partsData) {
      Part part = Part.fromJson(element);
      _partList.add(part);
    }

    String orderJson = await rootBundle.loadString('tpch_10mb/ORDERS.json');
    List orderData = jsonDecode(orderJson).toList();
    for (var element in orderData) {
      Order order = Order.fromJson(element);
      _orderList.add(order);
    }

    String supplierJson = await rootBundle.loadString('tpch_10mb/SUPPLIER.json');
    List supplierData = jsonDecode(supplierJson).toList();
    for (var element in supplierData) {
      Supplier supplier = Supplier.fromJson(element);
      _supplierList.add(supplier);
    }

    String partsuppJson = await rootBundle.loadString('tpch_10mb/PARTSUPP.json');
    List partsuppData = jsonDecode(partsuppJson).toList();
    for (var element in partsuppData) {
      Partsupp partsupp = Partsupp.fromJson(element);
      _partsuppList.add(partsupp);
    }

    String lineitemJson = await rootBundle.loadString('tpch_10mb/LINEITEM.json');
    List lineitemData = jsonDecode(lineitemJson).toList();
    for (var element in lineitemData) {
      Lineitem lineitem = Lineitem.fromJson(element);
      _lineItemList.add(lineitem);
    }

    String customerJson =
    await rootBundle.loadString('tpch_10mb/CUSTOMER.json');
    List customerData = jsonDecode(customerJson).toList();
    for (var element in customerData) {
      Customer customer = Customer.fromJson(element);
      _customerList.add(customer);
    }

    String nationJson = await rootBundle.loadString('tpch_10mb/NATION.json');
    List nationData = jsonDecode(nationJson).toList();
    for (var element in nationData) {
      Nation nation = Nation.fromJson(element);
      _nationList.add(nation);
    }

    String regionJson = await rootBundle.loadString('tpch_10mb/REGION.json');
    List regionData = jsonDecode(regionJson).toList();
    for (var element in regionData) {
      Region region = Region.fromJson(element);
      _regionList.add(region);

    }



    Data().regionList.clear();
    Data().regionList.addAll(_regionList);
    Data().nationList.clear();
    Data().nationList.addAll(_nationList);
    Data().customerList.clear();
    Data().customerList.addAll(_customerList);
    Data().orderList.clear();
    Data().orderList.addAll(_orderList);
    Data().partList.clear();
    Data().partList.addAll(_partList);
    Data().supplierList.clear();
    Data().supplierList.addAll(_supplierList);
    Data().partsuppList.clear();
    Data().partsuppList.addAll(_partsuppList);
    Data().lineItemList.clear();
    Data().lineItemList.addAll(_lineItemList);

    notifyListeners();
    return "true";
  }

  void setContext(context){
    Data().context = context;
  }

  void updateTempFlag(collectionName){
    this.collectionName = collectionName;
    this.tempFlag = true;
    notifyListeners();
  }

  void resetTempFlag(){
    collectionName = "REGION";
    tempFlag = false;
  }
}