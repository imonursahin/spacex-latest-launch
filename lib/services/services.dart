import 'dart:convert';
import 'package:http/http.dart';
import 'package:spacex/model/spacex_model.dart';

class SpacexService {
  Future<SpacexModel> getLatestData() async {
    final response =
        await get(Uri.parse('https://api.spacexdata.com/v4/launches/latest'));

    if (response.statusCode == 200) {
      return SpacexModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
