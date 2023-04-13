import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/icon-label.png",
                errorBuilder: (context, error, stackTrace) {
                  return const Text("Failed to load image");
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 12.0,
              ),
              child: Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: 'nama...',
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 12.0,
              ),
              child: Row(
                children: <Widget>[
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12.0),
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: const Text(
                      "lupa password?",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: 'password...',
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(dashboardRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF7300),
                  ),
                  child: const Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
