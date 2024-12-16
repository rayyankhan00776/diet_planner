import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_app/ulits/local_notification.dart';
import 'package:workmanager/workmanager.dart';

void showHydrationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Stay Hydrated!",
                style: GoogleFonts.poppins(
                  color: Colors.teal.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "“Drinking water is essential to a healthy lifestyle.”",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.teal.shade800,
                  fontSize: 16,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                "“You will be notified from time to time”",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  startHydrationReminder();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Close",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void startHydrationReminder() {
  Workmanager().registerPeriodicTask(
    'hydration_task',
    'hydration_notification',
    frequency: Duration(hours: 1),
    inputData: <String, dynamic>{'key': 'value'},
  );
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    LocalNotifications.ShowSimpleNotification(
      title: "Water Intake",
      body: "Drink 1 glass of water",
      payload: "",
    );
    return Future.value(true);
  });
}
