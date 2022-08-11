import 'package:flutter/material.dart';

void main() => runApp(EscriboApp());

class EscriboApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: FormularioInteiros(),
      ),
    );
  }
}

class FormularioInteiros extends StatelessWidget {
  final TextEditingController _controladorCampoNumero = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informe um número'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: _controladorCampoNumero,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Digite um número:',
                hintText: '000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width * 0.6,
            height: 100.0,
            child: RaisedButton(
              onPressed: () {
                final int? numeroDigitado = int.tryParse(_controladorCampoNumero.text);
                if (numeroDigitado != null) {
                  int somaNumeroDigitado = 0;
                  for(var i = 1; i < numeroDigitado; i++){
                    if (i % 3 == 0 || i % 3 == 3 || i % 5 == 0 || i % 5 == 5) {
                      somaNumeroDigitado = somaNumeroDigitado + i;
                    }
                  }
                  final numeroInformado = AdicionarNumero(somaNumeroDigitado, numeroDigitado);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text('Resultado do somatório de todos os valores inteiros divisíveis por três ou cinco que sejam inferiores ao número passado: $somaNumeroDigitado'),
                        content: new Text("O número digitado foi: $numeroDigitado"),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // Navigator.pop(context, numeroInformado);
                }
              },
              child: Text('Ver resultado'),
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class AdicionarNumero {
  final int numero;
  final int numdigitado;

  AdicionarNumero(this.numero, this.numdigitado);

  @override
  String toString() {
    return 'AdicionarNumero{numero: $numero, numdigitado: $numdigitado}';
  }
}
