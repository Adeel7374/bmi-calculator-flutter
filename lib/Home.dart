import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var weightController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";
  var bgColor = Colors.black26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          'Your BMI',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextField(
                  controller: weightController,
                  decoration: const InputDecoration(
                      label: Text('Enter your weight (in KGs)'),
                      prefixIcon: Icon(Icons.line_weight),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                      label: Text('Enter your height (in feet)'),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inchController,
                  decoration: const InputDecoration(
                    label: Text('Enter your height (in inchs)'),
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo),
                    onPressed: () {
                      var weight = weightController.text.toString();
                      var feet = ftController.text.toString();
                      var inch = inchController.text.toString();

                      if (weight != "" && feet != "" && inch != "") {
                        //BMI Calculations
                        var iWeight = int.parse(weight);

                        var ifeet = int.parse(feet);

                        var iinch = int.parse(inch);

                        var totalinch = (ifeet * 12) + iinch;

                        var totalCm = totalinch * 2.54;

                        var totalMeter = totalCm / 100;

                        var bmi = iWeight / (totalMeter * totalMeter);

                        var msg = "";

                        if (bmi > 25) {
                          msg = "You are OverWeight";
                          bgColor = Colors.orangeAccent;
                        } else if (bmi < 18) {
                          msg = "You are UnderWeight";
                          bgColor = Colors.deepOrange;
                        } else {
                          msg = "You are healthy";
                          bgColor = Colors.green.shade200;
                        }

                        setState(() {
                          result =
                              "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all required blanks";
                        });
                      }
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 20.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
