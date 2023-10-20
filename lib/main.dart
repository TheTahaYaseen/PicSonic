import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PicSonic());
}

class PicSonic extends StatelessWidget {
  const PicSonic({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PicSonicState(),
      child: MaterialApp(
        title: 'PicSonic',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ToDosView(title: 'PicSonic'),
      ),
    );
  }
}

class PicSonicState extends ChangeNotifier {
  List todos = [];

  void addTodo(todoGiven) {
    todos.add(todoGiven);
    notifyListeners();
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
    var appState = context.watch<PicSonicState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A0554),
        foregroundColor: Colors.white,
        title: const Text("Your ToDos"),
        leading: const Icon(Icons.check_circle_outline_rounded),
      ),
      body: Column(
        children: [ToDoInput(), const ToDoList()],
      ),
    );
  }
}

class ToDoInput extends StatelessWidget {
  ToDoInput({super.key});
  final TextEditingController _toDoInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PicSonicState>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Your Todo",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              style: const TextStyle(
                color: Color(0xFF0C0B13),
                fontSize: 16,
              ),
              controller: _toDoInputController,
            ),
          ),
          IconButton(
              onPressed: () {
                String todoGiven = _toDoInputController.text;
                appState.addTodo(todoGiven);
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PicSonicState>();
    var todos = appState.todos;

    return Expanded(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Text(todos[index]);
        },
      ),
    );
  }
}
