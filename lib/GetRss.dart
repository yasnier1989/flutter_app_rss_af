import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class GetRss {

  static Future<List<Noticia>> getRss() async {
    var data = await http.get(
        "https://actualidad.rt.com/feeds/all.rss",
        headers: {
          "Content-Type": "application/json"
        });

    var rssFeed = new RssFeed.parse(data.body.toString());

    List<Noticia> noticias = new List(); //listado de noticias que se devuelven a la interfaz

    for (int i = 0; i < rssFeed.items.length; i++) {
      print("Titulo: " + rssFeed.items[i].title);
      print("Descripcion: " + rssFeed.items[i].title);//fuck
      print("Fecha: " + rssFeed.items[i].pubDate);
      print("Url Imagen: " + rssFeed.items[i].enclosure.url);
      print("Enlace a Noticia: " + rssFeed.items[i].link);
      print("\n");

      noticias.add(new Noticia(rssFeed.items[i].title, rssFeed.items[i].description, rssFeed.items[i].pubDate,
          rssFeed.items[i].enclosure.url, rssFeed.items[i].link));
    }

    return noticias;
  }

}

class Noticia {

  String _titulo, _descripcion, _fecha, _urlImagen, _urlNoticia;

  Noticia(this._titulo, this._descripcion, this._fecha, this._urlImagen, this._urlNoticia);

  get urlNoticia => _urlNoticia;

  set urlNoticia(value) {
    _urlNoticia = value;
  }

  get urlImagen => _urlImagen;

  set urlImagen(value) {
    _urlImagen = value;
  }

  get fecha => _fecha;

  set fecha(value) {
    _fecha = value;
  }

  get descripcion => _descripcion;

  set descripcion(value) {
    _descripcion = value;
  }

  String get titulo => _titulo;

  set titulo(String value) {
    _titulo = value;
  }


}