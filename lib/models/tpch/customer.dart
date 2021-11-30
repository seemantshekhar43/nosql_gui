import 'package:nosql_gui/models/tpch/base_collection.dart';

import 'nation.dart';

class Customer extends BaseCollection{

  String name;
  String address;
  String phone;
  String acctbal;
  String mktsegment;
  String comment;
  Nation nation;

  Customer(String id, this.name, this.address, this.phone, this.acctbal,
      this.mktsegment, this.comment, this.nation):super(id);
}