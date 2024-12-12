import 'dart:convert';
import 'package:http/http.dart';
import 'package:soccer_live_score/soccer_model.dart';

class SoccerApi {
  final apiUrl =
      Uri.parse("https://v3.football.api-sports.io/fixtures?live=all");
  static const header = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "79944227b1a9249ce33e81f3ecd43c49",
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(apiUrl, headers: header);
    var body;

    if (res.statusCode == 200) {
      //connected to the server
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body["response"];
      print("Api service: ${body}"); //to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromjson(item))
          .toList();

      return matches;
    } else {
      throw Exception();
    }
  }
}
