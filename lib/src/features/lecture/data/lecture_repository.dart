import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../../utils/base_collection_reference.dart';
import '../../../utils/params/lecture_name_provider_params/lecture_name_provider_params.dart';
import '../model/section/section.dart';

final sectionsProvider =
    FutureProvider.family<List<LSection>, CourseId>((ref, courseId) async {
  final lectureRepository =
      ref.watch(DomainManager.instance.lectureRepositoryProvider);

  return lectureRepository.getSections(courseId);
});

final lectureNameProvider =
    Provider.family<String, LectureNameProviderParams>((ref, params) {
  final sections = ref.watch(sectionsProvider(params.courseId)).value;

  if (sections == null) return '';

  final lectures = sections
      .firstWhere((element) => element.index == params.sectionIndex)
      .lectures;
  final lecture =
      lectures.firstWhere((element) => element.index == params.lectureIndex);
  return lecture.name;
});

abstract class LectureRepository {
  Future<List<LSection>> getSections(CourseId courseId);
}

class FirestoreLectureRepository extends BaseCollectionReference<List<LSection>>
    implements LectureRepository {
  FirestoreLectureRepository(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.lecture).withConverter(
                fromFirestore: (snapshot, options) {
                  final sections =
                      snapshot.data()!['sections'] as List<dynamic>;
                  return sections.map((e) => LSection.fromJson(e)).toList();
                },
                toFirestore: (value, options) =>
                    {'sections': value.map((e) => e.toJson())},
              ),
        );

  @override
  Future<List<LSection>> getSections(CourseId courseId) async {
    final result = await get(courseId);
    return result!;
  }
}
