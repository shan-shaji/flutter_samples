import 'package:flutter/material.dart';
import './item_fetcher.dart';
import 'package:english_words/english_words.dart';

class ListScreen extends StatefulWidget {

  @override
  _ListScreenState createState() => _ListScreenState();
}

class ListScreenState extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _pairList = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _itemFetcher = ItemFetcher();

  bool _isLoading = true;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _hasMore = true;
    _loadMore();
  }

  void _loadMore() {
    _isLoading = true;
    _itemFetcher.fetch().then((List<WordPair> fetchedList) {
      if (fetchedList.isEmpty) {
        setState(() {
          _isLoading = false;
          _hasMore = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _pairList.addAll(fetchedList);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_pairList.length);
    return Scaffold(
      body: ListView.builder(
        // Need to display a loading tile if more items are coming
        itemCount: _hasMore ? _pairList.length + 1 : _pairList.length,
        itemBuilder: (BuildContext context, int index) {
          // Uncomment the following line to see in real time how ListView.builder works
          // print('ListView.builder is building index $index');
          if (index >= _pairList.length) {
            if (!_isLoading) {
              _loadMore();
            }
            return Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                height: 24,
                width: 24,
              ),
            );
          }
          return ListTile(
            leading: Text(index.toString(), style: _biggerFont),
            title: Text(_pairList[index].asPascalCase, style: _biggerFont),
          );
        },
      ),
    );
  }
}
