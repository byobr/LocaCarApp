import 'package:flutter/material.dart';
import 'package:loca_car_app/entidades/autorizacao.dart';
import 'package:loca_car_app/entidades/reservas.dart';
import 'package:loca_car_app/pages/reservaCard.dart';
import 'package:loca_car_app/repositorios/reservas.dart';
import 'package:localstorage/localstorage.dart';

/// This is the stateless widget that the main application instantiates.
class ReservasPage extends StatelessWidget {
  Reservas _reservas = new Reservas();
  List<Reserva> _listaReservas = new List<Reserva>();
  LocalStorage _storage;
  Usuario _usuario;
  ReservasRepositorio _reservasRepositorio;
  ReservasPage(LocalStorage storage, Usuario usuario, {Key key})
      : super(key: key) {
    this._storage = storage;
    this._reservasRepositorio = new ReservasRepositorio();
    this._usuario = usuario;
    _reservasRepositorio.ObterReservasPorUsuario(
            this._usuario.idUsuario, this._usuario.token)
        .then((Reservas data) {
      this._reservas = data;
      this._listaReservas = data.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReservasCard(this._listaReservas);
  }
}
