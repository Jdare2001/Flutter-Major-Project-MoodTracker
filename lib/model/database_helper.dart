// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moodtracker/utilities/date_time_converter.dart';

class DatabaseHelper {
  final db = FirebaseFirestore.instance;
  Future<String?> getUserName(User? currentUser) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');
      final snapshot = await users.doc(currentUser!.email).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data['username'];
    } catch (e) {
      return "no name";
    }
  }

  Future<double?> getPercentDone(User? currentUser) async {
    double percentage;
    try {
      int totalPosHab = 0;
      int posHabDone = 0;
      await db
          .collection("Users")
          .doc(currentUser!.email)
          .collection('Habits')
          .get()
          .then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            if (docSnapshot.get('positiveOrNeg') == true) {
              totalPosHab++;
              if (docSnapshot.get('isChecked') == true) {
                posHabDone++;
              }
            }
          }
        },
      );
      if (totalPosHab == 0) {
        percentage = 0;
      } else {
        percentage = posHabDone / totalPosHab;
      }
      return percentage;
    } catch (e) {
      return 0.0;
    }
  }

  Future<void> updateDocumentsDaily(User? currentUser) async {
    final CollectionReference collectionRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .collection('Habits');

    QuerySnapshot querySnapshot = await collectionRef.get();

    // Iterate through the documents
    querySnapshot.docs.forEach((doc) async {
      if (doc['isChecked'] == true) {
        if (doc['dateChecked'] != todaysDateFormatedString()) {
          await collectionRef.doc(doc.id).update({
            'isChecked': false,
          });
        }
      }
    });
  }

  Future<List<String?>> getHabitsTypeList(
      User? currentUser, bool posOrNeg) async {
    final CollectionReference collectionRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .collection('Habits');

    QuerySnapshot querySnapshot = await collectionRef.get();

    List<String?> posTypeList = [];

    // Iterate through the documents
    querySnapshot.docs.forEach((doc) async {
      if (doc['isChecked'] == true) {
        if (doc['positiveOrNeg'] == posOrNeg) {
          posTypeList.add(doc['habitType']);
        }
      }
    });
    return posTypeList;
  }

  Future<int> getPosOrNegCount(User? currentUser, bool posOrNeg) async {
    final CollectionReference collectionRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .collection('Habits');

    QuerySnapshot querySnapshot = await collectionRef.get();

    int counter = 0;

    // Iterate through the documents
    querySnapshot.docs.forEach((doc) async {
      if (doc['positiveOrNeg'] == posOrNeg) {
        counter++;
      }
    });
    return counter;
  }

  Future<double?> getHappinessAdverage(User? currentUser) async {
    double adv = 0.0;
    int count = 0;
    int sevenDaysAgo = getSevenDaysAgo();
    final CollectionReference collectionRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .collection('DailyCheckIn');

    QuerySnapshot querySnapshot = await collectionRef.get();

    // Iterate through the documents
    querySnapshot.docs.forEach((doc) async {
      if (int.parse(doc['date']) > sevenDaysAgo) {
        adv = adv + doc['happinessValue'];
        count++;
      }
    });
    adv = adv / count;
    return adv;
  }
}
