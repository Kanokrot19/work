import 'package:flutter/material.dart';

class Registrationform extends StatefulWidget {
  const Registrationform({super.key});

  @override
  State<Registrationform> createState() => _RegistrationformState();
}

class _RegistrationformState extends State<Registrationform> {
  final _formKey = GlobalKey<FormState>();
  String? _gender = 'Female';
  String? _selectedItem;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form (650710666)"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15,),
                Text("Gender"),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: Text('Male'),
                        value: 'Male',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Text('Female'),
                        value: 'Female',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Province'),
                  value: _selectedItem,
                  items: ['Bangkok', 'Chiang Mai', 'Phuket', 'Khon Kaen']
                      .map((item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (value) {
                    _selectedItem = value;
                  },
                  validator: (value) =>
                      value == null ? 'Please select an option' : null,
                ),
                 SizedBox(height: 15,),
                CheckboxListTile(
                  title: const Text('Accept Terms & Conditions'),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                 SizedBox(height: 20,),
                Center(child: ElevatedButton(onPressed: () {}, child: Text("Submit")),),
              ],
            )),
      ),
    );
  }
}
