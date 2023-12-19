import 'package:flutter/material.dart';

class BasicListView extends StatelessWidget {
  const BasicListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        buildListTile(
          context,
          "Engineering",
          "EN",
          Icons.build,
          Icons.star,
        ),
        buildListTile(
          context,
          "Agriculture",
          "AG",
          Icons.eco,
          null,
        ),
        buildListTile(
            context, "Architecture", "AR", Icons.apartment_outlined, null),
      ],
    );
  }

  ListTile buildListTile(BuildContext context, String faculty,
      String shortFaculty, IconData leadingIcon, IconData? trailingIcon) {
    return ListTile(
      title: Text(faculty),
      leading: Icon(leadingIcon),
      trailing: Icon(trailingIcon),
      onTap: () {
        _showDialog(context, faculty, shortFaculty);
      },
    );
  }

  void _showDialog(BuildContext context, String faculty, String shortFaculty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(faculty),
          content: Text(shortFaculty),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, "OK");
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
