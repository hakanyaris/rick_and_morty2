class Karakter {
  int? id;
  String? adi;
  String? durumu; //status
  String? tur; //species -insan v.b
  String? cinsiyet; //gender
  String? resim;
  String? sonKonum; // location
  String? olusturulmaTarihi;

  Karakter.mapOlustur(Map<dynamic, dynamic> map) {
    this.id = map['id'] ?? -1;
    this.adi = map['name'] ?? '';
    this.cinsiyet = map['gender'] ?? "";
    this.durumu = map['status'] ?? "";
    this.tur = map['species'] ?? "";
    this.resim = map['image'] ?? "";
    this.olusturulmaTarihi = map['created'] ?? " ";
    this.sonKonum = map['location']['name'] ?? "";
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
