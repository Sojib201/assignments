import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/campaign_controller.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/responsives.dart';

class CampaignPage extends StatelessWidget {
  CampaignPage({super.key});

  final controller = Get.find<CampaignController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Campaign Matching',
          style: TextStyle(fontSize: Responsive.font(20), fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(height: Responsive.height(8)),
          Obx(() => _tabs(controller)),
          Divider(height: 1, color: Colors.grey.shade300),
          Expanded(
            child: Obx(
                  () => ListView.separated(
                padding: EdgeInsets.all(Responsive.width(AppConstants.defaultPadding)),
                itemBuilder: (_, i) => _item(controller.items[i]),
                separatorBuilder: (_, __) => SizedBox(height: Responsive.height(16)),
                itemCount: controller.items.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabs(CampaignController c) {
    final labels = ['Applied', 'In Progress', 'Completed'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(labels.length, (i) {
        final selected = c.tabIndex.value == i;
        return Expanded(
          child: GestureDetector(
            onTap: () => c.tabIndex.value = i,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Responsive.height(16)),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: Responsive.height(3),
                    color: selected ? AppColors.primary : Colors.transparent,
                  ),
                ),
              ),
              child: Text(
                labels[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: selected ? AppColors.textPrimary : AppColors.textSecondary,
                  fontSize: Responsive.font(16),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _item(CampaignItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Responsive.width(AppConstants.borderRadius)),
          child: Image.network(
            item.imageUrl,
            width: Responsive.width(96),
            height: Responsive.width(96),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: Responsive.width(12)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(
                  fontSize: Responsive.font(18),
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: Responsive.height(4)),
              Text(
                item.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: Responsive.font(14), color: AppColors.textSecondary),
              ),
              SizedBox(height: Responsive.height(8)),
              Wrap(
                spacing: Responsive.width(8),
                runSpacing: Responsive.height(8),
                children: item.tags
                    .map(
                      (t) => Chip(
                    label: Text(
                      t,
                      style: TextStyle(fontSize: Responsive.font(12), color: AppColors.primary),
                    ),
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                  ),
                )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
