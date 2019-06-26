import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import 'halaman_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: Halaman_Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      Toast.show(_counter.toString(), context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset('gambar/ig.png', width: 100, height: 100),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('Welcome To MuTV App',
                    style: TextStyle(
                      fontSize: 25,
                    )),
              ),
              Text('sign in to continue',
                  style: TextStyle(fontSize: 15, color: Colors.lightBlue)),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'E-mail',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'yourname@gmail.com'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: InputDecoration(hintText: '********'),
                  obscureText: true,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'forgot password?',
                  style: TextStyle(fontSize: 16, color: Colors.lightBlue),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void tampilAlert() {
    showDialog(
        context: context,
        builder: (BuildContext c) {
          return RaisedButton(
            onPressed: () {
              return AlertDialog(
                title: Text('Informasi'),
                content: Text('apakah anda ingin keluar?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('iya'),
                    onPressed: () {
                      //back to prev stack
                      //Navigator.pop(context);
                      //exit application
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                  ),
                  FlatButton(
                    child: Text('tidak'),
                    onPressed: () {},
                  ),
                ],
              );
            },
          );
        });
  }
}
