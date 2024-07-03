import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'indicator.dart';

class AppColors {
  static const contentColorBlue = Colors.blue;
  static const contentColorYellow = Colors.yellow;
  static const mainTextColor1 = Colors.white;
  static const borderColorGreen = Colors.green;
}

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartWidgetState();
}

class PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;
  int cardsLearnedToday = 0;
  int difficultCards = 0;
  int streakDays = 0; // For tracking streak days

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    // Simulating fetching streak data from storage or network
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // Example data; replace with actual logic to fetch streak count
        streakDays = 10; // Example: User has opened the app for 10 days consecutively
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pie Chart'),
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications), // Changed to notifications icon
                onPressed: () {
                  // Implement your action for the alert button
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red, // Customize as needed
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$streakDays',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Statistics Overview',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.borderColorGreen,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.borderColorGreen,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      color: AppColors.borderColorGreen,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Indicator(
                          color: AppColors.contentColorBlue,
                          text: 'Number of cards learned today:',
                          isSquare: true,
                          textColor: Colors.white,
                        ),
                        Spacer(),
                        Text(
                          '$cardsLearnedToday',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      color: AppColors.borderColorGreen,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Indicator(
                          color: AppColors.contentColorYellow,
                          text: 'Number of difficult cards:',
                          isSquare: true,
                          textColor: Colors.white,
                        ),
                        Spacer(),
                        Text(
                          '$difficultCards',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: AppColors.borderColorGreen,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Streak Days: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Streak Days',
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      controller: TextEditingController(text: '$streakDays'),
                      onChanged: (value) {
                        // Handle streak days input if needed
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final int totalCards = cardsLearnedToday + difficultCards;
    final double learnedPercentage = totalCards > 0 ? (cardsLearnedToday / totalCards) * 100 : 0;
    final double difficultPercentage = totalCards > 0 ? (difficultCards / totalCards) * 100 : 0;

    return [
      PieChartSectionData(
        color: AppColors.contentColorBlue,
        value: learnedPercentage > 0 ? learnedPercentage : 50,
        title: '${learnedPercentage.toStringAsFixed(1)}%',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTextColor1,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
      PieChartSectionData(
        color: AppColors.contentColorYellow,
        value: difficultPercentage > 0 ? difficultPercentage : 50,
        title: '${difficultPercentage.toStringAsFixed(1)}%',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTextColor1,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
    ];
  }
}
