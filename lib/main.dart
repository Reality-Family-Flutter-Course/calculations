import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Рассчеты'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? dropdownValue;
  double? num1;
  double? num2;
  double? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(hintText: "Первое число"),
                          keyboardType: TextInputType.numberWithOptions(
                            signed: false,
                            decimal: true,
                          ),
                          onChanged: (String value) {
                            num1 = double.tryParse(value);
                          },
                        ),
                      ),
                      VerticalDivider(),
                      DropdownButton<String>(
                        value: dropdownValue,
                        items: ["+", "-"]
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            print(dropdownValue);
                          });
                        },
                      ),
                      VerticalDivider(),
                      Flexible(
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(hintText: "Второе число"),
                          keyboardType: TextInputType.numberWithOptions(
                            signed: false,
                            decimal: true,
                          ),
                          onChanged: (String value) {
                            num2 = double.tryParse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 20,
                  ),
                  Text("Результат:"),
                  Divider(
                    color: Colors.transparent,
                    height: 20,
                  ),
                  Text(result != null ? result!.toString() : "")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (dropdownValue == "+") {
                    result = (num1 ?? 0) + (num2 ?? 0);
                  } else if (dropdownValue == "-") {
                    result = (num1 ?? 0) - (num2 ?? 0);
                  }
                });
              },
              child: Text("Произвести операцию"),
            ),
          ),
        ],
      ),
    );
  }
}
