import 'package:flutter/material.dart';
import "package:first_app/app.call_api/call_api.dart";

class Anonymous extends StatefulWidget {
  const Anonymous({super.key});

  @override
  State<Anonymous> createState() => _AnonymousState();
}

class _AnonymousState extends State<Anonymous> {
  late Future<List> _posts;

  @override
  void initState() {
    super.initState();
    _posts = Posts.getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
      ),
      body: FutureBuilder<List>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]['title']),
                  subtitle: Text(snapshot.data![index]['body']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      )
    );
  }
}