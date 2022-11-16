import 'package:counter_7/budget.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  int nominal = 0;
  String jenisBudget = 'Pemasukan';
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Budget'),
      ),
      drawer: AppDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Judul",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      judul = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      judul = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nominal",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      if (int.tryParse(value!) != null) {
                        nominal = int.parse(value);
                      }
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      if (int.tryParse(value!) != null) {
                        nominal = int.parse(value);
                      }
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal tidak boleh kosong!';
                    } else if (int.tryParse(value) == null) {
                      return 'Nominal harus berupa angka!';
                    }
                    return null;
                  },
                ),
                DropdownButton(
                  value: jenisBudget,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: listJenis.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      jenisBudget = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Budget.saveBudget(Budget(judul, nominal, jenisBudget));

                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 15,
                        child: Container(
                          child: ListView(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            shrinkWrap: true,
                            children: <Widget>[
                              Center(
                                child: Column(
                                  children: [
                                    const Text('Data Budget berhasil disimpan'),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              // TODO: Munculkan informasi yang didapat dari form
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Kembali'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
