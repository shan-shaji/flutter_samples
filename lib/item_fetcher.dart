import 'dart:math';

import 'package:english_words/english_words.dart';

class ItemFetcher {
  final _count = 103;
  final _itemsPerPage = 5;
  int _currentPage = 0;

  // This async function simulates fetching results from Internet, etc.
  Future<List<WordPair>> fetch() async {
    final list = <WordPair>[];
    final n = min(_itemsPerPage, _count - _currentPage * _itemsPerPage);
    // Uncomment the following line to see in real time now items are loaded lazily.
    // print('Now on page $_currentPage');
    await Future.delayed(Duration(seconds: 1), () {
      for (int i = 0; i < n; i++) {
        list.add(WordPair.random());
      }
    });
    _currentPage++;
    return list;
  }
}
