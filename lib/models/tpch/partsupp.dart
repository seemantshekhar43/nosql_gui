import 'package:nosql_gui/models/tpch/base_collection.dart';

import 'part.dart';

class Partsupp extends BaseCollection{
  String availqty;
  String supplycost;
  String comment;
  Part part;

  Partsupp(String id, this.availqty, this.supplycost, this.comment, this.part) : super(id);
}