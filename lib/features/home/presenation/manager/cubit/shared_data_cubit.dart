import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shared_data_state.dart';

class SharedDataCubit extends Cubit<SharedDataState> {
  SharedDataCubit() : super(SharedDataInitial());
  String topic = ""; 
}
