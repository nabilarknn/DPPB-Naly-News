// import 'package:cobadppb3/kategori.dart';
import 'package:cobadppb3/berita.dart';
import 'package:cobadppb3/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Image(
              image: AssetImage("images/logo.png"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Masuk Ke Naly News",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Fredoka",
                color: Color(0xff9B1768),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Masukkan Username Anda..",
                labelText: "Username",
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'gaboleh kosong ';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Masukkan Password Anda",
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              controller: passController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'dibilang gaboleh kosong';
                }
                return null;
              },
              obscureText: true,
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff9B1768)),
              child: const Text('Login',
                  style: TextStyle(
                      fontFamily: "Fredoka",
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20)),
              onPressed: () {
                List<String> formData = [];

                String kirim1 = emailController.text;
                String kirim2 = passController.text;

                if (kirim1.isEmpty || kirim2.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Lengkapi Form di Atas!'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                          // Add your action callback here
                        },
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }

                formData.add(kirim1);
                formData.add(kirim2);
              },
            ),
          )
        ],
      ),
    );
  }
}
