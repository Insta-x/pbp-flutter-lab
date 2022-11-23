import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/watchlist.dart';

Future<List<Watch>> fetchWatchList() async {
  final response = await http.get(
    Uri.parse('https://pbp-tugas-2-insta-x.herokuapp.com/mywatchlist/json/'),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
      'Accept': '*/*'
    },
  );

  var responseData = jsonDecode(response.body);

  List<Watch> watchList = [];

  for (var movie in responseData) {
    if (movie != null) {
      watchList.add(Watch.fromJson(movie['fields']));
    }
  }

  return watchList;
}
