import 'package:flutter/material.dart';

class IMCCheck {
  IMCCheck(double imc) {
    void imcCalc(String resultMessage, Color color) {
      this.resultMessage = '$resultMessage (${imc.toStringAsFixed(2)})';
      this.color = color;
    }

    if (imc > 40) {
      imcCalc('Obesidade Grau III', Color(0xFFFF0000));
    } else if (imc >= 35) {
      imcCalc('Obesidade Grau II', Color(0xFFFF6600));
    } else if (imc >= 30) {
      imcCalc('Obesidade Grau I', Color(0xFFFFA700));
    } else if (imc >= 25) {
      imcCalc('Levemente Acima do Peso', Color(0xFFF7CB00));
    } else if (imc >= 18.5) {
      imcCalc('Peso Ideal', Color(0xFF2CBA00));
    } else if (imc < 18.5) {
      imcCalc('Abaixo do Peso', Color(0xFF82D800));
    }
  }

  late Color color;
  late String resultMessage;
}
