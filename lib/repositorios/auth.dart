import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loca_car_app/entidades/Configs.dart';
import 'package:loca_car_app/entidades/autorizacao.dart';

class AuthRepositorio {
  String api = Configs().urlapi;
  Future<Autorizacao> Logar(String usuario, String senha) async {
    var body = {'login': usuario, 'senha': senha, 'operador': false};
    var headers = {"content-type": "application/json"};
    http.Response result = await http.post(Uri.encodeFull(api) + "Auth",
        body: jsonEncode(body), headers: headers);

    var retornoJson = Autorizacao.fromJson(json.decode(result.body));
    return retornoJson;
  }
}
