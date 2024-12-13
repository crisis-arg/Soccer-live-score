import 'dart:convert';
import 'package:http/http.dart';
import 'package:soccer_live_score/soccer_model.dart';

class SoccerApi {
  final apiUrl = Uri.parse(
      "https://v3.football.api-sports.io/fixtures?live=all");
  static const header = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "",
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(apiUrl, headers: header);
    

    if (res.statusCode == 200) {
      //connected to the server
      final Map<String, dynamic> body = jsonDecode(res.body);
      List<dynamic> matchesList = body["response"];
      print("Api service: ${body}");
       //to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();
          print("Sample item from matchesList: ${matchesList[0]}");
      return matches;
    } else {
      throw Exception("Failed to load matches: ${res.statusCode}");
    }
  }
}
