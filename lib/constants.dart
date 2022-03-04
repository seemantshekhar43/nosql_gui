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
List<String> supplierColumnList = ['S_SUPPKEY', 'S_NAME', 'S_ADDRESS', 'S_PHONE', 'S_ACCTBAL', 'S_NATIONKEY', 'S_COMMENT'];
List<String> partsuppColumnList = ["ID", 'PS_PARTKEY', 'PS_AVAILQTY', 'PS_SUPPLYCOST', 'PS_COMMENT'];
List<String> lineItemColumnList = ['ID', 'L_ORDERKEY','L_PARTKEY','L_SUPPKEY','L_LINENUMBER','L_QUANTITY','L_EXTENDEDPRICE','L_DISCOUNT','L_TAX','L_RETURNFLAG','L_LINESTATUS','L_SHIPDATE','L_COMMITDATE','L_RECEIPTDATE','L_SHIPINSTRUCT','L_SHIPMODE','L_COMMENT'];
List<String> orderColumnList = ['ID','O_CUSTKEY','O_ORDERSTATUS','O_TOTALPRICE','O_ORDERDATE','O_ORDERPRIORITY','O_CLERK','O_SHIPPRIORITY','O_COMMENT', 'O_LINEITEMS'];
enum QueryType{
  SELECT, SORT_ASCENDING, SORT_DESCENDING, SEARCH
}