class Product {
  final int id;
  final String title;
  final String slug;
  final double price;
  final String description;
  final Category category;
  final List<String> images;
  final DateTime creationAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });

 factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] ?? 0,
    title: json['title'] ?? '',
    slug: json['slug'] ?? '',
    price: (json['price'] ?? 0).toDouble(),
    description: json['description'] ?? '',
    category: json['category'] is Map<String, dynamic>
    ? Category.fromJson(json['category'])
    : Category.empty(),
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .where((e) => e.isNotEmpty)
        .toList() ??
    [],
    creationAt: DateTime.tryParse(json['creationAt'] ?? '') ?? DateTime.now(),
    updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
  );
}
}class Category {
  final int id;
  final String name;
  final String slug;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      creationAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
  factory Category.empty() {
    return Category(
      id: 0,
      name: '',
      slug: '',
      image: '',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
