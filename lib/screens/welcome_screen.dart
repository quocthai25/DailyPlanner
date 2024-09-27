import 'package:flutter/material.dart';
import 'package:thuctap/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffB81736),
              Color(0xff281537),
            ],
          ),
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 200.0),
            child: ClipOval(
              child: Image.asset(
                'assets/logo.jpg',
                width: 100,
                height: 100,
                fit:
                    BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'Daily Planner',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Text(
                  'Đăng nhập',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            //  onTap: (){
            //    Navigator.push(context,
            //        MaterialPageRoute(builder: (context) => const RegScreen()));
            //  },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Text(
                  'Đăng kí',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          const Spacer(),
          //  const Text('Login with Social Media',style: TextStyle(
          //      fontSize: 17,
          //      color: Colors.white
          //  ),),
          // const SizedBox(height: 12,),
          //  const Image(image: AssetImage('assets/social.png'))
        ]),
      ),
    );
  }
}
