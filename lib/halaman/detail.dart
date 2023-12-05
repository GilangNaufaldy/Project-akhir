import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Models/team_model.dart';

class DetailPage extends StatelessWidget {
  late final Teams? teams;

  DetailPage({required this.teams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${teams?.strTeam}',
          style: TextStyle(
              color: Colors.grey[700],
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
            Image.network(
              '${teams?.strTeamBanner}',
              height: 85,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      '${teams?.strTeamBadge}',
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${teams?.strTeam} / ${teams?.strAlternate}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.grey[700]
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(CupertinoIcons.globe),
                          onPressed: () {
                            launcher('${teams?.strWebsite}');
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            launcher('${teams?.strInstagram}');
                          },
                          icon: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/2048px-Instagram_logo_2022.svg.png',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            launcher('${teams?.strTwitter}');
                          },
                          icon: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/512px-Logo_of_Twitter.svg.png',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            launcher('${teams?.strFacebook}');
                          },
                          icon: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/2048px-Facebook_f_logo_%282019%29.svg.png',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            launcher('${teams?.strYoutube}');
                          },
                          icon: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png?20220706172052',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                            'Formed Year',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold
                            )
                        ),
                        Text(
                            '${teams?.intFormedYear}',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.normal
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Text(
                            'Team Jersey',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold
                            )
                        ),
                        SizedBox(height: 5),
                        Image.network(
                          '${teams?.strTeamJersey}',
                          height: 200,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                            'Description',
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
