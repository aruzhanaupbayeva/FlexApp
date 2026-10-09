
import 'package:flutter/material.dart';
import '../main.dart';

class WorkoutDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> workout;

  const WorkoutDetailsScreen({
    super.key,
    required this.workout,
  });

  @override
  State<WorkoutDetailsScreen> createState() =>
      _WorkoutDetailsScreenState();
}

class _WorkoutDetailsScreenState
    extends State<WorkoutDetailsScreen> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    final workout = widget.workout;

    return Scaffold(
      appBar: AppBar(title: const Text('Workout Details')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [purple, Color(0xFF4934A5)],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              workout['icon'] as IconData,
              size: 85,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            workout['name'] as String,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _tag(workout['level'] as String),
              _tag(workout['duration'] as String),
              _tag('Fitness'),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'About this workout',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${workout['description']}. '
            'Join this session at Flex Fitness Club '
            'and work towards your fitness goals.',
            style: const TextStyle(
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: purple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isBooked = !isBooked;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isBooked
                          ? 'Workout booked successfully!'
                          : 'Booking cancelled.',
                    ),
                  ),
                );
              },
              child: Text(
                isBooked ? 'Cancel Booking' : 'Book Workout',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF34295D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFCEC4FF),
        ),
      ),
    );
  }
}