import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nosql_gui/constants.dart';
import 'package:nosql_gui/models/history.dart';
import 'package:nosql_gui/models/tpch/nation.dart';
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

class NationCollectionTable extends StatefulWidget {
  const NationCollectionTable(
      {Key? key, this.title, this.collectionName, this.columns, this.historyItem})
      : super(key: key);
  final String? title;
  final History? historyItem;
  final String? collectionName;
  final List<String>? columns;
  @override
  _NationCollectionTableState createState() => _NationCollectionTableState();
}

class _NationCollectionTableState extends State<NationCollectionTable> {
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
                  onSubmitted: (vlaue) {
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
                    Text('Name'),
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
                  Text('Comment'),
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
                  Text('Region'),
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

class ExampleSource extends AdvancedDataTableSource<Nation> {
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
  Future<RemoteDataSourceDetails<Nation>> getNextPage(
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

    List<Nation>? data = Data.nationList;
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
              print("called ${element.name} ");
              return regExp.hasMatch(element.name.toLowerCase());
            }
          case 2:
            {
              return regExp.hasMatch(element.comment.toLowerCase());
            }
          case 3:
            {
              return regExp.hasMatch(element.region.name.toLowerCase());
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
          data.sort((a, b) => a.name.compareTo(b.name));
          break;
        }
      case 2:
        {
          data.sort((a, b) => a.comment.compareTo(b.comment));
          break;
        }
      case 3:
        {
          data.sort((a, b) => a.region.name.compareTo(b.region.name));
          break;
        }
    }
    if (!pageRequest.sortAscending!) {
      data = data.reversed.toList();
    }

    return RemoteDataSourceDetails(
      data.length,
      data,
      filteredRows: lastSearchTerm.isNotEmpty ? data.length : null,
    );
  }
}
