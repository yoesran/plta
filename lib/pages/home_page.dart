import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:plta/pages/login_page.dart';
import 'package:plta/widgets/gauge_widget.dart';
import 'package:plta/widgets/scale_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<double> anemometer = ValueNotifier<double>(0);

  final ValueNotifier<double> arusDc = ValueNotifier<double>(0);
  final ValueNotifier<double> powerDc = ValueNotifier<double>(0);
  final ValueNotifier<double> teganganBebanDc = ValueNotifier<double>(0);
  final ValueNotifier<double> teganganDc = ValueNotifier<double>(0);

  final ValueNotifier<double> arusAc = ValueNotifier<double>(0);
  final ValueNotifier<double> energyAc = ValueNotifier<double>(0);
  final ValueNotifier<double> freqiencyAc = ValueNotifier<double>(0);
  final ValueNotifier<double> powerAc = ValueNotifier<double>(0);
  final ValueNotifier<double> teganganAc = ValueNotifier<double>(0);

  @override
  void initState() {
    DatabaseReference anemometerRef = FirebaseDatabase.instance.ref('SensorKecepatanAngin/Anemometer');
    anemometerRef.onValue.listen((DatabaseEvent event) {
      double data = double.parse(event.snapshot.value.toString());
      anemometer.value = data;
    });

    DatabaseReference arusDcRef = FirebaseDatabase.instance.ref('SensorDC/ArusDC');
    arusDcRef.onValue.listen((DatabaseEvent event) {
      double data = double.parse(event.snapshot.value.toString());
      arusDc.value = data;
    });

    DatabaseReference powerDcRef = FirebaseDatabase.instance.ref('SensorDC/PowerDC');
    powerDcRef.onValue.listen((DatabaseEvent event) {
      double data = double.parse(event.snapshot.value.toString());
      powerDc.value = data;
    });

    DatabaseReference teganganBebanDcRef = FirebaseDatabase.instance.ref('SensorDC/TeganganBebanDC');
    teganganBebanDcRef.onValue.listen((DatabaseEvent event) {
      double data = double.parse(event.snapshot.value.toString());
      teganganBebanDc.value = data;
    });

    DatabaseReference teganganDcRef = FirebaseDatabase.instance.ref('SensorDC/TeganganDC');
    teganganDcRef.onValue.listen((DatabaseEvent event) {
      double data = double.parse(event.snapshot.value.toString());
      teganganDc.value = data;
    });

    DatabaseReference arusAcRef = FirebaseDatabase.instance.ref('SensorAC/ArusAC');
    arusAcRef.onValue.listen((DatabaseEvent event) {
      double data = double.parse(event.snapshot.value.toString());
      arusAc.value = data;
    });

    DatabaseReference energyAcRef = FirebaseDatabase.instance.ref('SensorAC/EnergyAC');
    energyAcRef.onValue.listen((DatabaseEvent event) {
      double data = double.parse(event.snapshot.value.toString());
      energyAc.value = data;
    });

    DatabaseReference freqiencyAcRef = FirebaseDatabase.instance.ref('SensorAC/FreqiencyAC');
    freqiencyAcRef.onValue.listen((DatabaseEvent event) {
      double data = double.parse(event.snapshot.value.toString());
      freqiencyAc.value = data;
    });

    DatabaseReference powerAcRef = FirebaseDatabase.instance.ref('SensorAC/PowerAC');
    powerAcRef.onValue.listen((DatabaseEvent event) {
      double data = double.parse(event.snapshot.value.toString());
      powerAc.value = data;
    });

    DatabaseReference teganganAcRef = FirebaseDatabase.instance.ref('SensorAC/TeganganAC');
    teganganAcRef.onValue.listen((DatabaseEvent event) {
      double data = double.parse(event.snapshot.value.toString());
      teganganAc.value = data;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.logout),
                        color: Colors.white,
                        onPressed: () async {
                          try {
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
                          } catch (e) {
                            scaleDialog(
                              context,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(
                                        e.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.info_outline),
                        color: Colors.white,
                        onPressed: () {
                          scaleDialog(
                            context,
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      'About\n\n',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Tentang Kami\n\nSelamat datang di Aplikasi Monitoring Pembangkit Listrik Tenaga Angin kami!\n\nAplikasi kami dirancang untuk memberikan pemantauan dan analisis data secara real-time pada sistem pembangkit listrik tenaga angin. Dengan mengintegrasikan teknologi sensor canggih dan perangkat IoT, kami bertujuan untuk mengoptimalkan kinerja dan efisiensi turbin angin, memastikan produksi energi yang berkelanjutan dan handal.',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  GaugeWidget(
                    displayedValue: anemometer,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 12),
                    sensorType: 'Wind Speed',
                    unit: 'M/S',
                    maximum: 30,
                  ),
                  GaugeWidget(
                    displayedValue: teganganDc,
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 12),
                    sensorType: 'DC Voltage',
                    unit: 'V',
                    maximum: 30,
                  ),
                  GaugeWidget(
                    displayedValue: teganganBebanDc,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 12),
                    sensorType: 'DC Voltage Load',
                    unit: 'V',
                    maximum: 30,
                  ),
                  GaugeWidget(
                    displayedValue: arusDc,
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 12),
                    sensorType: 'DC Current',
                    unit: 'mA',
                    maximum: 30,
                  ),
                  GaugeWidget(
                    displayedValue: powerDc,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 12),
                    sensorType: 'DC Power',
                    unit: 'W',
                    maximum: 300,
                  ),
                  GaugeWidget(
                    displayedValue: teganganAc,
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 12),
                    sensorType: 'AC Voltage',
                    unit: 'V',
                    maximum: 300,
                  ),
                  GaugeWidget(
                    displayedValue: arusAc,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 12),
                    sensorType: 'AC Current',
                    unit: 'A',
                    maximum: 4,
                  ),
                  GaugeWidget(
                    displayedValue: powerAc,
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 12),
                    sensorType: 'AC Power',
                    unit: 'W',
                    maximum: 200,
                  ),
                  GaugeWidget(
                    displayedValue: energyAc,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 12),
                    sensorType: 'AC Energy',
                    unit: 'kWh',
                    maximum: 30,
                  ),
                  GaugeWidget(
                    displayedValue: freqiencyAc,
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 12),
                    sensorType: 'AC Frequency',
                    unit: 'Hz',
                    maximum: 60,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
