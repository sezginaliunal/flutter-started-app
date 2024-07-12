import 'package:flutter/material.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bu sayfa bulunamadı'),
      ),
    );
  }
}
