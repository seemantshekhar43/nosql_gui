import 'package:flutter/material.dart';
import 'package:nosql_gui/repository/data.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'history_info_card.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ListView.builder(itemCount: Data.historyList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
            return HistoryInfoCard(
              imgSrc: Data.historyList[index].imgSrc,
              collectionName: Data.historyList[index].collectionName,
              time: Data.historyList[index].time,
              query: Data.historyList[index].query,
            );
          }),
        ],
      ),
    );
  }
}
