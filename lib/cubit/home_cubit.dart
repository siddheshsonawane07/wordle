import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/data_singleton.dart';
import '../enums/keyboard_keys.dart';
import '../enums/letter.dart';
import '../enums/message_types.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  DataSingleton data = DataSingleton();

  void setLetter(KeyboardKeys key) {
    if (data.setLetter(key)) {
      emit(GridUpdateState());
    }
  }

  void removeLetter() {
    data.removeLetter();
    emit(GridUpdateState());
  }

  bool submitWord() {
    final state = data.submitWord();
    if (state is GridUpdateState ||
        state is WinGameState ||
        state is LoseGameState) {
      emit(state);
      if (state is WinGameState) {
        emit(GridUpdateState());
      }
      return true;
    }else if(state is SnackBarMessage){
      emit(state);
      return false;
    }
    return false;
  }

  void updateKey(KeyboardKeys key, Letter letterType) {
    emit(KeyboardKeyUpdateState(key, letterType));
  }

  Future clearGameArea() async {
    data.resetData();
    await data.createWord();
    emit(HomeInitial());
  }
}