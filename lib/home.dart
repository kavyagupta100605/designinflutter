import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formGlobalKey = GlobalKey<FormState>();
  Priority _selectedpriority = Priority.low;
  String _title = "";
  String _description = "";

  final List<ToDo> todos = [
    const ToDo(
      title: 'Buy Milk',
      description: 'There is no milk left in the fridge',
      priority: Priority.high,
    ),
    const ToDo(
      title: 'Buy Milk',
      description: 'There is no milk left in the fridge',
      priority: Priority.low,
    ),
    const ToDo(
      title: 'Buy Milk',
      description: 'There is no milk left in the fridge',
      priority: Priority.medium,
    ),
    const ToDo(
      title: 'Buy Milk',
      description: 'There is no milk left in the fridge',
      priority: Priority.urgent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: TodoList(todos: todos)),
            Form(
              key: _formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //ToDo title
                  TextFormField(
                    maxLength: 20,
                    decoration: InputDecoration(label: Text('ToDo Title')),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "You must enter a value for the title";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _title = value!;
                    },
                  ),

                  //ToDo Description
                  TextFormField(
                    maxLength: 40,
                    decoration: InputDecoration(label: Text('ToDo Title')),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 5) {
                        return "Enter a description of atleast 5 characters";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value!;
                    },
                  ),

                  //ToDo Priority
                  DropdownButtonFormField(
                    value: _selectedpriority,
                    decoration: const InputDecoration(
                      label: Text("Priority of ToDo"),
                    ),
                    items: Priority.values.map((p) {
                      return DropdownMenuItem(value: p, child: Text(p.title));
                    }).toList(),
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        _selectedpriority = value!;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  FilledButton(
                    onPressed: () {
                      if (_formGlobalKey.currentState!.validate()) {
                        _formGlobalKey.currentState!.save();
                        setState(() {
                          todos.add(
                            ToDo(
                              title: _title,
                              description: _description,
                              priority: _selectedpriority,
                            ),
                          );
                        });
                        _formGlobalKey.currentState!.reset();
                        _selectedpriority = Priority.low;
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text("Add"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
