import 'dart:convert';
import 'package:http/http.dart';
import 'package:spacex/model/spacex_model.dart';

class SpacexService {
  final String apiUrl = "https://api.spacexdata.com/v4/launches/latest";

  Future<List<SpacexModel>> getLatestData() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<SpacexModel> latestData = body
          .map(
            (dynamic item) => SpacexModel.fromJson(item),
          )
          .toList();

      return latestData;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
