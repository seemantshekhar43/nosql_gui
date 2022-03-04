import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nosql_gui/constants.dart';
import 'package:nosql_gui/models/history.dart';
import 'package:nosql_gui/models/tpch/lineitem.dart';
import 'package:nosql_gui/provider/history_provider.dart';
import 'package:nosql_gui/repository/data.dart';
import 'package:provider/provider.dart';

//TODO Support server side filter in example
//First update server side to include a filter
//Add search bar
//Update remote data source to use filter

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class LineitemCollectionTable extends StatefulWidget {
  const LineitemCollectionTable(
      {Key? key, this.title, this.collectionName, this.columns, this.historyItem})
      : super(key: key);
  final String? title;
  final History? historyItem;
  final String? collectionName;
  final List<String>? columns;
  @override
  _LineitemCollectionTableState createState() => _LineitemCollectionTableState();
}

class _LineitemCollectionTableState extends State<LineitemCollectionTable> {
  var _rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  final _source = ExampleSource();
  var _sortIndex = 0;
  var _sortAsc = true;
  final _searchController = TextEditingController();
  var _customFooter = true;
  bool calledHistory = false;
  late HistoryProvider historyProvider;
  @override
  void initState() {
    super.initState();
    _searchController.text = '';

  }


  @override
  void didUpdateWidget( oldWidget) {
    onlyOnceCall();
    print('did update called');
  }

  void onlyOnceCall(){

    if(widget.historyItem != null){

      _sortIndex = widget.historyItem!.columnIndex;
      if(widget.historyItem!.queryType == QueryType.SEARCH){
        _searchController.text = widget.historyItem!.query;
        _source.filterServerSide(_searchController.text);
      }else if(widget.historyItem!.queryType == QueryType.SORT_ASCENDING){
        setState(() {
          print('called ascending');
          _sortAsc = true;
        });
      }else if(widget.historyItem!.queryType == QueryType.SORT_DESCENDING){
        setState(() {
          print('called descending');
          _sortAsc = false;
        });
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    historyProvider = Provider.of<HistoryProvider>(context, listen: false);
    print('collection table built');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search by name',
                  ),
                  onSubmitted: (value) {
                    _source.filterServerSide(_searchController.text);
                    setState(() {
                      _sortIndex = 1;
                    });
                  },
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _searchController.text = '';
                });
                _source.filterServerSide(_searchController.text);
              },
              icon: const Icon(Icons.clear),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _sortIndex = 1;
                  _source.filterServerSide(_searchController.text);
                });
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        AdvancedPaginatedDataTable(
          addEmptyRows: false,
          source: _source,
          sortAscending: _sortAsc,
          sortColumnIndex: _sortIndex,
          showFirstLastButtons: true,
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: const [10, 20, 30, 50],
          onRowsPerPageChanged: (newRowsPerPage) {
            if (newRowsPerPage != null) {
              setState(() {
                _rowsPerPage = newRowsPerPage;
              });
            }
          },
          columns: [
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 0;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ORDER'),
                    SizedBox(
                      child: TextField(
                        textAlign: TextAlign.start,
                        onSubmitted: (val) {
                          setState(() {
                            _sortIndex = 1;
                            _source.filterServerSide(val);
                            createHistory(_sortIndex, val);
                          });

                        },
                      ),
                      height: 25,
                      width: 100,
                    ),
                  ],
                ),
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PART'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 2;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PARTSUPP'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LINE NUMBER'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('QUANTITY'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('EXTENDED PRICE'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('DISCOUNT'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TAX'),
                    SizedBox(
                      child: TextField(
                        textAlign: TextAlign.start,
                        onSubmitted: (val) {
                          setState(() {
                            _sortIndex = 1;
                            _source.filterServerSide(val);
                            createHistory(_sortIndex, val);
                          });

                        },
                      ),
                      height: 25,
                      width: 100,
                    ),
                  ],
                ),
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('RETURN FLAG'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 2;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LINE STATUS'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SHIP DATE'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('COMMIT DATE'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('RECEIPT DATE'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SHIP INSTRUCT'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SHIP MODE'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
            DataColumn(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('COMMENT'),
                  SizedBox(
                    child: TextField(
                      textAlign: TextAlign.start,
                      onSubmitted: (val) {
                        setState(() {
                          _sortIndex = 3;
                          _source.filterServerSide(val);
                          createHistory(_sortIndex, val);
                        });
                      },
                    ),
                    height: 25,
                    width: 100,
                  ),
                ],
              ),
              onSort: setSort,
            ),
          ],
          //Optianl override to support custom data row text / translation
          getFooterRowText:
              (startRow, pageSize, totalFilter, totalRowsWithoutFilter) {
            final localizations = MaterialLocalizations.of(context);
            var amountText = localizations.pageRowsInfoTitle(
              startRow,
              pageSize,
              totalFilter ?? totalRowsWithoutFilter,
              false,
            );

            if (totalFilter != null) {
              //Filtered data source show addtional information
              amountText += ' filtered from ($totalRowsWithoutFilter)';
            }

            return amountText;
          },
          customTableFooter: _customFooter
              ? (source, offset) {
            final maxPagesToShow = 6;
            final maxPagesBeforeCurrent = 3;
            final lastRequestDetails = source.lastDetails!;
            final rowsForPager = lastRequestDetails.filteredRows ??
                lastRequestDetails.totalRows;
            final totalPages = rowsForPager ~/ _rowsPerPage;
            final currentPage = (offset ~/ _rowsPerPage) + 1;
            List<int> pageList = [];
            if (currentPage > 1) {
              pageList.addAll(
                List.generate(currentPage - 1, (index) => index + 1),
              );
              //Keep up to 3 pages before current in the list
              pageList.removeWhere(
                    (element) =>
                element < currentPage - maxPagesBeforeCurrent,
              );
            }
            pageList.add(currentPage);
            //Add reminding pages after current to the list
            pageList.addAll(
              List.generate(
                maxPagesToShow - (pageList.length - 1),
                    (index) => (currentPage + 1) + index,
              ),
            );
            pageList.removeWhere((element) => element > totalPages);

            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: pageList
                  .map(
                    (e) => TextButton(
                  onPressed: e != currentPage
                      ? () {
                    //Start index is zero based
                    source.setNextView(
                      startIndex: (e - 1) * _rowsPerPage,
                    );
                  }
                      : null,
                  child: Text(
                    e.toString(),
                  ),
                ),
              )
                  .toList(),
            );
          }
              : null,
        ),
      ],
    );
  }

  // ignore: avoid_positional_boolean_parameters
  void setSort(int i, bool asc) => setState(() {
    _sortIndex = i;
    _sortAsc = asc;
    History history = History(
        DateFormat().add_jm().format(DateTime.now()),
        widget.collectionName!,
        widget.columns![_sortIndex],
        _sortIndex,
        "",
        "assets/icons/folder.svg",
        asc ? QueryType.SORT_ASCENDING: QueryType.SORT_DESCENDING);
    historyProvider.addHistory(history);
  });

  void createHistory(int index, String query){
    print('called create history');
    History history = History(
        DateFormat().add_jm().format(DateTime.now()),
        widget.collectionName!,
        widget.columns![_sortIndex],
        _sortIndex,
        query,
        "assets/icons/folder.svg",
        QueryType.SEARCH);

    historyProvider.addHistory(history);

  }
}



