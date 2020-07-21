import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatefulWidget {
  @override
  _RadialGaugeState createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  double pointerAnnotation = 90;

  void updateUI() {
//    var value = ;
    setState(() {
//      value = pointerAnnotation;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Container(
          width: size.width * 0.85,
          height: size.height,
          child: SfRadialGauge(
            enableLoadingAnimation: true,
            axes: <RadialAxis>[
              RadialAxis(
                useRangeColorForAxis: true,
                minorTicksPerInterval: 0,
                interval: 10, //todo gradual +5 function
//                axisLabelStyle: GaugeTextStyle(color: Colors.purple),
                startAngle: 145,
                endAngle: 35,
                minimum: 0,
                maximum: 100,
                axisLineStyle: AxisLineStyle(
                  thickness: 40,
                  color: Colors.grey[300],
                  gradient: SweepGradient(
                    stops: [0, 0.5, 1],
                    colors: [Colors.red, Colors.green, Colors.blue],
                  ),
                ),
                ranges: <GaugeRange>[
//                  GaugeRange(
//                    startValue: 0,
//                    endValue: 30,
//                    color: Colors.red,
//                  ),
//                  GaugeRange(
//                    startValue: 30,
//                    endValue: 60,
//                    color: Colors.orange,
//                  ),
//                  GaugeRange(
//                    startValue: 60,
//                    endValue: 90,
//                    color: Colors.green,
//                  ),
//                  GaugeRange(
//                    startValue: 90,
//                    endValue: 100,
//                    color: Colors.black,
//                  ),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                    needleStartWidth: 1,
                    needleEndWidth: 5,
                    needleLength: 0.76,
                    value: pointerAnnotation,
                    gradient:
                        LinearGradient(colors: [Colors.red, Colors.orange]),
                    knobStyle: KnobStyle(
                      borderColor: Theme.of(context).scaffoldBackgroundColor,
                      borderWidth: 0.01,
                      knobRadius: 0.04,
//                      color: Colors.transparent,
                    ),
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    angle: 90,
                    positionFactor: 0.8,
                    widget: Container(
                      child: Text(
                        '$pointerAnnotation',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
