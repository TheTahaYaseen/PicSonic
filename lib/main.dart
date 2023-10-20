import 'package:flutter/material.dart';

void main() {
  runApp(const PicSonic());
}

class PicSonic extends StatelessWidget {
  const PicSonic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PicSonic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ToDosView(title: 'PicSonic'),
    );
  }
}

class ToDosView extends StatefulWidget {
  const ToDosView({super.key, required this.title});

  final String title;

  @override
  State<ToDosView> createState() => _ToDosViewState();
}

class _ToDosViewState extends State<ToDosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
