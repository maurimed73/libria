import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'livro.dart';

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
        child: const Placeholder());
  }
}
