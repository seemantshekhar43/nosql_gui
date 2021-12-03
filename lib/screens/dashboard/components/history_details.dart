import 'package:flutter/material.dart';
import 'package:nosql_gui/provider/history_provider.dart';
import 'package:nosql_gui/repository/data.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'history_info_card.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({
    Key? key,
    required this.callback,
  }) : super(key: key);
    final Function callback;

  @override
  Widget build(BuildContext context) {
    HistoryProvider historyProvider = Provider.of<HistoryProvider>(context, listen:true);

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Queries",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          //Chart(),
          ListView.builder(itemCount: historyProvider.list.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
            return GestureDetector(
              onTap: () => callback(historyProvider.list[index]),
              child: HistoryInfoCard(
                imgSrc: historyProvider.list[index].imgSrc,
                collectionName: historyProvider.list[index].collection,
                time: historyProvider.list[index].time,
                query: historyProvider.list[index].getQueryString(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
