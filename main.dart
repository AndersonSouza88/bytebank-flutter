import 'package:flutter/material.dart';

void main() {
  runApp(Bytebank());
}

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            //numero da conta
            _controllerNumeroConta,
            'Número da Conta',
            '000',
          ),
          Editor(
            //valor
            _controllerValor,
            'Valor',
            '0.00',
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: () => _criaTransferencia(context),
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final valor = double.tryParse(_controllerValor.text);
    final numeroConta = int.tryParse(_controllerNumeroConta.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$transferenciaCriada'),
        ),
      );
    }
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferência'),
        ),
        body: ListView(
          children: [
            ItemTransferencia(Transferencia(123.45, 1000)),
            ItemTransferencia(Transferencia(567.89, 2000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
            ItemTransferencia(Transferencia(901.23, 3000)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final Future<Transferencia?> future = Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FormularioTransferencia();
              }),
            );
            future.then((transferenciaRecebida){
              debugPrint('chegou carai');
              debugPrint('$transferenciaRecebida');

            });
          },
        ),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  /*
  final String valor;
  final String numeroConta;

  ItemTransferencia(this.valor, this.numeroConta);
  */

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

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone; // "?" permite acesso nulo

  Editor(this.controlador, this.rotulo, this.dica, {this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
