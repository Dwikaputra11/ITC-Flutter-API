import 'package:flutter/material.dart';

class RecentWatch extends StatefulWidget {
  const RecentWatch({ Key? key }) : super(key: key);

  @override
  State<RecentWatch> createState() => _RecentWatchState();
}

class _RecentWatchState extends State<RecentWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Recent Watch")),
    );
  }
}