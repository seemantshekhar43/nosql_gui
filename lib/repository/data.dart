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
    Nation("NATION8", "ALGERIA", "haggle. carefully final deposits detect slyly agai ", regionList[0]),
    Nation("NATION9", "ARGENTINA", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION10", "BRAZIL", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION11", "CANADA", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION12", "EGYPT", "haggle. carefully final deposits detect slyly agai ", regionList[4]),
    Nation("NATION13", "ETHIOPIA", "haggle. carefully final deposits detect slyly agai ", regionList[0]),
    Nation("NATION14", "FRANCE", "haggle. carefully final deposits detect slyly agai ", regionList[3]),
    Nation("NATION21", "ALGERIA", "haggle. carefully final deposits detect slyly agai ", regionList[0]),
    Nation("NATION22", "ARGENTINA", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION23", "BRAZIL", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION24", "CANADA", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION25", "EGYPT", "haggle. carefully final deposits detect slyly agai ", regionList[4]),
    Nation("NATION26", "ETHIOPIA", "haggle. carefully final deposits detect slyly agai ", regionList[0]),
    Nation("NATION27", "FRANCE", "haggle. carefully final deposits detect slyly agai ", regionList[3]),
    Nation("NATION28", "ALGERIA", "haggle. carefully final deposits detect slyly agai ", regionList[0]),
    Nation("NATION29", "ARGENTINA", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION31", "ALGERIA", "haggle. carefully final deposits detect slyly agai ", regionList[0]),
    Nation("NATION32", "ARGENTINA", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION33", "BRAZIL", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION34", "CANADA", "haggle. carefully final deposits detect slyly agai ", regionList[1]),
    Nation("NATION35", "EGYPT", "haggle. carefully final deposits detect slyly agai ", regionList[4]),
    Nation("NATION36", "ETHIOPIA", "haggle. carefully final deposits detect slyly agai ", regionList[0]),
    Nation("NATION37", "FRANCE", "haggle. carefully final deposits detect slyly agai ", regionList[3]),
    Nation("NATION38", "ALGERIA", "haggle. carefully final deposits detect slyly agai ", regionList[0]),
    Nation("NATION39", "ARGENTINA", "haggle. carefully final deposits detect slyly agai ", regionList[1]),

  ];


}