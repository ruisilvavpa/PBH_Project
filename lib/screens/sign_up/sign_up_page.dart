import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pbh_project/models/enums/type_account.dart';
import 'package:pbh_project/models/onboard_data.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Account _account = Account();

  @override
  Widget build(BuildContext context) {
    //variables
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final _users = ['Writter', 'User'];
    String? _selectedValue = 'Writter';
    Type _type = Type.user;

    _MyFormState() {
      _selectedValue = _users[0];
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(191, 229, 192, 1),
      body: Column(
        children: [
          //Image Container
          Container(
            width: w,
            height: h * 0.3,
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.08,
                ),
                const CircleAvatar(
                  backgroundColor: Color.fromRGBO(191, 229, 192, 1),
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/profile_icon.png'),
                ),
              ],
            ),
          ),
          //Text
          RichText(
            text: const TextSpan(
              text: 'Already have an account?',
              style: TextStyle(
                  color: Color.fromRGBO(87, 61, 28, 1),
                  fontFamily: 'Itim',
                  fontSize: 15),
              children: [
                TextSpan(
                    text: 'Sign in',
                    style: TextStyle(
                        color: Color.fromRGBO(138, 210, 224, 1),
                        fontFamily: 'Itim',
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Type of Account'),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: RadioListTile(
                  //contentPadding: EdgeInsets.zero,
                  title: const Text('Writter'),
                  value: Type.writter,
                  groupValue: _account.type,
                  onChanged: (value) => setState(() => _account.type = value),
                ),
              ),
              Flexible(
                flex: 1,
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('User'),
                  value: Type.user,
                  groupValue: _account.type,
                  onChanged: (value) => setState(() => _account.type = value),
                ),
              ),
            ],
          ),
          /*DropdownButton(
            value: _selectedValue,
            style: TextStyle(
              color: Color.fromRGBO(87, 61, 28, 1),
              fontWeight: FontWeight.bold,
            ),
            items: _users
                .map((e) => DropdownMenuItem(child: Text(e), value: e))
                .toList(),
            onChanged: (value) {
              setState(
                () {
                  _selectedValue = value as String;
                },
              );
            },
            icon: const Icon(
              Icons.arrow_drop_down_circle,
              color: Color.fromRGBO(87, 61, 28, 1),
            ),
            dropdownColor: Color.fromRGBO(191, 229, 192, 1),
            decoration: InputDecoration(
                labelText: 'Type of Account',
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  width: w * 0.5,
                ),),),
          ),*/
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Khepri',
                    color: Color.fromRGBO(87, 61, 28, 1),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //First TextField
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
                        hintText: 'Name',
                        prefixIcon: Icon(
                          Icons.mode_standby,
                          color: Color.fromRGBO(87, 61, 28, 1),
                        ),
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
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Khepri',
                    color: Color.fromRGBO(87, 61, 28, 1),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Second TextField
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
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(87, 61, 28, 1),
                        ),
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
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Khepri',
                    color: Color.fromRGBO(87, 61, 28, 1),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Third TextField
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
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color.fromRGBO(87, 61, 28, 1),
                        ),
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
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: w * 0.4,
            height: h * 0.07,
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
                'Sign Up',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Khepri',
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(87, 61, 28, 1),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: const TextSpan(
              text: 'Sign up using one of the following methods',
              style: TextStyle(
                  color: Color.fromRGBO(87, 61, 28, 1),
                  fontFamily: 'Itim',
                  fontSize: 15),
            ),
          ),

          Wrap(children: List<Widget>.generate(3, (index) => CircleAvatar()))
        ],
      ),
    );
  }
}
