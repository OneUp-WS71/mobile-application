import 'package:mobile_application/common/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/common/widgets/custom_app_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class VitalSignsChartScreen extends StatelessWidget {
  // Datos ficticios para los gráficos
  List<FlSpot> temperatureData = [
    FlSpot(0, 36),
    FlSpot(1, 36.5),
    FlSpot(2, 37),
    FlSpot(3, 37.2),
    FlSpot(4, 36.8),
    FlSpot(5, 36.5),
    FlSpot(6, 36.7),
    FlSpot(7, 37),
    FlSpot(8, 37.5),
  ];

  List<FlSpot> heartRateData = [
    FlSpot(0, 65),
    FlSpot(1, 68),
    FlSpot(2, 70),
    FlSpot(3, 72),
    FlSpot(4, 68),
    FlSpot(5, 67),
    FlSpot(6, 69),
    FlSpot(7, 71),
    FlSpot(8, 70),
  ];

  List<FlSpot> breathingFrequencyData = [
    FlSpot(0, 16),
    FlSpot(1, 17),
    FlSpot(2, 16),
    FlSpot(3, 15),
    FlSpot(4, 17),
    FlSpot(5, 18),
    FlSpot(6, 16),
    FlSpot(7, 15),
    FlSpot(8, 16),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Vital Signs'
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.thermostat_outlined,
                      size: 30,
                      color: Colors.lightBlueAccent,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Temperature',
                      style: TextStyle(
                        fontFamily: Styles.headingFont,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              _buildLineChart(temperatureData, 'Temperature', Colors.lightBlueAccent),
              SizedBox(height: 20),
              Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Heart Rate',
                      style: TextStyle(
                          fontFamily: Styles.headingFont,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color:Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              _buildLineChart(heartRateData, 'Heart Rate', Colors.red),
              SizedBox(height: 20),
              Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.air_rounded,
                      size: 30,
                      color:  Colors.blueAccent,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Breathing Frequency',
                      style: TextStyle(
                          fontFamily: Styles.headingFont,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              _buildLineChart(breathingFrequencyData, 'Breathing Frequency', Colors.blueAccent),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLineChart(List<FlSpot> data, String title, Color color) {
    return Container(
      height: 300,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: true, border: Border.all(color: Colors.black)),
          lineBarsData: [
            LineChartBarData(
              spots: data,
              isCurved: true,
              color: Styles.secondaryColor,
              barWidth: 3,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 42,
              ),
            ),
          ),
          gridData: FlGridData(show: true, drawVerticalLine: true, drawHorizontalLine: true),
          //minX: 0,
          //maxX: 8,
          //minY: 0,
          //maxY: 40, // Puedes ajustar este valor según los datos reales
        ),
      ),
    );
  }
}