import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/firestore/collection_name.dart';
import '../model/payment_intent.dart';

abstract class PaymentRepository {
  Future<LPaymentIntent?> createPaymentIntent(String uid, int amount);
}

class StripeRepository implements PaymentRepository {
  StripeRepository(this.firestore);

  final FirebaseFirestore firestore;

  @override
  Future<LPaymentIntent?> createPaymentIntent(String uid, int amount) async {
    final collectionRef = firestore.collection(
        '${CollectionName.customer}/$uid/${CollectionName.checkoutSession}');
    final initIntent = LPaymentIntent(amount: amount);

    final docRef = await collectionRef.add(initIntent.toJson());

    await for (var docSnapshot in docRef.snapshots()) {
      final intent = LPaymentIntent.fromJson(docSnapshot.data()!);

      if (intent == initIntent) continue;

      if (intent.hasError) return null;

      return intent;
    }
    return null;
  }
}
