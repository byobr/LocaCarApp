// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loca_car_app/entidades/autorizacao.dart';
import 'package:loca_car_app/pages/reservas.dart';
import 'package:localstorage/localstorage.dart';

class LayoutAppLC extends StatelessWidget {
  LocalStorage _storage;
  Usuario _usuario;

  LayoutAppLC(LocalStorage storage) {
    this._storage = storage;
    this._usuario =
        Usuario.fromJson(jsonDecode(this._storage.getItem('usuario')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LocaCar"),
        actions: [
          IconButton(
            tooltip: "Minhas Reservas",
            icon: const Icon(
              Icons.account_balance_wallet,
            ),
            onPressed: () {},
          ),
          IconButton(
            tooltip: "Logout (" + this._usuario.usuario + ")",
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () {},
          ),
          PopupMenuButton<Text>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(
                    "Logout",
                  ),
                )
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                "Suas Reservas: ",
                style: TextStyle(fontSize: 36),
              )),
          Center(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: ReservasPage(this._storage, this._usuario),
          ))
        ],
      ),
    );
  }
}
