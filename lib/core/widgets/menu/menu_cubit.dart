import 'package:bloc/bloc.dart';

class MenuCubit extends Cubit<int> {
  MenuCubit() : super(0);

  void setActiveMenu(int index) {
    emit(index);
  }
}
