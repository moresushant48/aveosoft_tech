// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:aveosoft_tech/model/aveosoft.model.dart';
import "package:charts_flutter/flutter.dart" as charts;
import "package:flutter/material.dart";

class SimpleTimeSeriesChart extends StatefulWidget {
  final String jsonName;
  final bool animate;

  SimpleTimeSeriesChart(this.jsonName, {Key? key, this.animate = true})
      : super(key: key);

  @override
  State<SimpleTimeSeriesChart> createState() => _SimpleTimeSeriesChartState();
}

class _SimpleTimeSeriesChartState extends State<SimpleTimeSeriesChart> {
  List<charts.Series<AveosoftModel, DateTime>> aveosoft = [];
  @override
  void initState() {
    super.initState();
    getJsonFiles();
  }

  getJsonFiles() async {
    List<AveosoftModel> day1 = [];
    final load1day = await DefaultAssetBundle.of(context)
        .loadString("assets/jsons/${widget.jsonName}.json");
    var decoded1day = json.decode(load1day);
    decoded1day['bars'].forEach((model) {
      day1.add(AveosoftModel.fromJson(model));
    });
    aveosoft = createSampleData(day1);
    setState(() {});
  }

  List<charts.Series<AveosoftModel, DateTime>> createSampleData(
      List<AveosoftModel> aveosoftmodel) {
    return [
      charts.Series<AveosoftModel, DateTime>(
        id: 'Aveosoft ${widget.jsonName}',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (AveosoftModel model, _) => DateTime.parse(model.date),
        measureFn: (AveosoftModel model, _) => model.close,
        data: aveosoftmodel,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: aveosoft.isEmpty
          ? const Center(
              child: SizedBox(
                  height: 40, width: 40, child: CircularProgressIndicator()),
            )
          : charts.TimeSeriesChart(
              aveosoft,
              animate: widget.animate,
              domainAxis: const charts.DateTimeAxisSpec(
                renderSpec: charts.GridlineRendererSpec(
                  labelStyle:
                      charts.TextStyleSpec(color: charts.MaterialPalette.white),
                  lineStyle: charts.LineStyleSpec(
                      color: charts.MaterialPalette.transparent),
                ),
              ),
              primaryMeasureAxis: const charts.NumericAxisSpec(
                renderSpec: charts.GridlineRendererSpec(
                  labelStyle:
                      charts.TextStyleSpec(color: charts.MaterialPalette.white),
                  lineStyle:
                      charts.LineStyleSpec(color: charts.MaterialPalette.white),
                ),
              ),
              dateTimeFactory: const charts.LocalDateTimeFactory(),
            ),
    );
  }
}
