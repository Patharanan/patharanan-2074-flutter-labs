import 'package:flutter/material.dart';

List<String> getListElements() {
  var items = List<String>.generate(30, (counter) => "Problem ${counter + 1}");
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        var indexIsOdd = index.isOdd;
        return ListTile(
            leading: const Icon(Icons.arrow_right),
            trailing: indexIsOdd ? const Icon(Icons.star) : null,
            title: Text(listItems[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(indexIsOdd
                      ? "Problem  ${index + 1} is my favorite"
                      : "Problem  ${index + 1}  is selected")));
              debugPrint(indexIsOdd
                  ? "Problem   ${index + 1}  is my favorite"
                  : "Problem  ${index + 1}  is selected");
            });
      });
  return listView;
}
