import 'package:flutter/material.dart';
import '../res/layouts/main_layout.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: const Text('UnknownRoute'),
    );
  }
}
