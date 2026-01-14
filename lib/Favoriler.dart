import 'package:flutter/material.dart';
import 'package:rick_and_morty2/karakter.dart';
import 'package:rick_and_morty2/ortakListe.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {});
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
}
