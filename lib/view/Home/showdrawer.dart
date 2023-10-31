import 'package:flutter/material.dart';

class Showdrawers extends StatefulWidget {
  const Showdrawers({super.key});

  @override
  State<Showdrawers> createState() => _ShowdrawersState();
}

class _ShowdrawersState extends State<Showdrawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerHeader(child: Text("hey")),
    );
  }
}
