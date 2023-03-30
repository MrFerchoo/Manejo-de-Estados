import 'package:flutter/material.dart';

class Suma extends StatefulWidget {
  const Suma({Key? key}) : super(key: key);

  @override
  State<Suma> createState() => _SumaState();
}

class _SumaState extends State<Suma> {
  
TextEditingController _numero1Controller = TextEditingController();
TextEditingController _numero2Controller = TextEditingController();

void _mostrarResultado(BuildContext context){
  int numero1 = int.tryParse(_numero1Controller.text) ?? 0;
  int numero2 = int.tryParse(_numero2Controller.text) ?? 0;

  int suma = numero1 + numero2;

  showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text("Resultado"),
      content: Text("La suma es: $suma"),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        },child: const Text("OK"),)
      ],
    );
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suma de numeros"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
          const SizedBox(height: 16,),
            TextField(
              controller:  _numero1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Numero 1',
                border: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 16,),
            TextField(
              controller:  _numero2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Numero 2',
                border: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 16,),
            ElevatedButton(onPressed: (){
              _mostrarResultado(context);
            }, child: Text("Suma"))
          ],
        ),
      ),
    );
  }
}
