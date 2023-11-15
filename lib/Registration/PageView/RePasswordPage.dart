import 'package:flutter/material.dart';
import 'package:mychats/ThemeMyApp/CustomTheme.dart';
import 'package:mychats/ThemeMyApp/config.dart';

class RePasswordPage extends StatefulWidget {
  final TextEditingController nameController;
  const RePasswordPage({super.key, required this.nameController});

  @override
  State<RePasswordPage> createState() => _RePasswordPageState();
}

class _RePasswordPageState extends State<RePasswordPage> {
 bool _obscureText = true;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Пожалуйста,\nповторите пароль',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextFormField(
                controller: widget.nameController,
                obscureText: _obscureText,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
                maxLines: 1,
                style: TextStyle(
                  color: Colors.grey,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  if (value.length < 8) {
                    return 'Пароль должен быть длиннее 8 символов';
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Пароль должен содержать хотя бы одну заглавную букву';
                  }
                  if (RegExp(r'[^a-zA-Z0-9]').hasMatch(value)) {
                    return 'Пароль не должен содержать недопустимые символы';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10),
            _password.isNotEmpty && _passwordValidator(_password)
                ? Text(
                    'Пароли совпадают',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  )
                : Text(
                    'Пароли не совпадают',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.1),
           
          ],
        ),
      ),
    );
  }

  bool _passwordValidator(String password) {
    return password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        !RegExp(r'[^a-zA-Z0-9]').hasMatch(password);
  }
}