import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/authentication/data/authentication_repository.dart';
import 'features/cart/data/local/local_cart_repository.dart';
import 'features/cart/data/remote/remote_cart_repository.dart';
import 'features/course/data/course_repository.dart';
import 'features/course/data/course_repository_impl.dart';
import 'features/enrolled_course/data/enrolled_course_repository.dart';
import 'features/lecture/data/lecture_repository.dart';
import 'features/note/data/firestore_note_repository.dart';
import 'features/note/data/note_repository.dart';
import 'features/payment/data/payment_repository.dart';
import 'features/profile/data/user_repository.dart';
import 'features/rating_count/data/rating_count_repository.dart';
import 'features/reminder/data/reminder_repository.dart';
import 'features/reviews/data/review_repository.dart';
import 'features/video/data/video_repository.dart';
import 'features/wishlist/data/wishlist_repository.dart';

class DomainManager {
  static DomainManager? _instance;

  DomainManager._();

  static DomainManager get instance => _instance ??= DomainManager._();

  late final authRepositoryProvider = Provider<AuthenticationRepository>((ref) {
    return FirebaseAuthenticationRepository(
      FirebaseAuth.instance,
      GoogleSignIn(),
      FacebookAuth.instance,
    );
  });

  late final userRepositoryProvider = Provider<UserRepository>((ref) {
    return FirestoreUserRepository(FirebaseFirestore.instance);
  });

  final courseRepositoryProvider = Provider<CourseRepository>((ref) {
    return CourseRepositoryImpl();
  });

  final localCartRepositoryProvider = Provider<LocalCartRepository>((ref) {
    // * Override this in the main method
    throw UnimplementedError();
  });

  final remoteCartRepositoryProvider = Provider<RemoteCartRepository>((ref) {
    return FirestoreCartRepository(FirebaseFirestore.instance);
  });

  final wishlistRepositoryProvider = Provider<WishlistRepository>((ref) {
    return FirestoreWishlistRepository(FirebaseFirestore.instance);
  });

  final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
    return FirestoreReviewRepository(FirebaseFirestore.instance);
  });

  final ratingCountRepositoryProvider = Provider<RatingCountRepository>((ref) {
    return FirestoreRatingCountRepository(FirebaseFirestore.instance);
  });

  final enrolledCourseRepositoryProvider =
      Provider<EnrolledCourseRepository>((ref) {
    return FirestoreEnrolledCourseRepository(FirebaseFirestore.instance);
  });

  final lectureRepositoryProvider = Provider<LectureRepository>((ref) {
    return FirestoreLectureRepository(FirebaseFirestore.instance);
  });

  final videoRepositoryProvider = Provider<VideoRepository>((ref) {
    return FirestoreVideoRepository(FirebaseFirestore.instance);
  });

  final noteRepositoryProvider = Provider<NoteRepository>((ref) {
    return FirestoreNoteRepository();
  });

  final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
    return StripeRepository(FirebaseFirestore.instance);
  });

  final reminderRepositoryProvider = Provider<ReminderRepository>((ref) {
    // * Override this in the main method
    throw UnimplementedError();
  });
}
