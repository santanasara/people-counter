import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de pessoas",
      home: Home(),
      debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= 20) {
        _mensagem = "Lotado, não pode entrar.";
        _pessoa = 20;
      } else if (_pessoa < 20 && _pessoa >= 0) {
        _mensagem = "Pode entrar!";
      } else {
        _pessoa = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Material(
        child: Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg", fit: BoxFit.cover, height: 1000),
        Column(
            children: [
              Row(
                children: [
                  Text(
                    "Nº de pessoas: $_pessoa",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 60),
                      child: Container(
                          width: 100,
                          color: Colors.green,
                          child: IconButton(
                              onPressed: () {
                                _changePeople(1);
                              },
                              icon: Icon(Icons.arrow_upward_rounded),
                              color: Colors.white))),
                  Container(
                      width: 100,
                      color: Colors.red,
                      child: IconButton(
                          onPressed: () {
                            _changePeople(-1);
                          },
                          icon: Icon(Icons.arrow_downward_rounded),
                          color: Colors.white))
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 40),
              Text(
                _mensagem,
                style: TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center)
      ],
    ));
  }
}
