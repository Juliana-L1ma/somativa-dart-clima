import 'package:flutter/material.dart';

class InterfaceClima extends StatefulWidget{
  @override
  _InterfaceClimaState createState() => _InterfaceClimaState();
}

class _InterfaceClimaState extends State<InterfaceClima>{
  //************ variáveis usadas  
  TextEditingController _controllerTemp = TextEditingController();
  String _resultadoKelvin = "";
  String _resultadoFahr = "";
  String _direitos = "Programado por Juliana Lima";
 // ****************** lógica *********

 void _transforma(){
  double? celsius = double.tryParse(_controllerTemp.text);

  if (celsius == null) {
    setState(() {
      _resultadoKelvin = "Valor inválido";
    });
  } else {
    var _calculoKelvin = celsius + 273;
    var _calculoFahr = ((celsius*9/5)+32);

    String? kelvin = _calculoKelvin.toString();
    print("Kelvin: " + kelvin);
    String? fahrenheit = _calculoFahr.toString();
    print("Fahr: " + fahrenheit);

    setState(() {
      _resultadoKelvin= "Celsius → Kelvin=  $kelvin K";
      _resultadoFahr = "Celsius → Fahrenheit= $fahrenheit °F";
    });

  }
 }

  @override
  Widget build (BuildContext context){

    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      //************ HEADER *************
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text("Seu conversor de temperatura aqui!"),
      ),

    // **************** BODY ****************
    body: Container(
      child: SingleChildScrollView(
      
        padding: EdgeInsets.all(32),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child:
              IconButton(
              icon: Image.asset("../image/foto1.png"),
              iconSize: 100,
              onPressed: () {
                setState(() {
                  _direitos = "COOOOOOOLLLLLL";
                });
              },
            ),

            ),

            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(_direitos,
              style: TextStyle(fontSize: 10, fontWeight:FontWeight.bold, color: Colors.white),
              ),
            ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Digite uma temperatura em grau Celsius para ver seu equivalente em Fahrenheit e Kelvin.",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                ),
                ),

                //inputs para pegar o valor de celsius
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  labelText: "Digite uma temperatura em celcius ex. 23"),
                  maxLength: 2,
                  style: TextStyle(fontSize: 20, color: Colors.blue.shade50),
                  controller: _controllerTemp,
                ),

                // botão para enviar o dado digiado pelo usuário
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: 
                  ElevatedButton(
                   style: ElevatedButton.styleFrom(primary: Colors.blue.shade800),
                   child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 20)),
                    onPressed: _transforma,
                  ),
                ), 


              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(_resultadoKelvin,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                ),
                Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(_resultadoFahr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                )

          ],
        ),
        ),
    ),
    );
  }
}


