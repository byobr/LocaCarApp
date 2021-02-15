// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loca_car_app/entidades/autorizacao.dart';
import 'package:loca_car_app/layout.dart';
import 'package:loca_car_app/repositorios/auth.dart';
import 'package:localstorage/localstorage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usuario = new TextEditingController();
  final TextEditingController senha = new TextEditingController();
  final AuthRepositorio authRepositorio = new AuthRepositorio();
  LocalStorage _storage;

  LoginPage(LocalStorage storage) {
    this._storage = storage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "LocaCar :: Login",
          style: new TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.white,
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo.jpg"),
                      Text(
                        "Realize o login abaixo:",
                        style: TextStyle(fontSize: 30, color: Colors.black38),
                      ),
                      Padding(
                          padding: EdgeInsets.all(30),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Usuario",
                              border: OutlineInputBorder(),
                            ),
                            controller: usuario,
                          )),
                      Padding(
                          padding: EdgeInsets.all(30),
                          child: TextField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: "Senha",
                              border: OutlineInputBorder(),
                            ),
                            controller: senha,
                          )),
                      Padding(
                          padding: EdgeInsets.all(30),
                          child: RaisedButton(
                              child: const Text('Login'),
                              color: Colors.orange[300],
                              elevation: 4.0,
                              splashColor: Colors.yellow,
                              onPressed: () {
                                authRepositorio.Logar(usuario.text, senha.text)
                                    .then((Autorizacao saida) {
                                  if (saida.executadoComSucesso) {
                                    _storage.setItem(
                                        'usuario', jsonEncode(saida.data));
                                  }
                                  mostrarAlerta(
                                      saida.data != null
                                          ? saida.data.usuario
                                          : null,
                                      context,
                                      saida.executadoComSucesso,
                                      saida.mensagem);
                                });
                              })),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  mostrarAlerta(
      String titulo, BuildContext context, bool sucesso, String mensagem) {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: sucesso ? Text(titulo) : Text("Erro de Login."),
          content: Text(sucesso ? "Logado com sucesso!" : mensagem),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Ok!"),
              onPressed: () {
                print(_storage.getItem('usuario'));
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LayoutAppLC(this._storage)));
              },
            ),
          ],
        ));
  }
}
