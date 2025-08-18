import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/campaign_controller.dart';

class CampaignPage extends StatelessWidget {
  CampaignPage({super.key});

  final controller = Get.find<CampaignController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Campaign Matching'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Obx(() => _tabs(controller)),
          const Divider(height: 1),
          Expanded(
            child: Obx(() => ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (_, i) => _item(controller.items[i]),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: controller.items.length,
            )),
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
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 3,
                        color: selected
                            ? const Color(0xFF6D35D3)
                            : Colors.transparent)),
              ),
              child: Text(labels[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.black : Colors.grey)),
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
          borderRadius: BorderRadius.circular(16),
          child:
          Image.network(item.imageUrl, width: 96, height: 96, fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(item.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: item.tags
                    .map((t) => Chip(
                  label: Text(t),
                  backgroundColor: const Color(0xFFF0E8FF),
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
