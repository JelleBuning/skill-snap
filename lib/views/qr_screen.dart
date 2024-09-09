import 'package:flutter/material.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Icon(
          Icons.qr_code_2_rounded,
          size: 250,
        ),
      ),
    );
  }
}
