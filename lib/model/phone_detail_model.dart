class PhoneDetail {
  final String? color;
  final String? capacity;
  final String? capacityGb;
  final double? price;
  final String? generation;
  final int? year;
  final String? cpuModel;
  final String? hardDiskSize;
  final String? caseSize;
  final double? screenSize;
  final String? description;

  PhoneDetail({
    this.color,
    this.capacity,
    this.capacityGb,
    this.price,
    this.generation,
    this.year,
    this.cpuModel,
    this.hardDiskSize,
    this.caseSize,
    this.screenSize,
    this.description,
  });

  factory PhoneDetail.fromJson(Map<String, dynamic> json) {
    return PhoneDetail(
      color: json['color'] ?? json['Color'] ?? json['Strap Colour'],
      capacity: json['capacity'] ?? json['Capacity'],
      capacityGb: json['capacity GB']?.toString(),
      price: (json['price'] ?? json['Price']) != null ? double.tryParse(json['price'].toString()) : null,
      generation: json['generation'] ?? json['Generation'],
      year: json['year'],
      cpuModel: json['CPU model'],
      hardDiskSize: json['Hard disk size'],
      caseSize: json['Case Size'],
      screenSize: json['Screen size'] != null ? double.tryParse(json['Screen size'].toString()) : null,
      description: json['Description'],
    );
  }
}
