import 'package:demo_access_refresh_token_app/routes/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/loading_widget.dart';
import 'post_controller.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF0D7E9D);
    const Color darkTeal = Color(0xFF023E54);
    const Color bgColor = Color(0xFFF5F7FA);

    return Obx(() {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRouteName.adminPostForm);
                },
                icon: const Icon(Icons.add_circle_outline, size: 28),
              ),
            )
          ],
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          centerTitle: true,
          backgroundColor: primaryColor,
          title: const Text(
            "Manage Posts",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: controller.loading.value == true
            ? const LoadingWidget()
            : RefreshIndicator(
          color: primaryColor,
          onRefresh: () async {
            controller.getAllPost();
          },
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            itemCount: controller.postList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final data = controller.postList[index];

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Image Section
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                      child: Image.network(
                        data.image ?? "",
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 200,
                            color: bgColor,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(color: primaryColor),
                          );
                        },
                        errorBuilder: (_, __, ___) {
                          return Container(
                            height: 200,
                            color: primaryColor.withValues(alpha: 0.05),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image_not_supported_rounded, size: 50, color: primaryColor.withValues(alpha: 0.3)),
                                  const SizedBox(height: 8),
                                  Text("No Image Available", style: TextStyle(color: primaryColor.withValues(alpha: 0.5))),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Title
                          Text(
                            data.title ?? "Untitled Post",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: darkTeal,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 10),

                          /// Date Row
                          Row(
                            children: [
                              const Icon(Icons.access_time_rounded, size: 16, color: Colors.grey),
                              const SizedBox(width: 6),
                              Text(
                                data.createAt ?? "Unknown Date",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          /// Description
                          Text(
                            data.description ?? "No description provided.",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade700,
                              height: 1.5,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 16),

                          /// Tags (Beautiful Borderless Chips)
                          if (data.tags != null && data.tags!.isNotEmpty)
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: data.tags!.map((tag) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: primaryColor.withValues(alpha: 0.08),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "#$tag",
                                  style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )).toList(),
                            ),

                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(height: 1, color: Color(0xFFEEEEEE)),
                          ),

                          /// Footer: Reactions & Category (Aligned nicely)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Reactions (Likes & Dislikes)
                              Row(
                                children: [
                                  _buildReactionItem(Icons.thumb_up_rounded, Colors.green.shade600, data.reactions?.likes ?? 0),
                                  const SizedBox(width: 16),
                                  _buildReactionItem(Icons.thumb_down_rounded, Colors.red.shade400, data.reactions?.dislikes ?? 0),
                                ],
                              ),

                              // Category Badge
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.category_rounded, size: 14, color: Colors.orange.shade700),
                                    const SizedBox(width: 6),
                                    Text(
                                      data.postCategory?.name ?? "General",
                                      style: TextStyle(
                                        color: Colors.orange.shade700,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    });
  }

  // Helper method for clean reaction icons
  Widget _buildReactionItem(IconData icon, Color color, int count) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 6),
        Text(
          "$count",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}