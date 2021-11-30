import 'package:nosql_gui/models/tpch/base_collection.dart';

import 'partsupp.dart';

class Lineitem extends BaseCollection{

  String quantity;
  String extendedprice;
  String discount;
  String tax;
  String returnflag;
  String linestatus;
  String shipdate;
  String commitdate;
  String receiptdate;
  String shipinstruct;
  String shipmode;
  String comment;
  Partsupp partsupp;

  Lineitem(String id, this.quantity, this.extendedprice, this.discount, this.tax,
      this.returnflag, this.linestatus, this.shipdate, this.commitdate,
      this.receiptdate, this.shipinstruct, this.shipmode, this.comment,
      this.partsupp) : super(id);


}