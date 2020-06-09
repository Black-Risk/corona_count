import 'package:flutter/material.dart';
import '../widgets/summary.dart';

class Indonesia extends StatelessWidget {
  final double height;
  final data;

  Indonesia({this.height, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          child: const Text('JUMLAH KASUS COVID-19 DI INDONESIA',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Divider(),
        Expanded(
          flex: 2,
          child: GridView.count(
            childAspectRatio: height / 350,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              SummaryCard(
                total: data.summary.positif.toString(),
                label: 'Terkonfirmasi',
                color: Color (0xFFEFE214),
                size: 25,
              ),
              SummaryCard(
                total: data.summary.dirawat.toString(),
                label: 'Dirawat',
                color: Color (0xFFDB14EF),
                size: 25,
              ),
              SummaryCard(
                total: data.summary.sembuh.toString(),
                label: 'Sembuh',
                color: Color (0xFF24DE11),
                size: 25,
              ),
              SummaryCard(
                total: data.summary.meninggal.toString(),
                label: 'Meninggal',
                color: Color (0xFFF63A37),
                size: 25,
              ),
            ],
          ),
        ),
      ],
    );
  }
}