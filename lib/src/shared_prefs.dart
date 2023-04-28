import 'package:shared_preferences/shared_preferences.dart';

import 'livro.dart';

class SharedPrefs {
  Future<void> adicionarLivro(String id, String titulo) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(id, titulo);
  }

  Future<List<Livro>?> consultarTodosLivros() async {
    var lista = <Livro>[];
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    if (keys.isEmpty) {
      return null;
    }
    for (var id in keys) {
      lista.add(Livro.fromSharedPres(id, prefs.getString(id)!));
    }

    return lista;
  }

  Future<void> excluirTodosLivros() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
