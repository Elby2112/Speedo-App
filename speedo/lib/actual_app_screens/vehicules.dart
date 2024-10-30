class Vehicule {
  final String typeName;
  final String imagePath;
  final double capacity;
  Vehicule({
    required this.typeName,
    required this.imagePath,
    required this.capacity,
  });
}

List<Vehicule> vehicules = [
  Vehicule(
      typeName: 'Fourgon', imagePath: 'assets/img/forgon.png', capacity: 4.2),
  Vehicule(typeName: 'Hulux', imagePath: 'assets/img/hulux.png', capacity: 2.2),
  Vehicule(typeName: 'Truck', imagePath: 'assets/img/truck.png', capacity: 3.9),
];
