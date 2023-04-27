import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'livro.dart';

class DetalharPage extends StatefulWidget {
  final Livro livro;
  const DetalharPage(this.livro, {super.key});

  @override
  State<DetalharPage> createState() => _DetalharPageState();
}

class _DetalharPageState extends State<DetalharPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Detalhar"),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              widget.livro.thumbnail == null
                  ? FlutterLogo(size: 128)
                  : Image.network(
                      widget.livro.thumbnail!,
                      height: 200,
                    ),
              SizedBox(
                height: 16,
              ),
              Text(
                widget.livro.titulo,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              Divider(
                color: Colors.white38,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Páginas"),
                  SizedBox(
                    width: 4,
                  ),
                  Text(widget.livro.paginas!.toString()),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                widget.livro.descricao!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ));
  }
}
