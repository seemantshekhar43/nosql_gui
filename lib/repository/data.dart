import 'package:nosql_gui/constants.dart';
import 'package:nosql_gui/models/history.dart';
import 'package:nosql_gui/models/tpch/nation.dart';
import 'package:nosql_gui/models/tpch/order.dart';
import 'package:nosql_gui/models/tpch/region.dart';

import '../models/tpch/part.dart';

class Data{
  Data._();

  static List<History> historyList = [
    History("09 : 43 PM", "REGION", "NAME", 1,  "", "assets/icons/folder.svg",QueryType.SELECT),

  ];

  static List<Region> regionList = [
    Region("0", "AFRICA", "lar deposits. blithely final packages cajole"),
    Region("1", "AMERICA", "hs use ironic, even requests."),
    Region("2", "ASIA", "ges. thinly even pinto beans ca"),
    Region("3", "EUROPE", "ly final courts cajole furiously final excuse"),
    Region("4", "MIDDLE EAST", "luickly special accounts cajole carefully blithely"),

  ];

  static List<Nation> nationList = [];

  static List<Part> partList = [];
  static List<Order> orderList = [];


}