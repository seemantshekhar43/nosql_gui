import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;


Map<String, String> collectionsMap = {
  "Order" : "order",
  "LineItem" : "lineitem",
  "Part" : "part",
  "PartSupp" : "partsupp",
  "Supplier" : "supplier",
  "Customer" : "customer",
  "Nation" : "nation",
  "Region" : "region",
};