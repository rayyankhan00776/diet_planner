import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_app/data/exercise_data.dart';
import 'package:major_app/widgets/glasscontainer.dart';

class Exerciseplanner extends StatefulWidget {
  const Exerciseplanner({super.key});

  @override
  State<Exerciseplanner> createState() => _ExerciseplannerState();
}

class _ExerciseplannerState extends State<Exerciseplanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "E X E R C I S E",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ListView.builder(
            padding: EdgeInsets.only(top: kToolbarHeight + 20, bottom: 20),
            itemCount: weeklyExercisePlan.length,
            itemBuilder: (context, index) {
              final exercise = weeklyExercisePlan[index];
              return Column(
                children: [
                  GlassContainer(
                    blur: 10.0,
                    color: Colors.white
                        .withOpacity(0.4), // Slight opacity for glass effect
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exercise.day,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade900,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...exercise.activities.map((activity) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.fitness_center,
                                        size: 20, color: Colors.teal),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        activity,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 16), // Add space between the containers
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
