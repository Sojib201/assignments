import 'package:get/get.dart';

class CampaignItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final List<String> tags;
  CampaignItem({required this.imageUrl, required this.title, required this.subtitle, required this.tags});
}

class CampaignController extends GetxController {
  final tabIndex = 0.obs;
  final items = <CampaignItem>[
    CampaignItem(
      imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
      title: 'Company Name Here',
      subtitle: 'This is where the one-line description appears.',
      tags: ['F&B', 'Fashion', 'Kids', 'Living/Interior'],
    ),
    CampaignItem(
      imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      title: 'Company Name Here',
      subtitle: 'This is where the one-line description appears.',
      tags: ['F&B', 'Fashion', 'Kids', 'Living/Interior'],
    ),
    CampaignItem(
      imageUrl: 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
      title: 'Company Name Here',
      subtitle: 'This is where the one-line description appears.',
      tags: ['F&B', 'Fashion', 'Kids', 'Living/Interior'],
    ),
  ].obs;
}
