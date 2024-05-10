import 'package:flutter/material.dart';

class FutureBuilderLayout<T> extends StatelessWidget {
  const FutureBuilderLayout({
    Key? key,
    required this.future,
    required this.hasSnapshotBuilder, // Değişiklik: hasSnapshotBuilder olarak değiştirildi
    required this.waiting,
  }) : super(key: key);

  final Future<T> future;
  final Widget waiting;
  final Widget Function(T data)
      hasSnapshotBuilder; // Değişiklik: hasSnapshotBuilder tipi güncellendi
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
          // Değişiklik: hasSnapshotBuilder kullanılarak snapshot verisine göre widget oluşturuluyor
          return hasSnapshotBuilder(snapshot.data as T);
        }
      },
    );
  }
}
