import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeWidget extends StatelessWidget {
  const GaugeWidget({
    super.key,
    required this.displayedValue,
    required this.sensorType,
    required this.unit,
    required this.alignment,
    required this.padding,
    required this.maximum,
  });

  final ValueNotifier<double> displayedValue;
  final String sensorType;
  final String unit;
  final Alignment alignment;
  final EdgeInsets padding;
  final double maximum;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(200),
          ),
          child: ValueListenableBuilder(
              valueListenable: displayedValue,
              builder: (context, value, child) {
                return SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      axisLineStyle: const AxisLineStyle(
                        thickness: 15,
                      ),
                      axisLabelStyle: const GaugeTextStyle(
                        fontSize: 10,
                      ),
                      minimum: 0,
                      maximum: maximum,
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: value,
                          width: 15,
                          gradient: const SweepGradient(
                            colors: <Color>[
                              Color(0xFFFF002E),
                              Color(0xFF2300FB),
                            ],
                          ),
                        ),
                        MarkerPointer(
                          value: value,
                          elevation: 5,
                          markerHeight: 15,
                          markerWidth: 15,
                          markerOffset: -15,
                          color: const Color(0xFF00FFFF),
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                sensorType,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                value.toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                unit,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          angle: 90,
                          positionFactor: 0.5,
                        )
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
