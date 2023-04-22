class Livro {
  final String id; //id
  final String titulo; //volumeInfo-title
  String? descricao; //volumeInfo-description
  int? paginas; //volumeInfo-pageCount
  String? thumbnail; //volumeInfo-thumbnail

  Livro(this.id, this.titulo, this.descricao, this.paginas, this.thumbnail);

  Livro.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        titulo = json["volumeInfo"]["title"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'descricao': descricao,
        'paginas': paginas,
        'thumbnail': thumbnail
      };
}
