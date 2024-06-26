import 'package:flutter/material.dart';

class Vehicle {
  final String model;
  final String brand;
  final double maxLuggageWeight;
  final String? driver;
  final int seats;
  final String image;

  Vehicle({
    required this.model,
    required this.brand,
    required this.maxLuggageWeight,
    this.driver,
    required this.seats,
    this.image = 'https://picsum.photos/200/300',
  });
}

class VehiclesScreen extends StatelessWidget {
  final List<Vehicle> vehicles = [
     Vehicle(model: "Ramcharger", brand: "Dodge", maxLuggageWeight: 2046, driver: "Vannie Butterick", seats: 9),
    Vehicle(model: "Rio", brand: "Kia", maxLuggageWeight: 5321, driver: "Joel Blakeway", seats: 6),
    Vehicle(model: "Mystique", brand: "Mercury", maxLuggageWeight: 815, driver: "Sheila Solloway", seats: 5),
    Vehicle(model: "Tempo", brand: "Ford", maxLuggageWeight: 3547, driver: "Margit Fargher", seats: 7),
    Vehicle(model: "Tribeca", brand: "Subaru", maxLuggageWeight: 1948, driver: "Aryn Kerner", seats: 6),
    Vehicle(model: "ES", brand: "Lexus", maxLuggageWeight: 2377, driver: "Tera Brands", seats: 4),
    Vehicle(model: "300", brand: "Chrysler", maxLuggageWeight: 3439, driver: "Ariela Shrubb", seats: 6),
    Vehicle(model: "Grand Prix", brand: "Pontiac", maxLuggageWeight: 4271, driver: "Ira Feares", seats: 6),
    Vehicle(model: "Grand Vitara", brand: "Suzuki", maxLuggageWeight: 5802, driver: "Meggi Ballantyne", seats: 8),
    Vehicle(model: "E-Series", brand: "Ford", maxLuggageWeight: 1323, driver: "Jarrett Footer", seats: 8),
    Vehicle(model: "Trooper", brand: "Isuzu", maxLuggageWeight: 2985, driver: "Sibylla Croci", seats: 7),
    Vehicle(model: "X6", brand: "BMW", maxLuggageWeight: 4265, driver: "Marchall Bremley", seats: 5),
    Vehicle(model: "SVX", brand: "Subaru", maxLuggageWeight: 1301, driver: "Freemon Leopold", seats: 8),
    Vehicle(model: "Swift", brand: "Suzuki", maxLuggageWeight: 5246, driver: "Minne Prestedge", seats: 6),
    Vehicle(model: "Ram 50", brand: "Dodge", maxLuggageWeight: 5535, driver: "Andra Kerfut", seats: 8),
    Vehicle(model: "Range Rover Classic", brand: "Land Rover", maxLuggageWeight: 5266, driver: "Hamid Stucke", seats: 7),
    Vehicle(model: "LS", brand: "Lexus", maxLuggageWeight: 762, driver: "Lisbeth Cello", seats: 4),
    Vehicle(model: "M-Class", brand: "Mercedes-Benz", maxLuggageWeight: 3305, driver: "Shoshana Jizhaki", seats: 8),
    Vehicle(model: "Clubman", brand: "MINI", maxLuggageWeight: 5388, driver: "Almira McHugh", seats: 8),
    Vehicle(model: "Silverado 2500", brand: "Chevrolet", maxLuggageWeight: 4375, driver: "Olivero Luppitt", seats: 6),
    Vehicle(model: "Tribute", brand: "Mazda", maxLuggageWeight: 3439, driver: "Niall Greenleaf", seats: 5),
    Vehicle(model: "Prius", brand: "Toyota", maxLuggageWeight: 1363, driver: "Alysa Rudsdale", seats: 5),
    Vehicle(model: "SC", brand: "Lexus", maxLuggageWeight: 5282, driver: "Allyn Everix", seats: 5),
    Vehicle(model: "Optima", brand: "Kia", maxLuggageWeight: 3743, driver: "Edee Capeling", seats: 7),
    Vehicle(model: "RDX", brand: "Acura", maxLuggageWeight: 4521, driver: "Ethan McNellis", seats: 8),
    Vehicle(model: "LX", brand: "Lexus", maxLuggageWeight: 853, driver: "Wye Lathwood", seats: 7),
    Vehicle(model: "Mustang", brand: "Ford", maxLuggageWeight: 781, driver: "Lacee Meatcher", seats: 9),
    Vehicle(model: "Pajero", brand: "Mitsubishi", maxLuggageWeight: 5171, driver: "Adah Belcher", seats: 6),
    Vehicle(model: "Caravan", brand: "Dodge", maxLuggageWeight: 2460, driver: "Maybelle Sneddon", seats: 8),
    Vehicle(model: "Colorado", brand: "Chevrolet", maxLuggageWeight: 1682, driver: "Joshia Schoroder", seats: 3),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualización de vehículos'),
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
            final vehicle = vehicles[index];
            return _buildVehicleCard(vehicle);
          },
        ),
      ),
    );
  }

  Widget _buildVehicleCard(Vehicle vehicle) {
    return SizedBox(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  vehicle.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Model: ${vehicle.model}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Brand: ${vehicle.brand}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Max weight: ${vehicle.maxLuggageWeight} kg',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Driver: ${vehicle.driver ?? 'No driver'}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Seats: ${vehicle.seats}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
