import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CalcHomePage extends StatefulWidget {
  @override
  _CalcHomePageState createState() => _CalcHomePageState();
}

class _CalcHomePageState extends State<CalcHomePage> {
  int num1 = 0,num2 = 0,answer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calc"),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: t1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter the first number"
                ),
                onChanged: (value){
                  setState(() {
                    num1 = num.parse(value);
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: t2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter the second number"
                ),
                onChanged: (value){
                  setState(() {
                    num2 = num.parse(value);
                  });
                },
              ),
              SizedBox(height: 40.0),
              Text(answer != null ? '$answer' : ''),
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        add();
                      },
                      label: Text('Add'),
                      icon: Icon(Icons.add),
                      backgroundColor: Colors.pink,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        minus();
                      },
                      label: Text('Minus'),
                      icon: Icon(Icons.remove),
                      backgroundColor: Colors.pink,
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                child: Text('Reset'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    minimumSize: const Size(400.0, 40.0)
                ),
                onPressed: () {
                  setState(() {
                    num1 = 0;
                    num2 = 0;
                    answer = 0;

                    t1.clear();
                    t2.clear();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void add() {
    setState(() {
      answer = num1 + num2;
    });
  }

  void minus() {
    setState(() {
      answer = num1 - num2;
    });
  }
}

TextEditingController t1 = new TextEditingController();
TextEditingController t2 = new TextEditingController();
