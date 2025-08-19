import 'package:flutter/material.dart';

class CampaignPage extends StatelessWidget {
  const CampaignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "Campaign Matching",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.purple,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Applied"),
              Tab(text: "In Progress"),
              Tab(text: "Completed"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CampaignListView(),
            CampaignListView(),
            CampaignListView(),
          ],
        ),
      ),
    );
  }
}


class CampaignListView extends StatelessWidget {
  const CampaignListView({super.key});

  @override
  Widget build(BuildContext context) {
    final campaigns = [
      {
        "image": "https://picsum.photos/id/10/200/200",
        "title": "Company Name Here",
        "subtitle": "Introduction text goes here, only one line is shown...",
        "tags": ["F&B", "Fashion", "Kids", "Living & Interior"]
      },
      {
        "image": "https://picsum.photos/id/20/200/200",
        "title": "Company Name Here",
        "subtitle": "Introduction text goes here, only one line is shown...",
        "tags": ["F&B", "Fashion", "Kids", "Living & Interior"]
      },
      {
        "image": "https://picsum.photos/id/30/200/200",
        "title": "Company Name Here",
        "subtitle": "Introduction text goes here, only one line is shown...",
        "tags": ["F&B", "Fashion", "Kids", "Living & Interior"]
      },
    ];

    return ListView.builder(
      itemCount: campaigns.length,
      itemBuilder: (context, index) {
        final campaign = campaigns[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  campaign["image"]!.toString(),
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      campaign["title"]!.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      campaign["subtitle"]!.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      children: (campaign["tags"] as List<String>) // The fix is on this line
                          .map<Widget>(
                            (tag) => Chip(
                          label: Text(
                            tag,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.purple),
                          ),
                          backgroundColor: Colors.purple.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      )
                          .toList(),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/campaign_controller.dart';
// import '../utils/colors.dart';
// import '../utils/constants.dart';
// import '../utils/responsives.dart';
//
// class CampaignPage extends StatelessWidget {
//   CampaignPage({super.key});
//
//   final controller = Get.find<CampaignController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(),
//         title: Text(
//           'Campaign Matching',
//           style: TextStyle(fontSize: Responsive.font(20), fontWeight: FontWeight.w600),
//         ),
//         centerTitle: false,
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: Responsive.height(8)),
//           Obx(() => _tabs(controller)),
//           Divider(height: 1, color: Colors.grey.shade300),
//           Expanded(
//             child: Obx(
//                   () => ListView.separated(
//                 padding: EdgeInsets.all(Responsive.width(AppConstants.defaultPadding)),
//                 itemBuilder: (_, i) => _item(controller.items[i]),
//                 separatorBuilder: (_, __) => SizedBox(height: Responsive.height(16)),
//                 itemCount: controller.items.length,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _tabs(CampaignController c) {
//     final labels = ['Applied', 'In Progress', 'Completed'];
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: List.generate(labels.length, (i) {
//         final selected = c.tabIndex.value == i;
//         return Expanded(
//           child: GestureDetector(
//             onTap: () => c.tabIndex.value = i,
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: Responsive.height(16)),
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     width: Responsive.height(3),
//                     color: selected ? AppColors.primary : Colors.transparent,
//                   ),
//                 ),
//               ),
//               child: Text(
//                 labels[i],
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: selected ? AppColors.textPrimary : AppColors.textSecondary,
//                   fontSize: Responsive.font(16),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _item(CampaignItem item) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(Responsive.width(AppConstants.borderRadius)),
//           child: Image.network(
//             item.imageUrl,
//             width: Responsive.width(96),
//             height: Responsive.width(96),
//             fit: BoxFit.cover,
//           ),
//         ),
//         SizedBox(width: Responsive.width(12)),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 item.title,
//                 style: TextStyle(
//                   fontSize: Responsive.font(18),
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//               SizedBox(height: Responsive.height(4)),
//               Text(
//                 item.subtitle,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(fontSize: Responsive.font(14), color: AppColors.textSecondary),
//               ),
//               SizedBox(height: Responsive.height(8)),
//               Wrap(
//                 spacing: Responsive.width(8),
//                 runSpacing: Responsive.height(8),
//                 children: item.tags
//                     .map(
//                       (t) => Chip(
//                     label: Text(
//                       t,
//                       style: TextStyle(fontSize: Responsive.font(12), color: AppColors.primary),
//                     ),
//                     backgroundColor: AppColors.primary.withOpacity(0.1),
//                   ),
//                 )
//                     .toList(),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
