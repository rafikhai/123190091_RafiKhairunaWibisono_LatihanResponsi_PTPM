import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latihan_responsi/controller/user_data_store.dart';
import 'package:latihan_responsi/model/users.dart';

class ProfilePage extends StatefulWidget {
  final String text;

  const ProfilePage({Key? key, required this.text}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body: Container(
        child: FutureBuilder(
          future: UserDataSource.instance.loadUsers(widget.text),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Users github = Users.fromJson(snapshot.data);
              return _buildSuccessSection(github);
            }
            return _buildLoadingSection();
          },
        ),
      ),
    );
  }
}

// Jika API sedang dipanggil
Widget _buildLoadingSection() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget _buildErrorSection() {
  return Text("Error");
}

// Jika data ada
Widget _buildSuccessSection(Users data) {
  return Container(
    child: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Text("Username"),
          TextButton(
            onPressed: () {}, // Respon ketika button ditekan
            child: Text("${data.login}"),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text("Jumlah Repositori"),
          TextButton(
            onPressed: () {}, // Respon ketika button ditekan
            child: Text("${data.publicRepos}"),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text("Jumlah Follower"),
          TextButton(
            onPressed: () {}, // Respon ketika button ditekan
            child: Text("${data.followers}"),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text("Jumlah Following"),
          TextButton(
            onPressed: () {}, // Respon ketika button ditekan
            child: Text("${data.following}"),
          ),
        ],
      ),
    ),
  );
}
