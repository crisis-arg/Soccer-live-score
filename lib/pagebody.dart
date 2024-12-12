import 'package:flutter/material.dart';
import 'package:soccer_live_score/goalstat.dart';
import 'package:soccer_live_score/matchtitle.dart';
import 'package:soccer_live_score/teamstat.dart';
import 'soccer_model.dart';

Widget pageBody(List<SoccerMatch> allMatches) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                teamStat(
                  "Local team",
                  allMatches[0].home.logoUrl,
                  allMatches[0].home.name,
                ),
                goalStat(
                  allMatches[0].fixture.status.elapsed,
                  allMatches[0].goal.home,
                  allMatches[0].goal.away,
                ),
                teamStat(
                  "Visitor team",
                  allMatches[0].away.logoUrl,
                  allMatches[0].away.name,
                ),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF4373D9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Matches',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: allMatches.length,
                  itemBuilder: (context, index) {
                    return matchTitle(allMatches[index]);
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
