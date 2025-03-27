import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FishModel {
  final String title;
  final String image;
  final String category;
  final List<String> description;

  FishModel({
    required this.title,
    required this.image,
    required this.category,
    required this.description,
  });
}

final List<FishModel> fishList = [
  FishModel(
    title: 'Atlantic Bluefin Tuna (Thunnus thynnus)',
    image: 'assets/images/fishes/1.png',
    category: 'Ocean',
    description: [
      '🐟 Atlantic Bluefin Tuna (Thunnus thynnus)',
      '🔹 Size: Can grow up to 3 meters (10 feet) in length and weigh over 600 kg (1,300 lbs).',
      '🔹 Habitat: Found in the Atlantic Ocean, from North America to Europe and as far south as Brazil and West Africa. Also migrates to the Mediterranean for spawning.',
      '🔹 Features:',
      'One of the fastest fish in the ocean, reaching speeds of up to 75 km/h (47 mph).',
      'Warm-blooded, allowing it to survive in both cold and warm waters.',
      'Highly valued in sushi and sashimi markets, making it a target for commercial fishing.',
      '🌍 Unfortunately, due to overfishing, its population has drastically declined, leading to strict conservation measures.',
    ],
  ),
  FishModel(
    title: 'Clownfish (Amphiprioninae)',
    image: 'assets/images/fishes/2.png',
    category: 'Ocean',
    description: [
      '🐠 Clownfish (Amphiprioninae)',
      '🔹 Size: Typically 10–18 cm (4–7 inches) in length.',
      '🔹 Habitat: Found in warm waters of the Indian and Pacific Oceans, particularly around coral reefs, including the Great Barrier Reef.',
      '🔹 Features:',
      'Lives in symbiosis with sea anemones, gaining protection from predators thanks to its immunity to anemone stings.',
      'Sequential hermaphrodite: starts as a male but can change to female if needed.',
      'Known for its bright orange color with white bands, making it one of the most recognizable reef fish.',
      '🐠 Made famous by the animated movie Finding Nemo, clownfish are popular in aquariums but thrive best in their natural habitat.',
    ],
  ),
  FishModel(
    title: 'Great White Shark (Carcharodon carcharias)',
    image: 'assets/images/fishes/3.png',
    category: 'Ocean',
    description: [
      '🦈 Great White Shark (Carcharodon carcharias)',
      '🔹 Size: Can grow up to 6 meters (20 feet) in length and weigh over 2,000 kg (4,400 lbs).',
      '🔹 Habitat: Found in coastal and offshore waters worldwide, with high populations around South Africa, Australia, California, and Mexico.',
      '🔹 Features:',
      'One of the ocean’s top predators, feeding on fish, seals, and even whales.',
      'Has up to 300 serrated teeth arranged in multiple rows, which continuously replace themselves.',
      'Uses electroreception to detect the movement of prey through tiny sensory organs called the ampullae of Lorenzini.',
      'Can breach the water surface while hunting, making spectacular jumps to catch prey.',
      '🦈 Despite their fearsome reputation, attacks on humans are rare, and great whites are classified as vulnerable due to overfishing and habitat destruction.',
    ],
  ),
];

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final List<FishModel> filteredList = selectedFilters.isEmpty
        ? fishList
        : fishList
            .where((fish) => selectedFilters
                .any((filter) => fish.category.toLowerCase() == filter))
            .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF6BAFC0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D90A8),
        centerTitle: false,
        title: const Text(
          'Encyclopedia of Fishes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        child: const Icon(Icons.tune, color: Colors.white),
        onPressed: () async {
          bool? filtersUpdated = await _showFilterModal(context);
          if (filtersUpdated == true) {
            setState(() {});
          }
        },
      ),
      body: filteredList.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'No fish found in selected habitat(s): ${selectedFilters.join(", ")}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 40,
              ),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final fish = filteredList[index];
                return FishCard(fish: fish, screenWidth: screenWidth);
              },
            ),
    );
  }

  Future<bool?> _showFilterModal(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      backgroundColor: const Color(0xFF2D90A8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, modalSetState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Filters",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Habitat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: ["ocean", "aquarium", "river", "lake", "sea"]
                        .map((type) {
                      final isSelected = selectedFilters.contains(type);
                      return GestureDetector(
                        onTap: () {
                          modalSetState(() {
                            setState(() {
                              if (isSelected) {
                                selectedFilters.remove(type);
                              } else {
                                selectedFilters.add(type);
                              }
                            });
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFFFD313)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Text(
                            type,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context, true),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFE0303), Color(0xFFFBE905)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            "Apply",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }
}


class FishCard extends StatelessWidget {
  final FishModel fish;
  final double screenWidth;

  const FishCard({required this.fish, required this.screenWidth, super.key});

  @override
  Widget build(BuildContext context) {
    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          fish.description.map((line) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                line,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            );
          }).toList(),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2D90A8),
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  fish.image,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fish.title,
                      style: TextStyle(
                        fontSize: screenWidth > 375 ? 16.0 : 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => DetailsScreen(
                                  title: fish.title,
                                  image: fish.image,
                                  category: fish.category,
                                  textColumn: textColumn,
                                ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFE0303), Color(0xFFFBE905)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'Read more',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String title;
  final String image;
  final String category;
  final Widget textColumn;

  const DetailsScreen({
    required this.title,
    required this.image,
    required this.category,
    required this.textColumn,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6BAFC0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D90A8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Info",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  image,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 22.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD313),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  category,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              textColumn,
              const SizedBox(height: 24),
              Image.asset(
                'assets/images/fish_man.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
