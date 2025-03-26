import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleModel {
  final String title;
  final String image;
  final List<String> description;

  ArticleModel({
    required this.title,
    required this.image,
    required this.description,
  });
}

final List<ArticleModel> articleList = [
  ArticleModel(
    title: 'Tips for Caring for Different Types of Aquarium Fish',
    image: 'assets/images/articles/1.png',
    description: [
      '''Each species of aquarium fish has unique care requirements. To ensure the health and happiness of your fish, it is important to understand their specific needs. Here are some general tips for caring for different types of aquarium fish:

Tropical Fish: Tropical fish, such as tetras, angelfish, and guppies, thrive in warmer water temperatures (22–28°C or 72–82°F). They prefer soft to moderately hard water and need a stable environment. Ensure your tank is equipped with a good filter to maintain water quality and provide plenty of hiding spots and plants.

Coldwater Fish: Fish like goldfish and minnows are more tolerant of cooler temperatures (18–22°C or 64–72°F). They require larger tanks to accommodate their growth, as they produce more waste. These fish do well with an air pump to provide oxygenation.

Betta Fish: Betta fish, also known as Siamese fighting fish, prefer warm water (24–28°C or 75–82°F) and a tank with gentle filtration. Bettas are solitary and should not be kept with other males, but can coexist with peaceful female fish.

Cichlids: Cichlids require slightly alkaline water and a more complex environment with plenty of space to swim. They can be territorial, so careful consideration should be given to tank mates. Providing hiding places and maintaining stable water parameters is essential for their well-being.

Marine Fish: Saltwater fish, such as clownfish and tangs, require specific salinity levels in the water (usually between 1.020–1.025) and a high-quality filtration system. Marine tanks also require stable temperature control, and water changes need to be done regularly to prevent the buildup of harmful substances.''',
    ],
  ),
  ArticleModel(
    title: 'Optimal Water Parameters and Lighting for Aquarium Fish',
    image: 'assets/images/articles/2.png',
    description: [
      '''Proper water parameters and lighting are crucial for the health of your aquarium fish. Here are some important guidelines:

Water Parameters:

Temperature: Tropical fish generally need water temperatures between 22–28°C (72–82°F), while coldwater species like goldfish do better in cooler temperatures, around 18–22°C (64–72°F).

pH: Most freshwater fish prefer slightly acidic to neutral water (pH 6.5–7.5). Saltwater fish often require a slightly alkaline pH, around 8.0–8.4.

Hardness: The hardness of the water (GH) should be suited to the species. Soft water (less than 4 dKH) is ideal for species like tetras, while harder water (7–12 dKH) is better for fish like cichlids.

Ammonia, Nitrites, and Nitrates: Always ensure ammonia and nitrite levels are undetectable. Nitrate levels should be kept below 20 ppm to maintain a healthy tank.

Lighting:

Freshwater Tanks: A lighting duration of 10–12 hours per day is ideal. Fish and plants benefit from consistent lighting schedules to maintain their circadian rhythm. LED or fluorescent lights are most commonly used.

Saltwater Tanks: For marine tanks, lighting is especially important for coral growth. Marine aquariums often use specialized lights, such as metal halide or LED lights, that mimic natural sunlight.

Planted Tanks: Plants require moderate to high lighting depending on their species. Aim for 8–12 hours of light daily, and make sure your lighting system supports plant growth.''',
    ],
  ),
  ArticleModel(
    title: 'Compatibility of Fish Species in an Aquarium',
    image: 'assets/images/articles/3.png',
    description: [
      '''When selecting fish for your aquarium, compatibility is one of the most important factors to consider. Not all fish get along, and some species may become aggressive or territorial when kept with incompatible tank mates. Here are some general guidelines:

Peaceful Fish: Species like guppies, neon tetras, and Corydoras catfish are peaceful and do well in community tanks with other calm fish. They prefer to live in groups, so it’s best to keep at least 5–6 of the same species together.

Aggressive Fish: Species such as bettas and some types of cichlids can be very territorial and aggressive, especially toward other males or fish that resemble them. Avoid mixing them with peaceful species or other aggressive fish unless you have a large tank with plenty of hiding spaces.

Fish with Similar Water Requirements: Ensure that all the fish in your tank have similar temperature, pH, and hardness requirements. Mixing freshwater and saltwater species is not recommended, as they need very different water conditions.

Fish and Invertebrates: Some fish, like certain species of shrimp or snails, are vulnerable to predation from larger, more aggressive fish. Always research the species you wish to mix to ensure they will live harmoniously together.''',
    ],
  ),
];

class ArticleCatalogScreen extends StatelessWidget {
  const ArticleCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF6BAFC0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D90A8),
        centerTitle: false,
        title: const Text(
          'Aquarium Articles',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 28,
              height: 28,
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 28,
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.gear, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: articleList.length,
        itemBuilder: (context, index) {
          final article = articleList[index];
          return ArticleCard(article: article, screenWidth: screenWidth);
        },
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
  final double screenWidth;

  const ArticleCard({
    required this.article,
    required this.screenWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          article.description
              .map(
                (line) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    line,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
              .toList(),
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
                  article.image,
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
                      article.title,
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
                                  title: article.title,
                                  image: article.image,
                                  category: 'Aquarium Tips',
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
        title: const Text(
          "Info",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
          ],
        ),
      ),
    );
  }
}
