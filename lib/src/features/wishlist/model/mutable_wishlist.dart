import 'dart:math';

import '../../../constants/type_defs/type_defs.dart';
import 'wishlist.dart';

extension MutableWishlist on LWishList {
  LWishList addItem(CourseId courseId) {
    final copy = Map<CourseId, TimeStamp>.from(courses);
    copy[courseId] = DateTime.now().millisecondsSinceEpoch;
    return LWishList(courses: copy);
  }

  LWishList addItems(Map<CourseId, TimeStamp> items) {
    final copy = Map<CourseId, TimeStamp>.from(courses);
    for (var item in items.entries) {
      copy.update(
        item.key,
        // if there is already a value, update it by newest timestamp
        (value) => max(value, item.value),
        // otherwise, add the item with the given timestamp
        ifAbsent: () => item.value,
      );
    }
    return LWishList(courses: copy);
  }

  LWishList removeItem(CourseId courseId) {
    final update = Map<CourseId, TimeStamp>.from(courses);
    update.remove(courseId);
    return LWishList(courses: update);
  }

  LWishList removeItems(List<CourseId> courseIds) {
    final update = Map<CourseId, TimeStamp>.from(courses);
    for (var courseId in courseIds) {
      update.remove(courseId);
    }
    return LWishList(courses: update);
  }
}
