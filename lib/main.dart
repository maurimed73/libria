import 'package:flutter/cupertino.dart';

void main() {
  runApp(Libria());
}

class Libria extends StatelessWidget {
  const Libria({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
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
                  return CupertinoPageScaffold(child: Text('Home'));
                },
              );
              break;
            case 1:
              retorno = CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child: Text('Pesquisar'));
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
