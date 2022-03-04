import 'package:flutter/cupertino.dart';
import 'package:nosql_gui/constants.dart';
import 'package:nosql_gui/models/history.dart';
import 'package:nosql_gui/models/tpch/customer.dart';
import 'package:nosql_gui/models/tpch/nation.dart';
import 'package:nosql_gui/models/tpch/order.dart';
import 'package:nosql_gui/models/tpch/region.dart';

import '../models/tpch/lineitem.dart';
import '../models/tpch/part.dart';
import '../models/tpch/partsupp.dart';
import '../models/tpch/supplier.dart';



class Data{
  Data._privateConstructor();
  static final Data _instance = Data._privateConstructor();

  factory Data() {
    return _instance;
  }

  late BuildContext context;

  final List<Region> regionList = [];
  final List<Nation> nationList = [];
  final List<Customer> customerList = [];
  final List<Order> orderList = [];
  final List<Part> partList = [];
  final List<Lineitem> lineItemList = [];
  final List<Supplier> supplierList = [];
  final List<Partsupp> partsuppList = [];

  final List<Region> tempRegionList = [];
  final List<Nation> tempNationList = [];
  final List<Customer> tempCustomerList = [];
  final List<Order> tempOrderList = [];
  final List<Part> tempPartList = [];
  final List<Lineitem> tempLineItemList = [];
  final List<Supplier> tempSupplierList = [];
  final List<Partsupp> tempPartsuppList = [];




}