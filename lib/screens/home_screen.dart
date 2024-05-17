import 'package:flutter/material.dart';
import 'package:spends/screens/add_blance.dart';
import 'package:spends/screens/add_spends.dart';
import 'package:spends/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double balance = 0;
  List<Transaction> transactions = [];

  void addTransaction(Transaction transaction) {
    setState(() {
      if (transactions.length >= 5) {
        transactions = [];
        transactions.add(transaction);
      } else {
        transactions.add(transaction);
      }
    });
  }

  void numberSpends(String number) {
    final transaction =
        Transaction(amount: '-$number', date: DateTime.now(), color: false);
    addTransaction(transaction);
  }

  void numberBlance(String number) {
    final transaction =
        Transaction(amount: '+$number', date: DateTime.now(), color: true);
    addTransaction(transaction);
  }

  double updateBalance(double amount) {
    double newBalance = balance + amount;
    setState(() {
      balance = newBalance;
    });
    return newBalance;
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 19),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const ProfileScreen();
                },
              ));
            },
            child: const CircleAvatar(
              backgroundColor: Colors.deepOrangeAccent,
              child: Icon(
                Icons.person,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  balance == 0 ? '0' : '$balance',
                  style: const TextStyle(fontSize: 45),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'EGP',
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 110,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              AddBalance(updateBalance, numberBlance),
                        ),
                      );
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                SizedBox(
                  height: 50,
                  width: 110,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              AddSpends(updateBalance, numberSpends),
                        ),
                      );
                    },
                    child: const Text(
                      '\$',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Blance',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                Text(
                  'Add Spends',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Transaction History:',
              style: TextStyle(fontSize: 24),
            ),
            ListView.builder(
              itemCount: transactions.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                final reverseIndex = transactions.length - index - 1;
                final transaction = transactions[reverseIndex];
                return ListTile(
                  title: transaction.color!
                      ? Text(
                          '${transaction.amount} EGP',
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                          ),
                        )
                      : Text(
                          '${transaction.amount} EGP',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                          ),
                        ),
                  subtitle: Text(
                      '${transaction.date.year}-${transaction.date.month}-${transaction.date.day} time ${transaction.date.hour}:${transaction.date.minute}'),
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
          ]),
        ),
      ),
    );
  }
}

class Transaction {
  final String amount;
  final DateTime date;
  final bool? color;

  Transaction({required this.amount, required this.date, required this.color});
}
