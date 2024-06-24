import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pigfarming/widget/drawer.dart';
import '../widget/widget_design.dart';
import '../widget/size_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double x1 = 0;
  double y1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetDesign.appbarHomepage(context: context),
      drawer: DrawerDesignWidget(),
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
              width: double.infinity,
              height: SizeUtils.doubleSizeHeight(width: MediaQuery.of(context).size.height, context: context),
          ),
          Wrap(
            children: [
              lineChart(),
              WidgetDesign.tileMenu(border: false, text: "Cattle", icon: Icons.grid_view_rounded),
              WidgetDesign.tileMenu(border: true, text: "Cattle_Age", icon: Icons.grid_view_rounded),
              // WidgetDesign.tileMenu(border: true),
            ],
          ),
        ],
      ),
    );
  }



  lineChart(){
    return Center(
      child: WidgetDesign.boxShadow(
        child: Container(
          decoration: BoxDecoration(
          ),
          width: double.infinity,
          height: 180,
          margin: EdgeInsets.all(20),
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(
                show: false,
                // border: Border.all(color: Colors.orange, width: 2)
              ),
              titlesData: FlTitlesData(
                show: true,
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),

              lineBarsData: [
                // The red line
                LineChartBarData(
                  spots: dummyData1,
                  isCurved: true,
                  barWidth: 3,
                  //dotData: FlDotData(show: false),
                  color: Colors.indigo,
                ),
                // The orange line
                LineChartBarData(
                  spots: dummyData2,
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.red,
                ),
                // The blue line
                LineChartBarData(
                  spots: dummyData3,
                  isCurved: false,
                  barWidth: 3,
                  color: Colors.orange,
                )
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.black,
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    return touchedSpots.map((barSpot) {
                      final flSpot = barSpot;
                      return LineTooltipItem(
                        '(${flSpot.x}, ${flSpot.y})',
                        const TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                ),
                handleBuiltInTouches: true,
              ),
            ),

          ),
        ),
      ),
    );
  }

  button(){
    double sizeWidth = SizeUtils.doubleSizeWidth(textField: true, context: context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ButtonStyle(),
        onPressed: (){
          setState(() {
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeWidth*20/100),
          child: Text(
            'Reload',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }

  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });
}
