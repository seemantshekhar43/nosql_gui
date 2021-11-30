import 'package:nosql_gui/models/tpch/base_collection.dart';

class Region extends BaseCollection{
  String name;
  String comment;

  Region(String id, this.name, this.comment) : super(id);


}