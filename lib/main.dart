import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';
  String operacao = '';
  double primeiroNumero = 0.0;

  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        setState(() {
          numero += tecla;

          if (numero.contains('.')) {
            // double numeroDouble = double.parse(numero);
            // numero = numeroDouble.toString();
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
        });
        break;

      case '/':
      case '*':
      case '-':
      case '+':
        operacao = tecla;
        primeiroNumero = double.parse(numero);
        numero = '0';
        break;

      case '.':
        setState(() {
          numero += tecla;
        });
        break;

      case '=':
        double resultado = 0.0;
        String erro = 'Erro';

        if (operacao == '+') {
          resultado = primeiroNumero + double.parse(numero);
        } else if (operacao == '-') {
          resultado = primeiroNumero - double.parse(numero);
        } else if (operacao == '*') {
          resultado = primeiroNumero * double.parse(numero);
        } else if (operacao == '/') {
          resultado = primeiroNumero / double.parse(numero);
          if (primeiroNumero == 0.0 || numero == '0') {
            resultado = 0.0;
          }
        }

        setState(() {
          if (resultado == 0.0 && operacao == '/') {
            numero = erro;
          } else {
            numero = resultado.toString();
          }
        });
        break;

      case 'AC':
        setState(() {
          numero = '0';
        });
        break;

      case '<-':
        if (numero.isNotEmpty) {
          setState(() {
            numero = numero.substring(0, numero.length - 1);
          });
        }
        break;

      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
          backgroundColor: Colors.black26,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  numero,
                  style: const TextStyle(fontSize: 75),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('AC');
                  },
                  child: const Text(
                    'AC',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const Text(' '),
                const Text(' '),
                GestureDetector(
                  onTap: () {
                    calcular('<-');
                  },
                  child: Image.asset(
                    'assets/images/backspace.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('7');
                  },
                  child: const Text(
                    '7',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('8');
                  },
                  child: const Text(
                    '8',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('9');
                  },
                  child: const Text(
                    '9',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('/');
                  },
                  child: const Text(
                    '/',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('4');
                  },
                  child: const Text(
                    '4',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('5');
                  },
                  child: const Text(
                    '5',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('6');
                  },
                  child: const Text(
                    '6',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('*');
                  },
                  child: const Text(
                    '*',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('1');
                  },
                  child: const Text(
                    '1',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('2');
                  },
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('3');
                  },
                  child: const Text(
                    '3',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('-');
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('0');
                  },
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('.');
                  },
                  child: const Text(
                    '.',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('=');
                  },
                  child: const Text(
                    '=',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('+');
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
