import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube_app/model/Video.dart';

import '../api.dart';

class TelaInicio extends StatefulWidget {

  String pesquisa;

  TelaInicio(this.pesquisa);

  @override
  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  @override

  _carregaVideos(String pesquisa){

    Api api = new Api();
    return api.digitado(pesquisa);
  }

  @override
  void initState(){
    super.initState();
    print('1 - initState');
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print('2 - didChangeDependencies');
  }

  @override void didUpdateWidget(TelaInicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('2 - didUpdateWidget');
  }

  @override
  void dispose(){
    super.dispose();
    print('4 - dispose');
  }

  Widget build(BuildContext context) {
    print('3 - build');

    return FutureBuilder<List<Video>>(
      future: _carregaVideos(widget.pesquisa),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else {
          return ListView.separated(
              itemBuilder: (context, index){
                List<Video> videos = snapshot.data;
                Video video;
                video = videos[ index ];
                return GestureDetector(
                  onTap: (){
                    FlutterYoutube.playYoutubeVideoById(
                        apiKey: CHAVE_YOUTUBE_API,
                        videoId: video.id,
                        autoPlay: true,
                        fullScreen: true
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  video.imagem
                              ),
                            )
                        ),
                      ),
                      ListTile(
                        title: Text(
                            video.titulo
                        ),
                        subtitle: Text(
                            video.descricao
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(
                    color: Colors.red,
                    height: 3,
                  ),
              itemCount: snapshot.data.length);
        }
      },
    );
  }
}
