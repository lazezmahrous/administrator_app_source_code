import 'package:bloc/bloc.dart';


import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:meta/meta.dart';


part 'complet_order_state.dart';


class CompletOrderCubit extends Cubit<CompletOrderState> {

  CompletOrderCubit() : super(CompletOrderInitial());


  Future<void> completOrder({

    required String centerName,

    required String association,

    required String itemName,

    required String amountUnit,

    required double decreaseAmount,

    required double tonUnitPrice,

    required double keloUnitPrice,

  }) async {

    emit(CompletOrderLoading());


    try {

      DocumentSnapshot<Map<String, dynamic>> itemOrignal =

          await FirebaseFirestore.instance

              .collection('administration')

              .doc(itemName)

              .get();


      final Map<String, dynamic> dataMap =

          itemOrignal.data() as Map<String, dynamic>;


      final String amountString = dataMap['amount'] as String;


      final List<String> splitted = amountString.split(" ");


      double amount = double.tryParse(splitted[0]) ?? 0.0;


      print("amount: $amount");


      if (amountString.isNotEmpty) {

        if (splitted.length == 2) {

          final double orignalAmount = double.parse(splitted[0]);


          final orignalUnit = splitted[1].trim();


          if (orignalAmount <= 0) {

            emit(CompletOrderFailure());

          } else {

            if (amountUnit.contains('كيلو')) {

              if (orignalUnit == "طن" && decreaseAmount <= 1000) {

                double keloUnit = orignalAmount * 1000.0;


                double newAmount = keloUnit - decreaseAmount;


                print('kelooUnit : $keloUnit');


                print('keloo : $newAmount');


                await FirebaseFirestore.instance

                    .collection(centerName)

                    .doc(association)

                    .collection('items')

                    .doc(itemName)

                    .update({

                  "amount": '$decreaseAmount $amountUnit',

                  "keloUnitPrice": keloUnitPrice,

                  "TonUnitPrice": tonUnitPrice,

                });


                await FirebaseFirestore.instance

                    .collection('administration')

                    .doc(itemName)

                    .update({

                  'amount': '${newAmount / 1000} $orignalUnit',

                });


                emit(CompletOrderSuccess());

              } else if (orignalUnit == "كيلو" &&

                  decreaseAmount <= orignalAmount) {

                double newAmount = orignalAmount - decreaseAmount;


                print('kelooUnit : $newAmount');


                await FirebaseFirestore.instance

                    .collection(centerName)

                    .doc(association)

                    .collection('items')

                    .doc(itemName)

                    .update({

                  "amount": '$decreaseAmount $amountUnit',

                  "keloUnitPrice": keloUnitPrice,

                  "TonUnitPrice": tonUnitPrice,

                });


                await FirebaseFirestore.instance

                    .collection('administration')

                    .doc(itemName)

                    .update({

                  'amount': '$newAmount $amountUnit',

                });


                emit(CompletOrderSuccess());

              } else {

                emit(CompletOrderFailure());

              }

            } else if (amountUnit.contains('طن')) {

              if (orignalUnit == "كيلو") {

                emit(CompletOrderFailure());

              } else if (orignalUnit == 'طن' &&

                  decreaseAmount <= orignalAmount) {

                double newAmount = orignalAmount - decreaseAmount;


                print('kelooUnit : $newAmount');


                await FirebaseFirestore.instance

                    .collection(centerName)

                    .doc(association)

                    .collection('items')

                    .doc(itemName)

                    .update({

                  "amount": '$decreaseAmount $amountUnit',

                  "keloUnitPrice": keloUnitPrice,

                  "TonUnitPrice": tonUnitPrice,

                });


                await FirebaseFirestore.instance

                    .collection('administration')

                    .doc(itemName)

                    .update({

                  'amount': '$newAmount $orignalUnit',

                });


                emit(CompletOrderSuccess());

              } else {

                emit(CompletOrderFailure());

              }

            }

          }

        } else if (splitted.length == 1) {

          emit(CompletOrderFailure());

        } else {

          emit(CompletOrderFailure());

        }

      }

    } catch (e) {

      emit(CompletOrderFailure());


      print(e.toString());

    }


    // DocumentSnapshot<Map<String, dynamic>> itemOrignal = await FirebaseFirestore


    //     .instance


    //     .collection(centerName)


    //     .doc(association)


    //     .collection('items')


    //     .doc(itemName)


    //     .get();


    //     if (itemOrignal['amount'].toDouble() < decreaseAmount) {


    //       emit(CompletOrderFailure());


    //     } else {


    //       double newAmount = itemOrignal['amount'].toDouble() - decreaseAmount;


    //       await FirebaseFirestore.instance


    //           .collection(centerName)


    //           .doc(association)


    //           .collection('items')


    //           .doc(itemName)


    //           .update({


    //         "amount": newAmount,


    //       });


    //       emit(CompletOrderSuccess());


    //     }


    //   } catch (e) {


    //     print(e.toString());


    //   }


    // }


    //     print(e.toString());


    //   }

  }

}

