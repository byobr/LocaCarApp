class Autorizacao {
  bool executadoComSucesso;
  String mensagem;
  Usuario data;

  Autorizacao({this.executadoComSucesso, this.mensagem, this.data});

  Autorizacao.fromJson(Map<String, dynamic> json) {
    executadoComSucesso = json['executadoComSucesso'];
    mensagem = json['mensagem'];
    data = json['data'] != null ? new Usuario.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['executadoComSucesso'] = this.executadoComSucesso;
    data['mensagem'] = this.mensagem;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Usuario {
  int idUsuario;
  String usuario;
  String perfil;
  String token;
  String expiracao;

  Usuario(
      {this.idUsuario, this.usuario, this.perfil, this.token, this.expiracao});

  Usuario.fromJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'];
    usuario = json['usuario'];
    perfil = json['perfil'];
    token = json['token'];
    expiracao = json['expiracao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUsuario'] = this.idUsuario;
    data['usuario'] = this.usuario;
    data['perfil'] = this.perfil;
    data['token'] = this.token;
    data['expiracao'] = this.expiracao;
    return data;
  }
}
