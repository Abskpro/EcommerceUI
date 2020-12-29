import 'package:bloc/bloc.dart';

//observes the application for state change
class CategoriesObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}
