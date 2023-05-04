import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit()
      : super(
          const RestaurantsState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  Future<void> start() async {
    emit(
      const RestaurantsState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    // ignore: no_leading_underscores_for_local_identifiers
    StreamSubscription? _streamSubscription;

    _streamSubscription = FirebaseFirestore.instance
        .collection('restaurants')
        .orderBy(
          'rating',
          descending: true,
        )
        .snapshots()
        .listen(
      (data) {
        emit(
          RestaurantsState(
            documents: data.docs,
            errorMessage: '',
            isLoading: false,
          ),
        );
      },
    )..onError((error) {
        emit(
          RestaurantsState(
            documents: const [],
            errorMessage: error.toString(),
            isLoading: false,
          ),
        );
      });
    @override
    // ignore: unused_element
    Future<void> close() {
      _streamSubscription?.cancel();
      return super.close();
    }
  }
}
