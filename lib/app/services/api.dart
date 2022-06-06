import 'package:http/http.dart';
import 'package:killed_by_google/app/services/graveyard_model.dart';

class API {
  static const host =
      'https://raw.githubusercontent.com/codyogden/killedbygoogle/main/graveyard.json';

  ///
  Future<List<Graveyard>> getDataFromURL() async {
    final url = Uri.tryParse(host)!;
    final response = await get(url);
    if (response.statusCode == 200) {
      // final decoded = jsonDecode(response.body) as List<dynamic>;
      return graveyardFromJson(response.body);
    } else {
      throw response.body;
    }
  }
}
