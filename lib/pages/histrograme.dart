import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Histrograme extends StatefulWidget {
  const Histrograme({Key? key}) : super(key: key);

  @override
  State<Histrograme> createState() => _HistrogrameState();
}

class _HistrogrameState extends State<Histrograme> {
  List<_SalesData> data = [];

  Future<void> _fetchDataFromFirestore() async {
    try {
      final CollectionReference capacityHistry =
          FirebaseFirestore.instance.collection('sales');
      QuerySnapshot querySnapshot = await capacityHistry.get();

      List<_SalesData> newData = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return _SalesData(data['year'], data['sales']);
      }).toList();

      setState(() {
        data = newData;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to fetch data from Firestore: $e'),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDataFromFirestore();
  }

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
                xValueMapper: (_SalesData sales, _) => sales.date,
                yValueMapper: (_SalesData sales, _) => sales.capacity,
                name: 'Sales',
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                color: Colors.blueAccent,
              )
            ]),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.date, this.capacity);

  final String date;
  final double capacity;
}
