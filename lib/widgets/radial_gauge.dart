import 'package:flutter/material.dart';
import 'package:speedtest/providers/theme_manager.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatelessWidget {
  RadialGauge({
    this.showAnnotation,
    this.value,
  });

  final bool showAnnotation;
  final double value;

  @override
  Widget build(BuildContext context) {
    Color themedColor = isLightTheme(context) ? Colors.black : Colors.white;
    double axisLinePointerRangeThickness = 0.25;
    double animationDuration = 1000;
//todo implement custom value gauge
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
          interval: 10,
          startAngle: 145,
          endAngle: 35,
          minimum: 0,
          maximum: 100,
          showTicks: false,
          labelOffset: 15,
          radiusFactor: 1,
          showLabels: false,
          axisLabelStyle: GaugeTextStyle(fontSize: 12),
          axisLineStyle: AxisLineStyle(
            thicknessUnit: GaugeSizeUnit.factor,
            thickness: axisLinePointerRangeThickness,
          ),
          pointers: <GaugePointer>[
            NeedlePointer(
              value: value,
              enableAnimation: true,
              animationDuration: animationDuration,
              animationType: AnimationType.ease,
              lengthUnit: GaugeSizeUnit.factor,
              needleStartWidth: 4,
              needleEndWidth: 8,
              needleLength: 0.7,
              knobStyle: KnobStyle(
                knobRadius: 0,
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[
                  Color(0xffff8000),
                  Colors.red,
                ],
                stops: <double>[0.25, 0.75],
              ),
            ),
            RangePointer(
              value: value,
              width: axisLinePointerRangeThickness,
              sizeUnit: GaugeSizeUnit.factor,
              color: Color(0xFF494CA2),
              enableAnimation: true,
              animationDuration: animationDuration,
              animationType: AnimationType.easeOutBack,
              gradient: SweepGradient(
                colors: <Color>[
                  Color(0xffff8000),
                  Colors.red,
                ],
                stops: <double>[0.25, 0.75],
              ),
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 90,
              positionFactor: 0.8,
              widget: Container(
                child: Text(
                  showAnnotation ? '$value' : '',
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: themedColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
