// exercise_data.dart

class Exercise {
  final String day;
  final List<String> activities;

  Exercise({required this.day, required this.activities});
}

List<Exercise> weeklyExercisePlan = [
  Exercise(day: "Monday", activities: [
    "20-minute cardio",
    "15 squats",
    "10 push-ups",
    "5-minute stretching",
  ]),
  Exercise(day: "Tuesday", activities: [
    "30-minute yoga",
    "10 lunges (each leg)",
    "15 burpees",
    "10-minute meditation",
  ]),
  Exercise(day: "Wednesday", activities: [
    "15-minute run",
    "20 sit-ups",
    "10 pull-ups",
    "10-minute stretching",
  ]),
  Exercise(day: "Thursday", activities: [
    "25-minute cycling",
    "15 push-ups",
    "20 squats",
    "5-minute cooldown",
  ]),
  Exercise(day: "Friday", activities: [
    "20-minute HIIT workout",
    "10 lunges (each leg)",
    "15 burpees",
    "5-minute stretching",
  ]),
  Exercise(day: "Saturday", activities: [
    "30-minute walk",
    "10 squats",
    "10 push-ups",
    "15 sit-ups",
  ]),
  Exercise(day: "Sunday", activities: [
    "Rest day",
    "Light stretching",
    "5-minute meditation",
  ]),
];
