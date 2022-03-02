import 'package:flutter/material.dart';
import 'package:nosql_gui/models/tpch/base_collection.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;


Map<String, String> collectionsMap = {
  "Order" : "ORDER",
  "LineItem" : "LINEITEM",
  "Part" : "PART",
  "PartSupp" : "PARTSUPP",
  "Supplier" : "SUPPLIER",
  "Customer" : "CUSTOMER",
  "Nation" : "NATION",
  "Region" : "REGION",
};

List<String> regionColumnList = ["ID", "NAME", "COMMENT"];
List<String> nationColumnList = ["ID", "NAME", "COMMENT", "REGION"];
//4
List<String> partColumnList = ["ID", "NAME", "MANUFACTURER", "BRAND", "TYPE", "SIZE", "CONTAINER", "RETAIL PRICE", "COMMENT"];
List<String> customerColumnList = [
  "ID",
  "NAME",
  "ADDRESS",
  "PHONE",
  "ACCTBAL",
  "MKTSEGMENT",
  "COMMENT",
  "NATION"
];
enum QueryType{
  SELECT, SORT_ASCENDING, SORT_DESCENDING, SEARCH
}