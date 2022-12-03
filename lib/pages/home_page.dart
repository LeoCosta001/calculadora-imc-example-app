import 'package:calculadora_imc/main.dart';
import 'package:calculadora_imc/models/imc_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controllers
  TextEditingController weightInputController = TextEditingController();
  TextEditingController heightInputController = TextEditingController();
  IMCCheck? _imcResult;

  // Functions
  void _resetFields() {
    setState(() {
      weightInputController.text = '';
      heightInputController.text = '';
      _imcResult = null;
    });
  }

  void _calculate() {
    double weight = double.parse(weightInputController.text);
    double height = double.parse(heightInputController.text) / 100; // Transform centimeters to meters
    double imc = weight / (height * height);

    setState(() {
      _imcResult = IMCCheck(imc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.person, size: 120),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                controller: weightInputController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                ),
              ),
            ),
            TextField(
              controller: heightInputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (cm)',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Calcular'),
              ),
            ),
            Column(
              children: [
                if (_imcResult != null)
                  const Opacity(
                    opacity: 0.4,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        'Resultado:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                Text(
                  _imcResult == null ? 'Informe seus dados...' : _imcResult!.resultMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: _imcResult == null ? mainColor : _imcResult!.color,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