typedef SelectedCallBack = Function(String id, bool newSelectState);

class ExampleSource extends AdvancedDataTableSource<Lineitem> {
  List<String> selectedIds = [];
  String lastSearchTerm = '';

  @override
  DataRow? getRow(int index) =>
      lastDetails!.rows[index].getRow(selectedRow, selectedIds);

  @override
  int get selectedRowCount => selectedIds.length;

  // ignore: avoid_positional_boolean_parameters
  void selectedRow(String id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide(String filterQuery) {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    print(lastSearchTerm);
    setNextView();
  }

  @override
  Future<RemoteDataSourceDetails<Lineitem>> getNextPage(
      NextPageRequest pageRequest,
      ) async {
    //the remote data source has to support the pagaing and sorting
    final queryParameter = <String, dynamic>{
      'offset': pageRequest.offset.toString(),
      'pageSize': pageRequest.pageSize.toString(),
      'sortIndex': ((pageRequest.columnSortIndex ?? 0) + 1).toString(),
      'sortAsc': ((pageRequest.sortAscending ?? true) ? 1 : 0).toString(),
      if (lastSearchTerm.isNotEmpty) 'companyFilter': lastSearchTerm,
    };

    // final requestUri = Uri.https(
    //   'example.devowl.de',
    //   '',
    //   queryParameter,
    // );
    //
    // final response = await http.get(requestUri);
    // if (response.statusCode == 200) {
    //   final data = Data.regionList;
    //   return RemoteDataSourceDetails(
    //     data.length,
    //     data,
    //     filteredRows: lastSearchTerm.isNotEmpty
    //         ? data.length
    //         : null,
    //   );
    // } else {
    //   throw Exception('Unable to query remote server');
    // }

    List<Lineitem> data = [];
    data.addAll(Data().lineItemList);

    if(Data().tempLineItemList.isNotEmpty){
      data.clear();
      data.addAll(Data().tempLineItemList);
      print(data.length);
      Data().tempLineItemList.clear();
    }
    int index = pageRequest.columnSortIndex!;
    if (lastSearchTerm.isNotEmpty) {
      String pattern = '^';
      for (int i = 0; i < lastSearchTerm.length; i++) {
        var char = lastSearchTerm[i];
        switch (char) {
          case '%':
            pattern += ".*";
            break;
          case '_':
            pattern += ".";
            break;
          default:
            pattern += char;
            break;
        }
      }
      pattern += '\$';
      RegExp regExp = RegExp(pattern);
      print("regex : $index");
      data = data.where((element) {
        switch (index) {
          case 0:
            {
              return regExp.hasMatch(element.id.toLowerCase());
            }
          case 1:
            {
              print("called ${element.order} ");
              return regExp.hasMatch(element.order.toLowerCase());
            }
          case 2:
            {
              return regExp.hasMatch(element.part.toLowerCase());
            }
          case 3:
            {
              return regExp.hasMatch(element.partsupp.toLowerCase());
            }
          case 4:
            {
              return regExp.hasMatch(element.lineNumber.toLowerCase());
            }
          case 5:
            {
              return regExp.hasMatch(element.quantity.toLowerCase());
            }
          case 6:
            {
              return regExp.hasMatch(element.extendedPrice.toLowerCase());
            }
          case 7:
            {
              return regExp.hasMatch(element.discount.toLowerCase());
            }
          case 8:
            {
              print("called ${element.tax} ");
              return regExp.hasMatch(element.tax.toLowerCase());
            }
          case 9:
            {
              return regExp.hasMatch(element.returnFlag.toLowerCase());
            }
          case 10:
            {
              return regExp.hasMatch(element.lineStatus.toLowerCase());
            }
          case 11:
            {
              return regExp.hasMatch(element.shipDate.toLowerCase());
            }
          case 12:
            {
              return regExp.hasMatch(element.commitDate.toLowerCase());
            }
          case 13:
            {
              return regExp.hasMatch(element.receiptDate.toLowerCase());
            }
          case 14:
            {
              return regExp.hasMatch(element.shipInstruct.toLowerCase());
            }
          case 15:
            {
              return regExp.hasMatch(element.shipMode.toLowerCase());
            }
          case 16:
            {
              return regExp.hasMatch(element.comment.toLowerCase());
            }

          default:
            return regExp.hasMatch(element.id.toLowerCase());
        }
      }).toList();
    }

    switch (index) {
      case 0:
        {
          data.sort((a, b) => a.id.compareTo(b.id));
          break;
        }
      case 1:
        {
          data.sort((a, b) => a.order.compareTo(b.order));
          break;
        }
      case 2:
        {
          data.sort((a, b) => a.part.compareTo(b.part));
          break;
        }
      case 3:
        {
          data.sort((a, b) => a.partsupp.compareTo(b.partsupp));
          break;
        }
      case 4:
        {
          data.sort((a, b) => a.lineNumber.compareTo(b.lineNumber));
          break;
        }
      case 5:
        {
          data.sort((a, b) => a.quantity.compareTo(b.quantity));
          break;
        }
      case 6:
        {
          data.sort((a, b) => a.extendedPrice.compareTo(b.extendedPrice));
          break;
        }
      case 7:
        {
          data.sort((a, b) => a.discount.compareTo(b.discount));
          break;
        }
      case 8:
        {
          data.sort((a, b) => a.tax.compareTo(b.tax));
          break;
        }
      case 9:
        {
          data.sort((a, b) => a.returnFlag.compareTo(b.returnFlag));
          break;
        }
      case 10:
        {
          data.sort((a, b) => a.lineStatus.compareTo(b.lineStatus));
          break;
        }
      case 11:
        {
          data.sort((a, b) => a.shipDate.compareTo(b.shipDate));
          break;
        }
      case 12:
        {
          data.sort((a, b) => a.commitDate.compareTo(b.commitDate));
          break;
        }
      case 13:
        {
          data.sort((a, b) => a.receiptDate.compareTo(b.receiptDate));
          break;
        }
      case 14:
        {
          data.sort((a, b) => a.shipInstruct.compareTo(b.shipInstruct));
          break;
        }
      case 15:
        {
          data.sort((a, b) => a.shipMode.compareTo(b.shipMode));
          break;
        }
      case 16:
        {
          data.sort((a, b) => a.comment.compareTo(b.comment));
          break;
        }
    }
    if (!pageRequest.sortAscending!) {
      data = data.reversed.toList();
    }

    return RemoteDataSourceDetails(
      data.length,
      data.skip(pageRequest.offset)
          .take(pageRequest.pageSize)
          .toList(),
      filteredRows: lastSearchTerm.isNotEmpty ? data.length : null,
    );
  }
}
