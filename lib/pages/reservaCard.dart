import 'package:flutter/material.dart';
import 'package:loca_car_app/entidades/autorizacao.dart';
import 'package:loca_car_app/entidades/reservas.dart';
import 'package:loca_car_app/repositorios/reservas.dart';
import 'package:localstorage/localstorage.dart';

class ReservasCard extends StatelessWidget {
  List<Reserva> _reserva = new List<Reserva>();

  ReservasCard(List<Reserva> reservas) {
    this._reserva = reservas;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: _reserva.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('The Enchanted'),
                    subtitle:
                        Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BUY TICKETS'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('LISTEN'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider());
  }
}
