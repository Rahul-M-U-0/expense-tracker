// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assessment_application_1/models/expense_model.dart';
import 'package:assessment_application_1/models/income_model.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({
    super.key,
    required this.registeredExpense,
    required this.registeredIncome,
  });

  final List<Expense> registeredExpense;
  final List<Income> registeredIncome;

  Map<String, double> expenses = {};
  Map<String, double> incomes = {};

  void addExpense(String key, double quantity) {
    if (expenses.containsKey(key)) {
      // item exists: update it
      expenses[key] = quantity + expenses[key]!;
    } else {
      // item does not exist: set it
      expenses[key] = quantity;
    }
  }

  void addIncomes(String key, double quantity) {
    if (incomes.containsKey(key)) {
      // item exists: update it
      incomes[key] = quantity + incomes[key]!;
    } else {
      // item does not exist: set it
      incomes[key] = quantity;
    }
  }

  double calculateSum(Map<String, double> map) {
    double sum = 0;
    for (var value in map.values) {
      sum += value;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    for (Expense expense in registeredExpense) {
      addExpense(expense.category.name, expense.amount);
    }
    for (Income income in registeredIncome) {
      addIncomes(income.category.name, income.amount);
    }
    print(registeredExpense);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expense",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: expenses.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.key,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  entry.value.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            calculateSum(expenses).toString(),
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Income",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: incomes.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.key,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  entry.value.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            calculateSum(incomes).toString(),
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
