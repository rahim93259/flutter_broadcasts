import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BroadcastReceiver receiver = BroadcastReceiver(
    names: <String>[
      "android.net.conn.CONNECTIVITY_CHANGE",
    ],
  );

  @override
  void initState() {
    super.initState();
    receiver.start();
    receiver.messages.listen((data){
      print(data);
    });
  }

  @override
  void dispose() {
    receiver.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Broadcasts Demo'),
        ),
        body: Column(
          children: [
            TextButton(
              child: Text('Send Broadcast'),
              onPressed: () {

              },
            ),

          ],
        ),
      ),
    );
  }
}
