import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../router/coordinator.dart';
import '../../../utils/text_style_helper.dart';
import '../../../widgets/common/common.dart';
import '../model/course.dart';

class CourseCardPortrait extends ConsumerWidget {
  const CourseCardPortrait({
    super.key,
    required this.course,
  });

  final LCourse course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleHelper = ref.watch(textStyleHelperProvider(context));
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => LCoordinator.showCourseDetailsScreen(course.id),
        child: Padding(
          padding: UiParameters.courseCardPadding,
          child: SizedBox(
            width: UiParameters.courseCardPortraitSize.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: LNetworkImage(
                    course.thumbnail,
                    borderRadius: UiParameters.courseCardBorderRadius,
                  ),
                ),
                Gaps.h8,
                Text(
                  course.name,
                  style: textStyleHelper.courseNameMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Gaps.h8,
                InstructionNameLabel(
                  name: course.instructorName,
                ),
                Gaps.h8,
                LRatingBar(
                  courseId: course.id,
                ),
                Gaps.h8,
                PriceLabel(
                  price: course.price,
                  salePrice: course.salePrice,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseCardLandscape extends ConsumerWidget {
  const CourseCardLandscape({
    super.key,
    required this.course,
  });

  final LCourse course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleHelper = ref.watch(textStyleHelperProvider(context));
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          InkWell(
            onTap: () => LCoordinator.showCourseDetailsScreen(course.id),
            child: Padding(
              padding: UiParameters.courseCardPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LNetworkImage(
                    course.thumbnail,
                    dimension: UiParameters.courseCardThumbnailDimension,
                    fit: BoxFit.cover,
                    borderRadius: UiParameters.courseCardBorderRadius,
                  ),
                  Gaps.w12,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.name,
                          style: textStyleHelper.courseNameMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gaps.h4,
                        InstructionNameLabel(
                          name: course.instructorName,
                        ),
                        Gaps.h4,
                        LRatingBar(
                          courseId: course.id,
                        ),
                        Gaps.h4,
                        PriceLabel(
                          price: course.price,
                          salePrice: course.salePrice,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
