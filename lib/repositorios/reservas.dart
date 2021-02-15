import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loca_car_app/entidades/Configs.dart';
import 'package:loca_car_app/entidades/autorizacao.dart';
import 'package:loca_car_app/entidades/reservas.dart';

class ReservasRepositorio {
  String api = Configs().urlapi;
  Future<Reservas> ObterReservasPorUsuario(int usuario, String token) async {
    var headers = {
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    };
    http.Response result = await http.get(
        Uri.encodeFull(api) + "Alugueis/Cliente?Cliente=" + usuario.toString(),
        headers: headers);

    Reservas retornoJson = Reservas.fromJson(json.decode(result.body));
    return retornoJson;
  }
}
