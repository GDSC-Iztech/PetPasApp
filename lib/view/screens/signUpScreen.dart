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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Üye Ol'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40), // Ekranın üst kısmında boşluk
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
              SizedBox(height: 20),
              SizedBox(
                height: 50, // Kutucukların dikey boyutu
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'E-mail alanı boş bırakılamaz';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50, // Kutucukların dikey boyutu
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'İsim',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'İsim alanı boş bırakılamaz';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50, // Kutucukların dikey boyutu
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Telefon',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Telefon alanı boş bırakılamaz';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50, // Kutucukların dikey boyutu
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Şifre alanı boş bırakılamaz';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
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
                    onPressed: () {
                      //todo: üye olma işlemi
                      context.go('/profile');
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
