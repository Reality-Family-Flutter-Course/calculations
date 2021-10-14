import 'package:calculations/domain/Calculations.dart';
import 'package:calculations/domain/operation.dart';
import 'package:calculations/presentation/Factories/Controller.dart';
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
  Operation? dropdownValue;
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
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
                        child: UIController.getFabric()!.getTextField(
                          controller: num1,
                          hintText: "Первое число",
                        ),
                      ),
                      VerticalDivider(),
                      UIController.getFabric()!.getDropdown<Operation>(
                        items: Calculations.getOperations()
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value.shortName()),
                                ))
                            .toList(),
                        callBack: (value) => dropdownValue = value,
                      ),
                      VerticalDivider(),
                      Flexible(
                        child: UIController.getFabric()!.getTextField(
                          controller: num2,
                          hintText: "Второе число",
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
          UIController.getFabric()!.getButton(
            title: "Произвести операцию",
            callBack: () {
              setState(() {
                if (dropdownValue != null) {
                  result = dropdownValue!.operation(
                    double.tryParse(num1.text),
                    double.tryParse(num2.text),
                  );
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
