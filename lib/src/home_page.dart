import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:libria_app/src/books_api.dart';
import 'package:libria_app/src/detalhar_page.dart';

import 'livro.dart';
import 'shared_prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Livro>? _listaLivros = null;

  void consultarTodosLivros() async {
    _listaLivros = await SharedPrefs().consultarTodosLivros();
    setState(() {});
  }

  void _excluirTodosLivros() async {
    await SharedPrefs().excluirTodosLivros();
    setState(() {});
  }

  void _removerLivro(String id) async {
    await SharedPrefs().excluirLivroPorId(id);
    consultarTodosLivros();
  }

  @override
  Widget build(BuildContext context) {
    consultarTodosLivros();
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text('Libria'),
            trailing: GestureDetector(
              onTap: _excluirTodosLivros,
              child: Icon(CupertinoIcons.trash),
            )),
        child: _listaLivros != null
            ? ListView.separated(
                itemCount: _listaLivros!.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.white38,
                  );
                },
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_listaLivros![index].id),
                    background: Container(
                      color: Colors.red,
                      padding: EdgeInsets.only(right: 8),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          CupertinoIcons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      _removerLivro(_listaLivros![index].id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: GestureDetector(
                        onTap: () async {
                          var livro = await BooksApi()
                              .buscarLivroPorId(_listaLivros![index].id);

                          Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => DetalharPage(livro),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_listaLivros![index].titulo),
                            Icon(CupertinoIcons.chevron_right)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(child: Text("Lista está vazia")));
  }
}
