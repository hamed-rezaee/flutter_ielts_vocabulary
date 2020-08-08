import 'package:flutter/material.dart';

Future<bool> showAlertDialog(BuildContext context) => showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Are you sure?'),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
