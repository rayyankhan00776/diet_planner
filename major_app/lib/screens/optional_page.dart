import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_app/screens/MealPLan.dart';
import 'package:major_app/screens/ExercisePlanner.dart';
import 'package:major_app/screens/chatscreen.dart';
import 'package:major_app/ulits/local_notification.dart';
import 'package:major_app/widgets/hydration_dialog.dart';
import 'package:major_app/widgets/optional_button_widget.dart';

class OptionalPage extends StatelessWidget {
  const OptionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    void preodicnotification() {
      Timer.periodic(Duration(hours: 1), (timer) {
        LocalNotifications.ShowSimpleNotification(
            title: "water intake", body: "Drink 1 glass of water", payload: "");
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "E X P L O R A T I O N",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/main_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionalButtonWidget(
                  label: "Meals",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealPlannerScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                OptionalButtonWidget(
                  label: "Exercise",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Exerciseplanner(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                OptionalButtonWidget(
                  label: "Hydration",
                  onTap: () {
                    showHydrationDialog(context);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                OptionalButtonWidget(
                  label: "Chat with AI",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
