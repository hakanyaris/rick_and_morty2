import 'package:flutter/material.dart';
import 'package:rick_and_morty2/karakter.dart';

class KarakterDetay extends StatefulWidget {
  final Karakter detayKarakter;
  KarakterDetay(this.detayKarakter);

  State<KarakterDetay> createState() => _KarakterDetayState();
}

class _KarakterDetayState extends State<KarakterDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }

  AppBar _appBar() {
    return AppBar(title: Text(widget.detayKarakter.adi.toString()));
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 40),
          _buildResim(),
          SizedBox(height: 20),
          _buildDetayRow("Adi ", widget.detayKarakter.adi.toString()),
          _buildDetayRow("Durumu ", widget.detayKarakter.durumu.toString()),
          _buildDetayRow("Cinsiyeti", widget.detayKarakter.cinsiyet.toString()),
          _buildDetayRow("Tür", widget.detayKarakter.tur.toString()),
          _buildDetayRow("Son Konum", widget.detayKarakter.sonKonum as String),
          _buildDetayRow(
            "Oluşturulma Tarihi",
            (widget.detayKarakter.olusturulmaTarihi as String).substring(0, 10),
          ),
        ],
      ),
    );
  }

  SizedBox _buildResim() {
    return SizedBox(
      child: Image.network(widget.detayKarakter.resim.toString()),
    );
  }

  Row _buildDetayRow(String baslik, String detay) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(baslik, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(flex: 5, child: Text(detay)),
      ],
    );
  }
}
