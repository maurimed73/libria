import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'detalhar_page.dart';
import 'livro.dart';
import 'shared_prefs.dart';

class ResultadoPesquisaPage extends StatefulWidget {
  final List<Livro>? lista;
  const ResultadoPesquisaPage(this.lista, {super.key});

  @override
  State<ResultadoPesquisaPage> createState() => _ResultadoPesquisaPageState();
}

class _ResultadoPesquisaPageState extends State<ResultadoPesquisaPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Livros Encontrados'),
        ),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider(color: Colors.white70);
          },
          itemBuilder: (context, int index) {
            final livro = widget.lista![index];
            print(livro.paginas);
            return GestureDetector(
              onTap: () {
                print("Navigation bar ");
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => DetalharPage(livro),
                ));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  children: [
                    livro.thumbnail == null
                        ? FlutterLogo()
                        : Image.network(livro.thumbnail!),
                    SizedBox(width: 8),
                    Expanded(child: Text(livro.titulo)),
                    GestureDetector(
                        onTap: () {
                          print("${livro.titulo} livro favoritado");
                          SharedPrefs().adicionarLivro(livro.id, livro.titulo);
                        },
                        child: Icon(CupertinoIcons.add_circled))
                  ],
                ),
              ),
            );
          },
          itemCount: widget.lista!.length,
        ));
  }
}
