import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1506744038136-46273834b3fb'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome User',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Email: ${ref.read(authenticationProvider).auth.currentUser!.email}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 32.0),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                ref.read(authenticationProvider).signOut();
              },
              textColor: Colors.blue.shade700,
              textTheme: ButtonTextTheme.primary,
              minWidth: 100,
              padding: const EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: Colors.blue.shade700),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
