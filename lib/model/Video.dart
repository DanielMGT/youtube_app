class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String idCanal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.idCanal});

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      idCanal: json["snippet"]["channelId"],
      descricao: json["snippet"]["description"],
    );
  }

}