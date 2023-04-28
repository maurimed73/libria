import 'dart:convert';

import 'livro.dart';
import 'package:http/http.dart' as http;

const URL = "https://www.googleapis.com/books/v1/volumes?q=";
const URL_ID = "https://www.googleapis.com/books/v1/volumes/";

class BooksApi {
  //buscar Livros por Titulo
  Future<List<Livro>?> buscaLivrosPorTitulo(String titulo) async {
    final url = URL + titulo;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      var totalItems = jsonResponse["totalItems"] as int;
      print(totalItems);
      if (totalItems == 0) {
        //lista vazia
        return null;
      }
      var listaItems = jsonResponse["items"] as List;

      return listaItems.map((livro) => Livro.fromJson(livro)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Livro> buscarLivroPorId(String id) async {
    final url = URL_ID + id;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Livro.fromJson(json);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
