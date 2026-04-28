
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  var _message = "";

  double? _alcoolPrice = 0.0;
  double? _gasolinaPrice = 0.0;

  void _calcular() {
    _alcoolPrice = double.tryParse(_controllerAlcool.text);
    _gasolinaPrice = double.tryParse(_controllerGasolina.text);

    if (_alcoolPrice == null) {
        setState(() {
          _message = "Campo preço do álcool inválido. Utilize valores maiores que zero e . como separador";
        });
    } else if (_gasolinaPrice == null) {
      setState(() {
        _message =
        "Campo preço do gasolina inválido. Utilize valores maiores que zero e . como separador";
      });
    } else {
      double preco = _alcoolPrice! / _gasolinaPrice!;
      if (preco >= 0.7) {
        setState(() {
          _message =
          "Abasteça Gasolina";
        });
      } else {
        setState(() {
          _message =
          "Abasteça Álcool";
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina?"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only( bottom: 32 ),
              child: Image.asset("./images/logo.png"),
            ),
            const Padding(
              padding: EdgeInsets.only( bottom: 10 ),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Preço Álcool, ex: 4.50",
              ),
              style: const TextStyle(
                fontSize: 22,
              ),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Preço Gasolina, ex: 6.50",
              ),
              style: const TextStyle(
                fontSize: 22,
              ),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: const EdgeInsets.only( top: 10 ),
              child: TextButton(
                onPressed: _calcular,
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent
                ),
                child: const Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _message,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
