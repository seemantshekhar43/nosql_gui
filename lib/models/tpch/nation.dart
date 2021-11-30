import 'package:nosql_gui/models/tpch/base_collection.dart';

import 'region.dart';

class Nation extends BaseCollection{
  String name;
  String comment;
  Region region;

  Nation(String id, this.name, this.comment, this.region): super(id);
}