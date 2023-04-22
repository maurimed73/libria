import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:libria_app/src/books_api.dart';

import 'resultado_pesquisa.dart';

class PesquisarPage extends StatefulWidget {
  const PesquisarPage({super.key});

  @override
  State<PesquisarPage> createState() => _PesquisarPageState();
}

class _PesquisarPageState extends State<PesquisarPage> {
  final _tituloController = TextEditingController();
  bool _isLoading = false;

  void _pesquisar() async {
    setState(() {
      _isLoading = true;
    });

    final lista =
        await BooksApi().buscaLivrosPorTitulo(_tituloController.text.trim());
    if (lista != null) {
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => ResultadoPesquisaPage(lista)));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          CupertinoTextField(
            controller: _tituloController,
            placeholder: 'Título',
            clearButtonMode: OverlayVisibilityMode.editing,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          ),
          SizedBox(
            height: 16,
          ),
          CupertinoButton.filled(
            child:
                _isLoading ? CupertinoActivityIndicator() : Text('Pesquisar'),
            onPressed: () {
              _pesquisar();
            },
          )
        ],
      ),
    ));
  }
}
