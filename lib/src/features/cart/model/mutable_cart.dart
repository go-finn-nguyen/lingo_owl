import 'dart:math';

import '../../../constants/type_defs/type_defs.dart';
import 'cart.dart';

extension MutableCart on LCart {
  LCart addItem(CourseId courseId) {
    final copy = Map<CourseId, TimeStamp>.from(courses);
    copy[courseId] = DateTime.now().millisecondsSinceEpoch;
    return LCart(courses: copy);
  }

  LCart addItems(Map<CourseId, TimeStamp> items) {
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
    return LCart(courses: copy);
  }

  LCart removeItem(CourseId courseId) {
    final update = Map<CourseId, TimeStamp>.from(courses);
    update.remove(courseId);
    return LCart(courses: update);
  }

  LCart removeItems(List<CourseId> courseIds) {
    final update = Map<CourseId, TimeStamp>.from(courses);
    for (var courseId in courseIds) {
      update.remove(courseId);
    }
    return LCart(courses: update);
  }
}
