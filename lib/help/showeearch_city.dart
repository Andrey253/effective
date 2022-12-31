import 'package:flutter/material.dart';

List<String> list = const ['Moskow', 'Tomsk', 'Novosibirsk'];

class SearchCity extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) close(context, null);
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return TextButton.icon(
        onPressed: () => query = 'refactor',
        icon: const Icon(Icons.home),
        label: const Text('refactor'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(children: [
      ...list.where((element) => element.contains(query)).map(
          (e) => TextButton(onPressed: () => close(context, e), child: Text(e)))
    ]);
  }
}
