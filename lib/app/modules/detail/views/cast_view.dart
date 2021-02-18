import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CastView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CastView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CastView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
