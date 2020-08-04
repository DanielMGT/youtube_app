import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyCXpz9Fs7wIiESENQficgouXxQKGnCNGBA";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";
const ID_CANAL = "UC-KTRBl9_6AX10-Y7IKwKdw";

class Api {

  Future<List<Video>> digitado(String pesquisa) async {
      http.Response response = await http.get(
        URL_BASE + "search"
          "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key= $CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
      );
      if(response.statusCode == 200){
        Map<String, dynamic> dadosJson = json.decode( response.body );

        List<Video> videos = dadosJson["items"].map<Video>(
            (map){
              return Video.fromJson(map);
            }
        ).toList();

        return videos;
      }
      else {
        print('Código de erro. :/');
      }
  }

}