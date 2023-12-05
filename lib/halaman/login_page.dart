import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_final/halaman/halaman_utama.dart';
import 'package:ta_final/halaman/profile.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  void initState(){
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login()async{
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool("login")?? true);
    print(newuser);
    if(newuser == false){
      Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context){
        return Profile();
      }));
    }
  }

  @override
  void dispose(){
    _username.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("login"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _username,
                decoration: InputDecoration(label: Text("username")),),
              TextField(
                controller: _password,
                decoration: InputDecoration(label: Text("password")),
              obscureText: true,),
              SizedBox(height: 20,),
              OutlinedButton(onPressed: (){
                String username = _username.text;
                String password = _password.text;

                if(username == "flutter" && password == "123"){
                  logindata.setBool("login", false);
                  logindata.setString("username", username);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                    return HalamanUtama();
                  }));
                }
              }, child: Text("login berhasil"))
            ],
          ),
        ),
      ),
    );
  }
}
