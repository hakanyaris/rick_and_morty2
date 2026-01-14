import 'package:flutter/material.dart';
import 'package:rick_and_morty2/karakter.dart';
import 'package:rick_and_morty2/karakterDetay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrtakListe extends StatefulWidget {
  List<Karakter> _karakterler;
  List<int> _favorIdler;
  late int _index;
  OrtakListe(this._karakterler, this._favorIdler);

  @override
  State<OrtakListe> createState() => _OrtakListeState();
}

class _OrtakListeState extends State<OrtakListe> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._karakterler.length,
      itemBuilder: _buildItemBuilder,
    );
  }

  Widget _buildItemBuilder(BuildContext context, int index) {
    Karakter karakter = widget._karakterler[index];
    widget._index = index;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          detaySayfasinaGit(karakter);
        },

        title: Text("Adı:${karakter.adi ?? ''}"),
        leading: SizedBox(
          child: Image(image: NetworkImage(karakter.resim ?? "")),
        ),
        subtitle: Text("Cinsiyet:  ${karakter.cinsiyet ?? ""}"),
        trailing: SizedBox(
          width: 250,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  _favoriListesiniDoldurVeSharedPreferences(karakter);
                },
                icon: favoriIconAta(),
              ),
              Text(
                " Oluşturulma Tarihi; ${karakter.olusturulmaTarihi != null && karakter.olusturulmaTarihi!.length > 11 ? karakter.olusturulmaTarihi!.substring(0, 10) : karakter.olusturulmaTarihi ?? " "}",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void detaySayfasinaGit(Karakter karakter) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (BuildContext context) {
        return KarakterDetay(karakter);
      },
    );
    Navigator.push(context, pageRoute);
  }

  Widget favoriIconAta() {
    return widget._favorIdler.contains(widget._karakterler[widget._index].id)
        ? Icon(Icons.favorite)
        : Icon(Icons.favorite_border);
  }

  void _favoriListesiniDoldurVeSharedPreferences(Karakter karakter) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (widget._favorIdler.contains(karakter.id)) {
      widget._favorIdler.remove(karakter.id);
    } else {
      widget._favorIdler.add(karakter.id as int);
    }
    pref.setStringList(
      'favoriIdler',
      widget._favorIdler.map((e) => e.toString()).toList(),
    );

    setState(() {});
  }
}
