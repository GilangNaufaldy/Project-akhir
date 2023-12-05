
import '../halaman/stadium.dart';
import 'package:flutter/material.dart';
import '../Models/team_model.dart';
import '../base_network.dart';
import '../halaman/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    HomePage(),

  ];

  final SportsApiClient sportsApiClient =
  SportsApiClient();
  late List<Teams> teams;

  @override
  void initState() {
    super.initState();
    fetchData(); // Call the method to fetch data when the page is initialized
  }

  Future<void> fetchData() async {
    try {
      final data = await sportsApiClient.fetchData();
      final teamModel =
      TeamModel.fromJson(data); // Assuming you have a TeamModel model class

      setState(() {
        teams = teamModel.teams ?? [];
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error, show a message to the user, or retry the request
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Text(
          'China Teams',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[600],
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, index) {
              var team = teams[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(teams: team)));
                },
                child: Container(
                  height: 70,
                  child: ListTile(
                      leading: Image.network(
                        team.strTeamBadge!,
                        height: 70,
                        width: 50,
                      ),
                      title: Text(
                        '${team.strTeam}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]
                        ),
                      ),
                      subtitle: Text(
                          '${team.strAlternate}'
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Stadium(teams: team)));
                        },
                        icon: Icon(Icons.stadium_outlined),
                      )
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}