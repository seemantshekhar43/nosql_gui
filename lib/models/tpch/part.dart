import 'package:nosql_gui/models/tpch/base_collection.dart';

class Part extends BaseCollection{
  String name;
  String mfgr;
  String brand;
  String type;
  String size;
  String container;
  String retailprice;
  String comment;

  Part(String id, this.name, this.mfgr, this.brand, this.type, this.size,
      this.container, this.retailprice, this.comment): super(id);
}