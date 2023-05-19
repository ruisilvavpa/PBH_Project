import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(191, 229, 192, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: w * 0.2,
                  height: h * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/loginbtn.png',
                      ),
                      //fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Guest Mode',
                      style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Khepri',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: w * 0.8,
            height: h * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/mainlogo.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Khepri',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Sign into your account',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Khepri',
                      color: Colors.grey[500]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'Forgot your Password?',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Itim',
                          color: Colors.grey[500]),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: w * 0.5,
            height: h * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/loginbtn.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Text(
                'Sign in',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Khepri',
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: w * 0.2,
          ),
          RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontFamily: 'Itim',
                      fontSize: 20),
                  children: const [
                TextSpan(
                    text: 'Create',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Itim',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ]))
        ],
      ),
    );
  }
}
