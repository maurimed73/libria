import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'livro.dart';
import 'shared_prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Livro>?> _futureLivros;

  @override
  void initState() {
    super.initState();
    _futureLivros = SharedPrefs().consultarTodosLivros();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Libria'),
        ),
        child: FutureBuilder<List<Livro>?>(
          future: _futureLivros,
          builder: (((context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white38,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Text(snapshot.data![index].titulo);
                  },
                );
              }
              return Center(child: Text("Llista de livros vazia"));
            }
            return CupertinoActivityIndicator();
          })),
        ));
  }
}
