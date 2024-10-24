import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/card.dart';

class CoursesController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference courseCollection;


  List<Card> cards = [];



  @override
  void onInit() {
    courseCollection = firestore.collection('Videos');
    super.onInit();
  }

  getVideo() async {
    QuerySnapshot videoSnapshot = await courseCollection.get();
    final List<Card> retriveCard = videoSnapshot.docs.map((doc)) => Videos.fromJson(doc.data() as Map<>)

  }

}