import 'package:bloc/bloc.dart';

class CategoriesCubit extends Cubit<int> {
  CategoriesCubit() : super(0);

  void change(index) => {
        if (index > state)
          {emit(state + (index - state))}
        else
          {emit(state - (state - index))}
      };
}
