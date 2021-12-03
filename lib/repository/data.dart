import 'package:nosql_gui/constants.dart';
import 'package:nosql_gui/models/history.dart';
import 'package:nosql_gui/models/tpch/nation.dart';
import 'package:nosql_gui/models/tpch/region.dart';

class Data{
  Data._();

  static List<History> historyList = [
    History("09 : 43 PM", "REGION", "NAME", 1,  "", "assets/icons/folder.svg",QueryType.SELECT),

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