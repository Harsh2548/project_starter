import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_starter/app/theme/app_colors.dart';
import 'package:project_starter/widgets/textfield/custom_searchfield.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:project_starter/utils/dataState/data_state.dart';
import 'package:project_starter/widgets/app_bar/app_bar.dart';
import 'package:project_starter/widgets/bottomsheets/custom_bottomsheet.dart';
import '../../../../widgets/cards/user_card.dart';
import '../controllers/home_controller.dart';
import '../models/user_response.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'User List'),
        body: Column(
          children: [
            Obx(() =>
            controller.usersListStatus.value.isSuccess
            ? Padding(
              padding: EdgeInsets.all(16.w),
              child: CustomSearchField(onChanged: controller.onSearch),
            )
            : SizedBox.shrink()),
            Expanded(
              child: Obx(
                () => controller.usersListStatus.value.isLoading
                    ? Skeletonizer(
                        enabled: true,
                        child: ListView.separated(
                          padding: EdgeInsets.all(16.w),
                          itemCount: 6,
                          separatorBuilder: (_, __) => SizedBox(height: 12.h),
                          itemBuilder: (_, __) => UserCard(
                            user: UserResponse(
                              name: "Loading",
                              email: "loading@email.com",
                              company: Company(name: "Loading"),
                            ),
                          ),
                        ),
                      )
                    : controller.filteredUsers.isEmpty
                    ? DataStateWidget(type: DataStateType.noData)
                    : controller.usersListStatus.value.isSuccess
                    ? RefreshIndicator(
                        onRefresh: controller.refreshUsers,
                        backgroundColor: Colors.white,
                        color: AppColors.primaryColor,
                        child: ListView.separated(
                          padding: EdgeInsets.all(16.w),
                          itemCount: controller.filteredUsers.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12.h),
                          itemBuilder: (_, index) {
                            final user = controller.filteredUsers[index];

                            return GestureDetector(
                              onTap: () => userDetailBottomSheet(user),
                              child: UserCard(user: user),
                            );
                          },
                        ),
                      )
                    : DataStateWidget(type: DataStateType.noData),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void userDetailBottomSheet(UserResponse user) {
    CustomBottomSheet.show(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 36.r,
              backgroundColor: Colors.blue.shade100,
              child: Text(
                user.name?.substring(0, 1) ?? '',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          buildItem("Name", user.name),
          buildItem("Email", user.email),
          buildItem("Phone", user.phone),
          buildItem("Website", user.website),
          buildItem("Company", user.company?.name),
          buildItem("City", user.address?.city),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget buildItem(String title, String? value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90.w,
            child: Text(
              title,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value ?? "",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
