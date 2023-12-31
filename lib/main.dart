import 'package:demo_mqtt/MqttHandler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;
  MqttHandler mqttHandler = MqttHandler();

  @override
  void initState() {
    super.initState();
    mqttHandler.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MQTT Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Data received:',
                style: TextStyle(color: Colors.black, fontSize: 25)),
            ValueListenableBuilder<String>(
              builder: (BuildContext context, String value, Widget? child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: Text('$value',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent, fontSize: 35)),
                    )
                  ],
                );
              },
              valueListenable: mqttHandler.data,
            )
          ],
        ),
      ),

    );
  }
}