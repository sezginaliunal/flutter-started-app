import 'package:flutter/material.dart';

class FutureBuilderLayout<T> extends StatelessWidget {
  const FutureBuilderLayout(
      {Key? key,
      required this.future,
      required this.hasSnapshot,
      required this.waiting})
      : super(key: key);

  final Future<T> future;
  final Widget hasSnapshot;
  final Widget waiting;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waiting;
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return hasSnapshot;
        }
      },
    );
  }
}
