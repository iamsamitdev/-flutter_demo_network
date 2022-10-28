// ignore_for_file: prefer_const_declarations

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:network/model/movie.dart';

class ApiProvider {
  Client client = Client();

  static final _apiKey = 'a6ef39240a083e148595040839eb9408';
  static final String _baseUrl = 'http://api.themoviedb.org/3/movie';

  Future<Movie> getMovieList() async {
    final url = Uri.parse("$_baseUrl/popular?api_key=$_apiKey");
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }
}