import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/budget.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: Budget.budgetList.map((budget) {
            return Card(
              child: ListTile(
                  title: Text(budget.judul),
                  subtitle: Text('${budget.nominal}'),
                  trailing: Text(budget.jenis)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
