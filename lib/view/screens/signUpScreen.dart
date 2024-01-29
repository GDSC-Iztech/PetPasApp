import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firebase = FirebaseAuth.instance;
  String _enteredEmail = "";
  String _enteredPassword = "";
  String _enteredName = "";
  String _enteredPhone = "";

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Üye Ol'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 40), // Ekranın üst kısmında boşluk
                Center(
                  child: Text(
                    'PetPas\'a Hoşgeldiniz',
                    style: TextStyle(
                      color: HexColor("#53A9C6"),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50, // Kutucukların dikey boyutu
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !value.contains("@")) {
                        return 'Lütfen geçerli bir email giriniz.';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _enteredEmail = newValue!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50, // Kutucukların dikey boyutu
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'İsim',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'İsim alanı boş bırakılamaz';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _enteredName = newValue!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50, // Kutucukların dikey boyutu
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Telefon',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Telefon alanı boş bırakılamaz';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _enteredPhone = newValue!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50, // Kutucukların dikey boyutu
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Şifre',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().length < 6) {
                        return 'Parola en az 6 haneli olmalı.';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _enteredPassword = newValue!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 50, // Üye Ol butonunun dikey boyutu
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: HexColor("#53A9C6"),
                      ),
                      onPressed: () async {
                        //todo: üye olma işlemi
                        try {
                          _submit();
                          final UserCredentials =
                              await _firebase.createUserWithEmailAndPassword(
                                  email: _enteredEmail,
                                  password: _enteredPassword);
                          print(UserCredentials);
                          context.go('/profile');
                        } on FirebaseAuthException catch (error) {
                          ScaffoldMessenger.of(context).clearSnackBars();

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  error.message ?? "Authentication Failed")));
                        }
                      },
                      child: const Text(
                        'Üye Ol',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white, // Giriş Yap yazısını beyaz yapar
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
