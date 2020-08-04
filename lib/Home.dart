import 'package:flutter/material.dart';
import 'telas/TelaEmAlta.dart';
import 'telas/TelaInscricoes.dart';
import 'Account.dart';
import 'Search.dart';
import 'telas/TelaBiblioteca.dart';
import 'telas/TelaInicio.dart';
import 'VideoCam.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _index = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    @override
    List<Widget> telas = [
      TelaInicio(_resultado ),
      TelaEmAlta(),
      TelaInscricoes(),
      TelaBiblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          height: 85,
          width: 85,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.videocam,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => VideoCam(),
            )),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () async {
              String digitado = await showSearch(context: context, delegate: Search());
              setState(() {
                _resultado = digitado;
              });
            }
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => Account(),
            )),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (indice){
          setState(() {
            _index = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text(
              "Início"
            ),
            icon: Icon(
              Icons.home,
            )
          ),
          BottomNavigationBarItem(
          title: Text(
          "Em Alta"
          ),
            icon: Icon(
              Icons.whatshot
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Inscrições"
            ),
            icon: Icon(
              Icons.subscriptions
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Biblioteca"
            ),
            icon: Icon(
              Icons.folder
            )
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_index],
      )
    );
  }
}
