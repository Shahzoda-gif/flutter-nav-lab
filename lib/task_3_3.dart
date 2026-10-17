import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;

  const Contact({
    required this.name,
    required this.phone,
    required this.email,
  });
}

final List<Contact> contacts = [
  const Contact(name: 'Alice Johnson', phone: '+1 555-0101', email: 'alice@example.com'),
  const Contact(name: 'Bob Smith', phone: '+1 555-0202', email: 'bob@example.com'),
  const Contact(name: 'Charlie Brown', phone: '+1 555-0303', email: 'charlie@example.com'),
  const Contact(name: 'Diana Prince', phone: '+1 555-0404', email: 'diana@example.com'),
  const Contact(name: 'Ethan Hunt', phone: '+1 555-0505', email: 'ethan@example.com'),
];

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ContactListScreen(),
  ));
}

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(contact.name[0]),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactScreen(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;

  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Text(
                      contact.name[0],
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    contact.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Divider(height: 32),
                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.blue),
                    title: const Text('Phone'),
                    subtitle: Text(contact.phone, style: const TextStyle(fontSize: 16)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.green),
                    title: const Text('Email'),
                    subtitle: Text(contact.email, style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}