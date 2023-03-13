import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/firestore/collection_name.dart';
import '../../../utils/base_collection_reference.dart';
import '../model/order.dart';

class OrderReference extends BaseCollectionReference<LOrder> {
  OrderReference(FirebaseFirestore firestore)
      : super(
          firestore.collection(CollectionName.order).withConverter(
                fromFirestore: (snapshot, options) =>
                    LOrder.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );
}
