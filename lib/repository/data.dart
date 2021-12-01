import 'package:nosql_gui/models/history.dart';
import 'package:nosql_gui/models/tpch/nation.dart';
import 'package:nosql_gui/models/tpch/region.dart';

class Data{
  Data._();

  static List<History> historyList = [
    History("09 : 43 PM", "SELECT * FROM ORDER WHERE ...", "assets/icons/folder.svg", "Order"),
    History("12 : 04 PM", "SELECT * FROM CUSTOMER WHERE ...", "assets/icons/folder.svg", "Customer"),
    History("07 : 12 AM", "SELECT * FROM REGION WHERE ...", "assets/icons/folder.svg", "Region"),
    History("05 : 26 PM", "SELECT * FROM ORDER WHERE ...", "assets/icons/folder.svg", "Order"),
    History("11 : 45 AM", "SELECT * FROM LINEITEM WHERE ...", "assets/icons/folder.svg", "LineItem"),
    History("04 : 39 PM", "SELECT * FROM NATION WHERE ...", "assets/icons/folder.svg", "Nation"),
  ];

  static List<Region> regionList = [
    Region("REGION1", "AFRICA", "lar deposits. blithely final packages cajole"),
    Region("REGION2", "AMERICA", "hs use ironic, even requests."),
    Region("REGION3", "ASIA", "ges. thinly even pinto beans ca"),
    Region("REGION4", "EUROPE", "ly final courts cajole furiously final excuse"),
    Region("REGION5", "MIDDLE EAST", "luickly special accounts cajole carefully blithely"),

  ];

  static List<Nation> nationList = [
    Nation("NATION1", "ALGERIA", "haggle. carefully final deposits detect slyly agai ", regionList[0]),
    Nation("NATION2", "ARGENTINA", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION3", "BRAZIL", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION4", "CANADA", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION5", "EGYPT", "haggle. carefully final deposits detect slyly agai ", regionList[4]),
    Nation("NATION6", "ETHIOPIA", "haggle. carefully final deposits detect slyly agai ", regionList[0]),
    Nation("NATION7", "FRANCE", "haggle. carefully final deposits detect slyly agai ", regionList[3]),
  ];


}