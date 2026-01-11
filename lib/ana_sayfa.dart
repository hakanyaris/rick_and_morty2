import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty2/Favoriler.dart';
import 'package:rick_and_morty2/karakter.dart';
import 'package:rick_and_morty2/karakterDetay.dart';
import 'package:rick_and_morty2/ortakListe.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String _api = 'https://rickandmortyapi.com/api/character';
  List<Karakter> _karakterler = [];
  List<int> _favorIdler = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _veriCek();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }

  AppBar _appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          _favorilerSayfasinaGit();
        },
        icon: Icon(Icons.favorite, color: Colors.blue),
      ),
    );
  }

  Widget _body() {
    return Card(child: OrtakListe(_karakterler, _favorIdler));
  }

  void _veriCek() async {
    Uri url = Uri.parse(_api);
    var response = await http.get(url);
    Map<String, dynamic> _karakterlerJson = jsonDecode(response.body);
    List<dynamic> _karakterList = _karakterlerJson['results'];
    for (var a = 0; a < _karakterList.length; a++) {
      Karakter _karakterler = Karakter.mapOlustur(_karakterList[a]);
      this._karakterler.add(_karakterler);
    }
    setState(() {});
  }

  void _favorilerSayfasinaGit() {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (BuildContext context) {
        return Favoriler(_favorIdler, _karakterler);
      },
    );
    Navigator.push(context, pageRoute);
  }
}


 



/*
{
  "info": {
    "count": 826,
    "pages": 42,
    "next": "https://rickandmortyapi.com/api/character/?page=20",
    "prev": "https://rickandmortyapi.com/api/character/?page=18"
  },
  "results": [
    {
      "id": 361,
      "name": "Toxic Rick",
      "status": "Dead",
      "species": "Humanoid",
      "type": "Rick's Toxic Side",
      "gender": "Male",
      "origin": {
        "name": "Alien Spa",
        "url": "https://rickandmortyapi.com/api/location/64"
      },
      "location": {
        "name": "Earth",
        "url": "https://rickandmortyapi.com/api/location/20"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/27"
      ],
      "url": "https://rickandmortyapi.com/api/character/361",
      "created": "2018-01-10T18:20:41.703Z"
    },
    // ...
  ]
}
*/