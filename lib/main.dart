import 'package:flutter/material.dart';

class User {
  final String name;
  final int age;

  const User({required this.name, required this.age});
}

final List<User> users = [
  const User(name: 'Alice', age: 22),
  const User(name: 'Bob', age: 25),
  const User(name: 'Charlie', age: 20),
  const User(name: 'Diana', age: 23),
];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const UserListScreen(),
      '/user-detail': (context) => const UserDetailScreen(),
    },
  ));
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users List')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(child: Text(user.name[0])),
            title: Text(user.name),
            subtitle: Text('Age: ${user.age}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/user-detail',
                arguments: user,
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(title: Text('${user.name} Details')),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Text(user.name[0], style: const TextStyle(fontSize: 32)),
                ),
                const SizedBox(height: 20),
                Text(
                  'Name: ${user.name}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  'Age: ${user.age}',
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}