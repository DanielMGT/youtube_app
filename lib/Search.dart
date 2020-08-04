import 'package:flutter/material.dart';

class Search extends SearchDelegate<String>{

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Icon(
              Icons.clear
          ),
          onPressed: (){
            query = "";
          },
        )
      ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.grey,
      ),
      onPressed: (){
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> lista = List();

    if(query.isNotEmpty){
      lista = [
        "Snap Out of It", "Do i wanna know", "Arabella"
      ].where((texto) => texto.toLowerCase().startsWith(query)).toList();
    }
    else {
      Center(
        child: Text(
          "Nenhum item corresponde para pesquisa!"
        ),
      );
    }

    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              close(context, lista[index]);
            },
            title: Text(
              lista[index],
              style: TextStyle(
                color: Colors.grey
              ),
            ),
          );
        });
  }


}