import 'dart:convert';

import 'package:http/http.dart';
import 'package:meme/model/meme_modal.dart';

class FetchMeme {
  static Future<String> fetchNewMeme() async {
    Response response = await get(
      Uri.parse("https://meme-api.com/gimme"),
    );

    Map bodyData = jsonDecode(response.body);
    return MemeModal.fromJson(bodyData.cast<String, dynamic>()).url ??
        "https://i.redd.it/jg0m1vps9vpb1.jpg";
  }
}
