/* import 'package:flutter/material.dart';

class BasicListView extends StatelessWidget {
  const BasicListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        const ListTile(
          title: Text("Engineering"),
          leading: Icon(Icons.people_alt),
        ),
        const ListTile(
          title: Text("Agriculture"),
          leading: Icon(Icons.people_outline_outlined),
          onTap: () => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("data"))),
        )
      ],
    );
  }
}
 */