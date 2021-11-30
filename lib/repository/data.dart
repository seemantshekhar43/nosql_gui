import 'package:nosql_gui/models/history.dart';

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
}