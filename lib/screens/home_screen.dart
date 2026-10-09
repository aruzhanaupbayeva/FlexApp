
import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/workout_card.dart';
import 'workout_details_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<String> favorites = {};

  final List<Map<String, dynamic>> workouts = [
    {
      'name': 'Yoga',
      'description': 'Flexibility & balance',
      'duration': '45 min',
      'level': 'Beginner',
      'icon': Icons.self_improvement,
    },
    {
      'name': 'CrossFit',
      'description': 'Strength & endurance',
      'duration': '60 min',
      'level': 'Advanced',
      'icon': Icons.bolt,
    },
    {
      'name': 'Cardio',
      'description': 'Energy & stamina',
      'duration': '30 min',
      'level': 'All levels',
      'icon': Icons.directions_run,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FLEXAPP',
          style: TextStyle(
            color: purple,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        backgroundColor: background,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Hello, Athlete!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Ready for your next workout?',
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 24),

            SizedBox(
              height: 175,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [purple, Color(0xFF4934A5)],
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  const Positioned(
                    right: 15,
                    bottom: 12,
                    child: Icon(
                      Icons.fitness_center,
                      size: 75,
                      color: Colors.white24,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('YOUR FITNESS JOURNEY'),
                        Spacer(),
                        Text(
                          'Make today count.',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text('Find your next workout'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            const Text(
              'Explore Workouts',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            ...workouts.map((workout) {
              final name = workout['name'] as String;

              return WorkoutCard(
                workout: workout,
                isFavorite: favorites.contains(name),
                onFavorite: () {
                  setState(() {
                    if (favorites.contains(name)) {
                      favorites.remove(name);
                    } else {
                      favorites.add(name);
                    }
                  });
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WorkoutDetailsScreen(
                        workout: workout,
                      ),
                    ),
                  );
                },
              );
            }),

            const SizedBox(height: 12),
            Text(
              'Your favorites: ${favorites.length}',
              style: const TextStyle(color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}