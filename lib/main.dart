import 'package:flutter/material.dart';
import 'package:soccer_live_score/api_manager.dart';
import 'package:soccer_live_score/pagebody.dart';
import 'package:soccer_live_score/soccer_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  const SoccerApp({super.key});

  @override
  State<SoccerApp> createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
        title: Text(
          "SOCCERBOARD",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      //
      body: FutureBuilder(
        future:  SoccerApi().getAllMatches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            final matches = snapshot.data as List<SoccerMatch>;
            if (matches.isEmpty) {
              return Center(
                child: Text('No matches found.'),
              );
            }
            return PageBody(matches);
          } else {
            return Center(
              child: Text('no matches found'),
            );
          }
        },
      ),
    );
  }
}
