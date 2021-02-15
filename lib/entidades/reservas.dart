class Reservas {
  bool executadoComSucesso;
  String mensagem;
  List<Reserva> data = new List<Reserva>();

  Reservas({this.executadoComSucesso, this.mensagem, this.data});

  Reservas.fromJson(Map<String, dynamic> json) {
    executadoComSucesso = json['executadoComSucesso'];
    mensagem = json['mensagem'];
    if (json['data'] != null) {
      data = new List<Reserva>();
      json['data'].forEach((v) {
        data.add(new Reserva.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['executadoComSucesso'] = this.executadoComSucesso;
    data['mensagem'] = this.mensagem;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reserva {
  int id;
  Carro carro;
  Cliente cliente;
  String dataCheckin;
  String dataCheckout;
  int horas;
  double precoNoDia;
  double precoTotal;
  String dataAluguel;
  String origem;

  Reserva(
      {this.id,
      this.carro,
      this.cliente,
      this.dataCheckin,
      this.dataCheckout,
      this.horas,
      this.precoNoDia,
      this.precoTotal,
      this.dataAluguel,
      this.origem});

  Reserva.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carro = json['carro'] != null ? new Carro.fromJson(json['carro']) : null;
    cliente =
        json['cliente'] != null ? new Cliente.fromJson(json['cliente']) : null;
    dataCheckin = json['dataCheckin'];
    dataCheckout = json['dataCheckout'];
    horas = json['horas'];
    precoNoDia = json['precoNoDia'];
    precoTotal = json['precoTotal'];
    dataAluguel = json['dataAluguel'];
    origem = json['origem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.carro != null) {
      data['carro'] = this.carro.toJson();
    }
    if (this.cliente != null) {
      data['cliente'] = this.cliente.toJson();
    }
    data['dataCheckin'] = this.dataCheckin;
    data['dataCheckout'] = this.dataCheckout;
    data['horas'] = this.horas;
    data['precoNoDia'] = this.precoNoDia;
    data['precoTotal'] = this.precoTotal;
    data['dataAluguel'] = this.dataAluguel;
    data['origem'] = this.origem;
    return data;
  }
}

class Carro {
  int id;
  String placa;
  Modelo modelo;
  int anoModelo;
  double valorHora;
  int combustivel;
  int limitePortaMalas;
  int categoria;

  Carro(
      {this.id,
      this.placa,
      this.modelo,
      this.anoModelo,
      this.valorHora,
      this.combustivel,
      this.limitePortaMalas,
      this.categoria});

  Carro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placa = json['placa'];
    modelo =
        json['modelo'] != null ? new Modelo.fromJson(json['modelo']) : null;
    anoModelo = json['anoModelo'];
    valorHora = json['valorHora'];
    combustivel = json['combustivel'];
    limitePortaMalas = json['limitePortaMalas'];
    categoria = json['categoria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['placa'] = this.placa;
    if (this.modelo != null) {
      data['modelo'] = this.modelo.toJson();
    }
    data['anoModelo'] = this.anoModelo;
    data['valorHora'] = this.valorHora;
    data['combustivel'] = this.combustivel;
    data['limitePortaMalas'] = this.limitePortaMalas;
    data['categoria'] = this.categoria;
    return data;
  }
}

class Modelo {
  int id;
  String modelo;
  Marca marca;

  Modelo({this.id, this.modelo, this.marca});

  Modelo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelo = json['modelo'];
    marca = json['marca'] != null ? new Marca.fromJson(json['marca']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['modelo'] = this.modelo;
    if (this.marca != null) {
      data['marca'] = this.marca.toJson();
    }
    return data;
  }
}

class Marca {
  int id;
  String nome;

  Marca({this.id, this.nome});

  Marca.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }
}

class Cliente {
  int id;
  String nome;
  String email;
  String celular;
  String cpf;
  String senha;
  String aniversaio;
  String cep;
  String logradouro;
  String numero;
  String complemento;
  String cidade;
  String estado;

  Cliente(
      {this.id,
      this.nome,
      this.email,
      this.celular,
      this.cpf,
      this.senha,
      this.aniversaio,
      this.cep,
      this.logradouro,
      this.numero,
      this.complemento,
      this.cidade,
      this.estado});

  Cliente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    celular = json['celular'];
    cpf = json['cpf'];
    senha = json['senha'];
    aniversaio = json['aniversaio'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    complemento = json['complemento'];
    cidade = json['cidade'];
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['celular'] = this.celular;
    data['cpf'] = this.cpf;
    data['senha'] = this.senha;
    data['aniversaio'] = this.aniversaio;
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    return data;
  }
}
