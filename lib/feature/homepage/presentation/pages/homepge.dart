import 'package:flutter/material.dart';
import 'package:real_estate_app/core/common/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstateVerifyAppBar(
        
      ),
    );
  }
}