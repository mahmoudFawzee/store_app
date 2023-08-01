import 'package:bloc/bloc.dart';

class FavCubit extends Cubit<bool> {
  FavCubit({required bool isFav}) : super(isFav);
  changeFavState() => emit(!state);
}
