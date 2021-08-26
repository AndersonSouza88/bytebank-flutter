import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ListaDeTransferencia(),
        appBar: AppBar(
          title: Text("Transfências"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    ),
  );
}

class ListaDeTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTransferencia(Transferencia(1000, 1001)),
        ItemTransferencia(Transferencia(2000, 2002)),
        ItemTransferencia(Transferencia(3000, 3003)),
      ],
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;


  ItemTransferencia(this._transferencia);

  /*final String valor;
  final String numeroConta;

  ItemTransferencia(this.valor, this.numeroConta);*/

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
