
import 'package:flutter/material.dart';

void main() {
  runApp(Bytebank());
}

class Bytebank extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body:FormularioTransferencia(),
        )
    );
  }
}


class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Text('Teste '),
    );
  }
}

class ListaDeTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transfências"),
        ),
        body: Column(
          children: [
            ItemTransferencia(Transferencia(1000, 1001)),
            ItemTransferencia(Transferencia(2000, 2002)),
            ItemTransferencia(Transferencia(3000, 3003)),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
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
