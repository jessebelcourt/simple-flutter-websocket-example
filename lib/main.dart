import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Websocket Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _initWebsocket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Websocket Demo"),
      ),
      body: Center(
        child: Text('yoooo'),
      ),
    );
  }

  void _initWebsocket() async {
    final IOWebSocketChannel channel = await IOWebSocketChannel.connect("ws://localhost:40510");
    channel.sink.add('Connected from Flutter!');
    
    channel.stream.listen((message) {
      channel.sink.add("Message recieved from Flutter!");
      print('message: $message');
    });


  }
}
