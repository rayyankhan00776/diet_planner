import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_app/widgets/glasscontainer.dart';
import 'package:major_app/data/meal_data.dart';

class MealPlannerScreen extends StatefulWidget {
  @override
  _MealPlannerScreenState createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  String selectedOption = 'Diabetes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "M E A L S",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade200, Colors.teal.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 100),
                // Disease Options
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      'I am perfect',
                      'Pregnant Women',
                      'Diabetes',
                      'Allergies',
                      'Weight Loss',
                      'Weight Gain',
                    ]
                        .map(
                          (disease) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOption = disease;
                                });
                              },
                              child: Chip(
                                label: Text(
                                  disease,
                                  style: GoogleFonts.poppins(
                                    color: selectedOption == disease
                                        ? Colors.white
                                        : Colors.teal.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                backgroundColor: selectedOption == disease
                                    ? Colors.teal.shade400
                                    : Colors.teal.shade200,
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: selectedOption == disease
                                        ? Colors.black
                                        : Colors.white,
                                    width: 0.6,
                                  ),
                                ),
                                elevation: 3,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: 20),
                // 7-Day Planner
                Expanded(
                  child: ListView.builder(
                    itemCount: 7,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GlassContainer(
                          blur: 8,
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),
                          child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'Day ${index + 1}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal.shade900,
                                    ),
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: meals[selectedOption] != null &&
                                          meals[selectedOption]!.length > index
                                      ? meals[selectedOption]![index]
                                          .map<Widget>((meal) {
                                          return Row(
                                            children: [
                                              Icon(
                                                Icons.fastfood,
                                                color: Colors.teal.shade900,
                                              ),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Meal: ${meal['meal']}\n'
                                                  'Protein: ${meal['protein']}g, Carbs: ${meal['carbs']}g, Fats: ${meal['fats']}g\n',
                                                  style: GoogleFonts.poppins(),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList()
                                      : [
                                          Text(
                                            'Meals not defined for this day',
                                            style: GoogleFonts.poppins(
                                              color: Colors.white70,
                                            ),
                                          )
                                        ],
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
