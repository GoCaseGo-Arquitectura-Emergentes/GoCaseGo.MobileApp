import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async'; // Importa 'dart:async' para usar Timer

class Sensor {
  dynamic id;
  dynamic driverId;
  String serie;
  bool hasPossibleCrashWarning;

  Sensor({
    required this.id,
    required this.driverId,
    required this.serie,
    required this.hasPossibleCrashWarning,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      id: json['id'],
      driverId: json['driverId'],
      serie: json['serie'],
      hasPossibleCrashWarning: json['hasPossibleCrashWarning'],
    );
  }
}

class SensorScreen extends StatefulWidget {
  const SensorScreen({super.key});

  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  List<Sensor> vehicles = [];
  Timer? _timer; // Timer para hacer la consulta cada 10 segundos

  @override
  void initState() {
    super.initState();
    fetchSensors('1');
    _timer = Timer.periodic(const Duration(seconds: 10),
        (Timer t) => fetchSensors('1'));
  }

  @override
  void dispose() {
    _timer
        ?.cancel(); 
    super.dispose();
  }

  Future<void> fetchSensors(String id) async {
    try {
      final response = await http.get(Uri.parse(
          'https://equipatour.osc-fr1.scalingo.io/api/v1/vibration-sensors/get-all-vibration-sensors/$id'));
      final data = jsonDecode(response.body);

      List<Sensor> loadedSensors = [];
      for (var sensorData in data) {
        Sensor sensor = Sensor.fromJson(sensorData);
        loadedSensors.add(sensor);
      }

      setState(() {
        vehicles = loadedSensors;
      });
    } catch (error) {
      print('Error fetching sensors: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualización de sensores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: vehicles.length,
          itemBuilder: (context, index) {
            return _buildSensorCard(vehicles[index]);
          },
        ),
      ),
    );
  }

  Widget _buildSensorCard(Sensor sensor) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Conductor ID: ${sensor.driverId}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  sensor.hasPossibleCrashWarning
                      ? Icons.warning
                      : Icons.check_circle,
                  color: sensor.hasPossibleCrashWarning
                      ? Colors.red
                      : Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    sensor.hasPossibleCrashWarning
                        ? 'Posible advertencia de choque'
                        : 'Sin advertencias de choque',
                    style: TextStyle(
                      fontSize: 14,
                      color: sensor.hasPossibleCrashWarning
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Sensor ID: ${sensor.id}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Serie: ${sensor.serie}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
