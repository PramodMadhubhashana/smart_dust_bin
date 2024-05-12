import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Histrograme extends StatefulWidget {
  const Histrograme({Key? key}) : super(key: key);

  @override
  State<Histrograme> createState() => _HistrogrameState();
}

class _HistrogrameState extends State<Histrograme> {
  List<_SalesData> data = [
    _SalesData('Jan', 500),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 45),
    _SalesData('Jun', 500),
    _SalesData('Jul', 28),
    _SalesData('Aug', 34),
    _SalesData('Sep', 32),
    _SalesData('Oct', 45),
    _SalesData('Nov', 500),
    _SalesData('Dec', 28),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart(
          title: ChartTitle(
            text: "Pramodoo",
          ),
          primaryXAxis: CategoryAxis(),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<_SalesData, String>>[
            BarSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              name: 'Sales',
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
