import 'package:flutter/material.dart';
import '../widget/number_button.dart';

class AddSpends extends StatefulWidget {
  final Function(double) updateBalance;
  final Function(String) numberSpends;

  const AddSpends(this.updateBalance, this.numberSpends, {super.key});

  @override
  State<AddSpends> createState() => _AddSpendsState();
}

class _AddSpendsState extends State<AddSpends> {
  String number = '';

  void addToNumber(String digit) {
    setState(() {
      number += digit;
    });
  }

  void deleteDigit() {
    setState(() {
      if (number.length > 1) {
        number = number.substring(0, number.length - 1);
      } else {
        number = '';
      }
    });
  }

  void deductBalance() {
    double deduction = double.parse(number);
    if (deduction > 0 && deduction <= widget.updateBalance(0)) {
      Navigator.pop(context);
      widget.updateBalance(-deduction);
      widget.numberSpends(number);
    } else {
      setState(() {
        number = '';
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Error',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text('Deduction amount exceeds balance.'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                number == '' ? 'Add Spends' : number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 45,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '1',
                  ),
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '2',
                  ),
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '3',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '4',
                  ),
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '5',
                  ),
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '6',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '7',
                  ),
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '8',
                  ),
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '9',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '.',
                  ),
                  NumberButton(
                    onPressed: addToNumber,
                    digit: '0',
                  ),
                  SizedBox(
                    height: 105,
                    width: 105,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.deepOrangeAccent,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: deleteDigit,
                      child: const Icon(
                        Icons.backspace_outlined,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: number == '' ? () {} : deductBalance,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  child: const Text(
                    'Category',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
