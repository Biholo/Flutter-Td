import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class TMDBService {
  String apiKey;
  String baseUrl = 'https://api.themoviedb.org/3';

  TMDBService(this.apiKey);

  Future<Map<String, dynamic>> getMovieRecommendations(int movieId, {String language = 'en-US', int page = 1}) async {
    String url = '$baseUrl/movie/$movieId/recommendations?language=$language&page=$page';
    return await fetchData(url);
  }

  Future<Map<String, dynamic>> getRandomMovies({String language = 'en-US', int page = 1}) async {
    String url = '$baseUrl/movie/popular?language=$language&page=$page&sort_by=popularity.desc';
    return await fetchData(url);
  }

  Future<Map<String, dynamic>> getMoviesByGenre(int genreId, {String language = 'en-US', int page = 1}) async {
    String url = '$baseUrl/discover/movie?with_genres=$genreId&language=$language&page=$page';
    return await fetchData(url);
  }

  Future<Map<String, dynamic>> getMovieById(int movieId, {String language = 'en-US'}) async {
    String url = '$baseUrl/movie/$movieId?language=$language';
    return await fetchData(url);
  }

  Future<Map<String, dynamic>?> selectRandomMovieByGenre(int genreId, {String language = 'en-US'}) async {
    try {
      var movies = await getMoviesByGenre(genreId, language: language);

      if (movies != null && movies['results'] != null && movies['results'].length > 0) {
        var randomIndex = Random().nextInt(movies['results'].length);
        return movies['results'][randomIndex];
      } else {
        return null;
      }
    } catch (error) {
      print('Error selecting random movie by genre: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>> searchMovies({String? platform, int? genreId, String? region, String language = 'en-US', int page = 1}) async {
    String url = '$baseUrl/discover/movie?language=$language&page=$page&sort_by=popularity.desc';

    if (platform != null) {
      url += '&with_watch_providers=$platform';
    }
    if (region != null) {
      url += '&watch_region=$region';
    }
    if (genreId != null) {
      url += '&with_genres=$genreId';
    }

    return await fetchData(url);
  }

  Future<List<dynamic>> generateFilmList(List<dynamic> genres, List<dynamic> platforms, {int totalPages = 5}) async {
    List<dynamic> allMovies = [];

    try {
      String platformQueryString = platforms.where((platform) => platform['selected']).map((platform) => platform['provider_id'].toString()).join('|');
      String genreQueryString = genres.where((genre) => genre['selected']).map((genre) => genre['id'].toString()).join('|');

      for (int page = 1; page <= totalPages; page++) {
        String url = '$baseUrl/discover/movie?language=fr&page=$page&with_watch_providers=$platformQueryString&with_genres=$genreQueryString';

        var movies = await fetchData(url);
        if (movies != null && movies['results'] != null) {
          allMovies.addAll(movies['results']);
        }
      }
    } catch (error) {
      print('Error generating film list: $error');
    }

    return allMovies;
  }

  Future<List<dynamic>> getStreamingPlatforms({String countryCode = 'us', String language = 'en-US'}) async {
    String url = '$baseUrl/watch/providers/movie?language=$language&watch_region=$countryCode';

    try {
      var response = await fetchData(url);
      if (response != null && response['results'] != null) {
        var sortedPlatforms = List.from(response['results']);
        sortedPlatforms.sort((a, b) => a['display_priority'] - b['display_priority']);
        return sortedPlatforms;
      }
    } catch (error) {
      print('Error getting streaming platforms: $error');
    }

    return [];
  }

  Future<Map<String, dynamic>> getMovieGenres({String language = 'en-US'}) async {
    String url = '$baseUrl/genre/movie/list?language=$language';
    return await fetchData(url);
  }

  Future<Map<String, dynamic>> getConfiguration() async {
    String url = '$baseUrl/configuration?api_key=$apiKey';
    return await fetchData(url);
  }

  Future<Map<String, dynamic>> getMovieDetails(int movieId, {String language = 'en-US'}) async {
    String url = '$baseUrl/movie/$movieId?language=$language&append_to_response=videos,credits';
    return await fetchData(url);
  }

  Future<Map<String, dynamic>> findMovieByName(String movieName, {String language = 'en-US'}) async {
    String url = '$baseUrl/search/movie?query=$movieName&language=$language';
    return await fetchData(url);
  }

  Future<Map<String, dynamic>> getActorDetails(int actorId, {String language = 'en-US'}) async {
    String url = '$baseUrl/person/$actorId?language=$language';
    return await fetchData(url);
  }

  Future<Map<String, dynamic>> fetchData(String url) async {
    var headers = {'accept': 'application/json', 'Authorization': 'Bearer $apiKey'};

    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      print('Error fetching data: $error');
      return {};
    }
  }
}
