import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';



class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late SharedPreferences logindata;
  late String username;
  @override
  void initState(){
    super.initState();
    initial();
  }

  void initial()async{
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(children: [
            Card(
              child: Column(children: [
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.network(
                        "https://scontent-xsp1-1.xx.fbcdn.net/v/t1.18169-9/19424375_10209325945925755_5888964374787516304_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=7f8c78&_nc_eui2=AeGwRXsfKUBB97-E2McUoT5e8MPeODUUYnDww944NRRicJdGoxiQ5BXtcCnxpZILRbQlDYEtwjHbTBRW8jzIwDL7&_nc_ohc=5fg1vFw3iXYAX-0KFYz&_nc_ht=scontent-xsp1-1.xx&oh=00_AfAx3759tu-4CbdpZxCAqiIVeMrxVO2PTP78YS6st7UO_Q&oe=6575B18D")),
                Text("Nama : Gilang Naufaldy"),
                Text("NIM : 124210035"),
                Text("Tempat dan Tanggal Lagir : Jakarta,21 September 2002,"),
                Text("Hobi : Mancing di Fishing Planet"),
              ]),
            ),
            FloatingActionButton(onPressed: (){
              logindata.setBool("logout", true);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context){
                    return LoginPage();
                  }));
            }, child: Text("Logout")),
          ]),
        ),
      ],

    );

  }
}
