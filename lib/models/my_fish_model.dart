class MyFishModel {
  final String title;
  final String image;
  final String typeOfFish;
  final String date; // Format: MM/DD/YYYY
  final String placeWhereMeet;
  final String description;

  MyFishModel({
    required this.title,
    required this.image,
    required this.typeOfFish,
    required this.date,
    required this.placeWhereMeet,
    required this.description,
  });

  factory MyFishModel.fromJson(Map<String, dynamic> json) => MyFishModel(
        title: json['title'],
        image: json['image'],
        typeOfFish: json['typeOfFish'],
        date: json['date'],
        placeWhereMeet: json['placeWhereMeet'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'image': image,
        'typeOfFish': typeOfFish,
        'date': date,
        'placeWhereMeet': placeWhereMeet,
        'description': description,
      };
}