import 'package:flutter/material.dart';
import 'package:rick_and_morty2/karakter.dart';
import 'package:rick_and_morty2/ortakListe.dart';

class Favoriler extends StatefulWidget {
  List<int> _favoriIdler;
  List<Karakter> _karakterler;

  Favoriler(this._favoriIdler, this._karakterler);
  @override
  State<Favoriler> createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  List<Karakter> _favoriKarakterler = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      favoriKarakterListesiniDoldur();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _AppBar(), body: _body());
  }

  AppBar _AppBar() {
    return AppBar(title: Text("Favoriler"));
  }

  Widget _body() {
    return Card(child: OrtakListe(_favoriKarakterler, widget._favoriIdler));
  }

  void favoriKarakterListesiniDoldur() {
    for (int a = 0; a < widget._karakterler.length; a++) {
      if (widget._favoriIdler.contains(widget._karakterler[a].id)) {
        _favoriKarakterler.add(widget._karakterler[a]);
      }
    }
    // print(widget._favoriIdler);
    setState(() {});
  }
}
