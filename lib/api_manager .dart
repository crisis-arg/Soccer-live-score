import 'package:http/http.dart';

class SoccerApi {
  final String apiURl = "https://v3.football.api-sports.io/fixtures?live=all";
  static const api_Key = "b2edfc43a298eab2109b0888de0fb185";
  static const header = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': api_Key,
  };

  
}
