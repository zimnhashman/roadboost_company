import 'package:flutter/material.dart';

class Accept extends StatelessWidget {
  const Accept({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Accepted'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
            child: Container(
                child: Text(
                    'You have accepted request to attend to Car breakdown at shown Location.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, backgroundColor: Colors.redAccent),))),
      ),
    );
  }
}
