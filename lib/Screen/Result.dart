import 'package:flutter/material.dart';
import 'package:flare_parent/Models/task.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() {
    return _ResultPageState();
  }
}

class _ResultPageState extends State<ResultPage> {
  List<charts.Series<Task, String>> _seriesPieData;
  List<Task> mydata;
  _generateData(mydata) {
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.taskDetails,
        measureFn: (Task task, _) => task.taskVal,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(task.colorVal))),
        id: 'tasks',
        data: mydata,
        labelAccessorFn: (Task row, _) => "${row.taskVal}",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    //List<Task> task =  .map((documentSnapshot) => Task.fromMap(documentSnapshot.data)) .toList();
    List<Task> task = [
      new Task('Maths', 50, '0xff15db99'),
      new Task('English', 70, '0xff158499'),
      new Task('Computer', 100, '0xff99db99'),
    ];
    return _buildChart(context, task);
  }

  Widget _buildChart(BuildContext context, List<Task> taskdata) {
    mydata = taskdata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Marks Obtained',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.PieChart(_seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 5),
                    behaviors: [
                      new charts.DatumLegend(
                        outsideJustification:
                            charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 2,
                        cellPadding: new EdgeInsets.only(
                            right: 4.0, bottom: 4.0, top: 4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontFamily: 'Light',
                            fontSize: 24),
                      )
                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
