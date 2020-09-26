import 'package:flutter/material.dart';

void main () => runApp(
  MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double totalConta = 0.0;
  int porcentagemGarcom = 0;
  double totalPessoa = 0.0;
  int quantPessoas = 1;
  double totalGorjeta = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("\$ RACHA CONTA"),
        backgroundColor: Colors.blue[900],

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 40.0),
                child: Container(
                    height: 180.0,
                    width: 600.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey[350],
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Total por pessoa",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("R\$${totalPessoa.toStringAsFixed(2)}",
                        style: TextStyle (
                          fontSize: 55.0,
                          color: Colors.black,
                        )),
                      ),
                    ],
                  ),
                ),
              ), // box total
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                child: Container (
                  height: 50.0,
                  width: 300.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => screenTwo(quantPessoas : quantPessoas, totalConta : totalConta)),
                      );
                    },
                    child: Text("EU BEBI!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0)),
                    color: Colors.blue[900],
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),// botao proxima pagina
              Container (
                height: 500.0,
                margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                      child: TextField(
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.attach_money),
                              prefixText: "Valor total da conta            ",
                              prefixStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              totalConta = double.parse(value);
                              totalPessoa = (totalConta + totalGorjeta) / quantPessoas;
                            });
                          },
                        ),
                      ),
                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.people_outline),
                              prefixText: "Número de pessoas            ",
                              prefixStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                quantPessoas = int.parse(value);
                                totalPessoa = (totalConta + totalGorjeta) / quantPessoas;
                              });
                            },
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          Text("Gorjeta",
                            style: TextStyle(color: Colors.black,fontSize:16.0),
                          ),
                          Text("R\$${totalGorjeta.toStringAsFixed(2)}",
                              style: TextStyle(
                                color:Colors.grey,
                                fontSize: 18.0,
                          ))
                        ]
                      ),
                    ),
                    Column(
                      children: <Widget> [
                        Text("${porcentagemGarcom}%",
                        style: TextStyle(color: Colors.blue[900], fontSize: 18.0)),
                        Slider(value: porcentagemGarcom.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            porcentagemGarcom = value.toInt();
                            totalGorjeta = (porcentagemGarcom/100) * totalConta;
                            totalPessoa = (totalConta + totalGorjeta) / quantPessoas;
                          });
                        },
                          activeColor: Colors.blue[900],
                          max: 100,
                          min: 0,
                          divisions: 20
                        ),
                      ]
                    )
                    ],
                    ),
                  )], // box de baixo
                ),
              ),
            ),
          );
    }
}


class screenTwo extends StatefulWidget {
  int quantPessoas;
  double totalConta;

  screenTwo({this.quantPessoas,this.totalConta});

  @override
  _screenTwoState createState() => _screenTwoState(quantPessoas, totalConta);
}

class _screenTwoState extends State<screenTwo> {
  int quantBebintes = 1;
  double totalBebida = 0.0; // valor das bebidas a ser - da conta total
  double totalBase = 0.0; // valor pra quem n bebeu e valor a ser acrescido pra quem bebeu
  double contaBebinte = 0.0; // valor pra quem bebeu
  int quantPessoas;
  double totalConta;

  _screenTwoState(this.quantPessoas,this.totalConta);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("\$ RACHA CONTA"),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
                child: Container(
                  height: 120.0,
                  width: 600.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[350],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text("Total por pessoa",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("R\$0.0",
                            style: TextStyle (
                              fontSize: 25.0,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                ),
              ),// primeira box
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
                child: Container(
                  height: 120.0,
                  width: 600.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[350],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text("Total por bebinte",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("R\$0.0",
                            style: TextStyle (
                              fontSize: 25.0,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                ),
              ),  // segunda box
              Container (
                height: 300.0,
                margin: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                ),
                child: Column(
                  children: <Widget> [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                      child: TextField(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          prefixText: "Valor total das bebidas        ",
                          prefixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                        onChanged: (value) {
                          totalBebida = double.parse(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.people_outline),
                          prefixText: "Número de bebintes            ",
                          prefixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                        onChanged: (value) {
                          quantBebintes =  int.parse(value);
                        },
                      ),
                    ),
                    Padding (
                      padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
                      child: RaisedButton(
                        onPressed: () {
                          totalBase = (totalConta - totalBebida) / quantPessoas; // calculo preco base
                          contaBebinte = totalBase + (totalBebida/quantBebintes); // valor pra quem bebeu (preco base + divisao da bebida)
                        },
                        child: Text("CALCULAR",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0)),
                        color: Colors.blue[900],
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ), // terceira box
            ],
          ),
        ),
      ),
    );
  }
}
