

import 'package:nosql_gui/constants.dart';

class History{
  String time;
  String collection;
  String column;
  int columnIndex;
  String query;
  String imgSrc;

  QueryType queryType;

  History(this.time, this.collection, this.column, this.columnIndex, this.query,
      this.imgSrc,  this.queryType);

  String getQueryString(){
    String queryString = "";
    switch(queryType){
      case  QueryType.SEARCH: {
        queryString += "Search \"$query\" IN $column";
        break;
      }
      case QueryType.SORT_ASCENDING: {
        queryString += "SORT $column IN ASCENDING ORDER";
        break;
      }
      case QueryType.SORT_DESCENDING: {
        queryString += "SORT $column IN DESCENDING ORDER";
        break;
      }
      default:

    }

    return queryString;
  }
}