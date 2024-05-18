import 'package:flutter/material.dart';
import 'package:spends/widget/action_button.dart';
import 'package:spends/widget/number_button.dart';

class AddBalance extends StatefulWidget {
  final void Function(double) updateBalance;
  final Function(String) numberBalance;
  const AddBalance(this.updateBalance, this.numberBalance, {super.key});

  @override
  State<AddBalance> createState() => _AddBalanceState();

  static of(BuildContext context) {}
}

class _AddBalanceState extends State<AddBalance> {
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

  void addBalance() {
    double newBalance = double.parse(number);
    widget.updateBalance(newBalance);
    widget.numberBalance(number);
    Navigator.pop(context);
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
              Text(
                number == '' ? 'Add Balance' : number,
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
              ElevButton(
                number == '' ? () {} : addBalance,
                'Add',
              )
            ],
          ),
        ),
      ),
    );
  }
}
