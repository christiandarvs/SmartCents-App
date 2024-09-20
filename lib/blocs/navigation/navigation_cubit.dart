import 'package:bloc/bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0); // Initial tab is 0

  void changeTab(int index) {
    emit(index); // Emit the new index to update the current tab
  }
}
