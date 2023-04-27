class Livro {
  final String id; //id
  final String titulo; //volumeInfo-title
  String? descricao; //volumeInfo-description
  int? paginas; //volumeInfo-pageCount
  String? thumbnail; //volumeInfo-thumbnail

  Livro(
    this.id,
    this.titulo,
    this.descricao,
    this.paginas,
    this.thumbnail,
  );

  Livro.fromSharedPres(this.id, this.titulo);

  Livro.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        titulo = json["volumeInfo"]["title"],
        descricao =
            json["volumeInfo"]["description"] ?? 'Descrição indisponível',
        paginas = json["volumeInfo"]["pageCount"] ?? 0,
        thumbnail = json["volumeInfo"]["imageLinks"] == null
            ? null
            : json["volumeInfo"]["imageLinks"]["thumbnail"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'descricao': descricao,
        'paginas': paginas,
        'thumbnail': thumbnail,
      };

  @override
  bool operator ==(Object other) => other is Livro && other.id == id;
}
