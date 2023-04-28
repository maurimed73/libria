import 'package:flutter/cupertino.dart';

import 'src/home_page.dart';
import 'src/livro.dart';
import 'src/pesquisar_page.dart';

void main() {
  runApp(Libria());
}

class Libria extends StatelessWidget {
  const Libria({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: 'Pesquisar')
        ]),
        tabBuilder: (context, index) {
          late CupertinoTabView retorno;

          switch (index) {
            case 0:
              retorno = CupertinoTabView(
                builder: (context) {
                  return HomePage();
                },
              );
              break;
            case 1:
              retorno = CupertinoTabView(
                builder: (context) {
                  return PesquisarPage();
                },
              );
              break;
          }
          return retorno;
        },
      ),
    );
  }
}
