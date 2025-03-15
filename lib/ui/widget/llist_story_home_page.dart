import 'package:flutter/material.dart';
import 'package:instgram_app/data/sotry_list_modell.dart';
import 'package:instgram_app/ui/widget/story.dart';
import 'package:instgram_app/ui/widget/ypurStory.dart';

class LlistStoryHomePage extends StatelessWidget {
  LlistStoryHomePage({super.key});
  final List<SotryListModell> storyModel = const [
    SotryListModell(
      image: 'assets/images/WhatsApp Image 2025-02-12 at 5.36.27 PM.jpeg',
      Text: 'mohamed_Eltrasy',
      additionalImages: const [
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.00.27 PM (2).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.00.27 PM (1).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.00.27 PM.jpeg'),
      ],
    ),
    SotryListModell(
      image: 'assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM (4).jpeg',
      Text: 'karem_Ghonem',
      additionalImages: const [
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.38.27 PM (1).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.38.27 PM.jpeg'),
      ],
    ),
    SotryListModell(
      image: 'assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM.jpeg',
      Text: 'hamdy_mostafa',
      additionalImages: const [
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.42.58 PM (1).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.42.58 PM (2).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.42.58 PM (3).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.42.58 PM.jpeg'),
      ],
    ),
    SotryListModell(
      image: 'assets/images/WhatsApp Image 2025-02-12 at 5.36.26 PM (1).jpeg',
      Text: 'salah_ayman',
      additionalImages: const [
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.47.44 PM (1).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.47.44 PM (2).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.47.44 PM (3).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 9.47.44 PM.jpeg'),
      ],
    ),
    SotryListModell(
      image: 'assets/images/WhatsApp Image 2025-02-12 at 5.36.27 PM (1).jpeg',
      Text: 'mohamed_Amgad',
      additionalImages: const [
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.00.05 PM.jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.00.05 PM (2).jpeg'),
      ],
    ),
    SotryListModell(
      image: 'assets/imageStory/WhatsApp Image 2025-03-04 at 10.05.20 PM.jpeg',
      Text: 'Hussein_Thabet',
      additionalImages: const [
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.05.20 PM (3).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.05.20 PM (2).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.05.20 PM (1).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.05.19 PM.jpeg'),
      ],
    ),
    SotryListModell(
      image: 'assets/imageStory/WhatsApp Image 2025-03-04 at 10.11.31 PM (3).jpeg',
      Text: 'yousef_Elansary',
      additionalImages: const [
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.11.32 PM.jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.11.32 PM (1).jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.11.31 PM.jpeg'),
        TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.11.31 PM (2).jpeg'),
                 TestStoryModel(
            image:
                'assets/imageStory/WhatsApp Image 2025-03-04 at 10.11.31 PM (1).jpeg'),
      ],
    ),
  ];

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyModel.length + 1, // +1 لـ YourStory
        itemBuilder: (context, index) {
          if (index == 0) {
            return Yourstory(
              modell: SotryListModell(
                image: 'assets/images/mohamed.jpeg',
                Text: 'YourStory',
              ),
            );
          } else {
            return Story(modell: storyModel[index - 1]);
          }
        },
      ),
    );
  }
}
