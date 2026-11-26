import 'package:flutter/material.dart';

import './jokes.dart';

Color appColor = Colors.green[300] as Color;
bool globalFavorite = false;

List<Jokes> data = dataJokes;

List<Widget> getLabel() {
  return data.map((d) => FavoriteCard(title: d.title, description: d.description)).toList();
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: SingleChildScrollView( child: Column(children: getLabel()))
      ),
    ));

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  const FavoriteCard({
    super.key,
    required this.title,
    required this.description
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {

  bool _isFavorite = false;

  void onFavoriteClick() {
    if (globalFavorite && _isFavorite) {
      globalFavorite = false;
      setState(() {
        _isFavorite = !_isFavorite;
      });
    } else if (!globalFavorite && !_isFavorite) {
      globalFavorite = true;
      setState(() {
        _isFavorite = !_isFavorite;
      });
    }
    
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                const Text('description')
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick,
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
