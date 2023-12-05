import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Models/team_model.dart';
import 'package:intl/intl.dart';

class Stadium extends StatelessWidget {
  final NumberFormat numberFormatter = NumberFormat('#,##0');
  late final Teams? teams;

  Stadium({required this.teams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${teams?.strStadium}',
          style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                '${teams?.strStadiumThumb}',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                            'Stadium Location',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(
                            '${teams?.strStadiumLocation}',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.normal
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                            'Stadium Capacity',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(
                            '${teams?.intStadiumCapacity}',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.normal
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                            'Stadium Description',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(
                          '${teams?.strDescriptionEN}',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.normal
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> launcher(String url) async {
    final Uri _url = Uri.parse(url.startsWith('http') ? url : 'https://$url');
    if (!await launchUrl(_url)) {
      throw Exception("Failed to launch URL: $_url");
    }
  }
}