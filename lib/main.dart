import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',            
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) /* the iterator begins at 0 and increments each time the function is called */ { 
        // called once per suggested word pairing, and places each suggestion into a ListTile row
        if (i.isOdd) return Divider(); // for every odd iteration a divider is added instead of a ListTile/list item
        // add a one-pixel-high divider widget before each row in the ListView (for odd rows)

        final index = i ~/ 2; // divides i by 2 and returns an integer result => calculates the actual number of word pairings in the ListView
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); // if the end of the available word pairings is reached, then generate 10 more and add them to the suggestions list => infinite list
        }
        return _buildRow(_suggestions[index]);
      });
}

Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Startup Name Generator'),
    ),
    body: _buildSuggestions(),
  );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}