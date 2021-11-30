import 'package:nosql_gui/models/tpch/base_collection.dart';

import 'nation.dart';

class Supplier extends BaseCollection{

  String name;
  String address;
  String phone;
  String acctbal;
  String comment;
  Nation nation;

  Supplier(String id, this.name, this.address, this.phone, this.acctbal,
      this.comment, this.nation) : super(id);
}