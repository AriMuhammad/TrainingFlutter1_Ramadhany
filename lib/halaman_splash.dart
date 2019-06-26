import 'package:flutter/material.dart';
import 'package:rama_flutter/main.dart';

import 'halaman_login.dart';

class Halaman_Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Activity'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('gambar/back.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Halaman_Login()));
              },
              child: Image.asset(
                'gambar/ig.png',
                height: 95,
                width: 95,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
