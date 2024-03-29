import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Home/Api/Api%20manager.dart';
import 'package:news/Home/Category/Cubic/States.dart';
import '../../../Model/sourceResponce.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates> {
  CategoryDetailsViewModel() : super(SourceLoadingState());

  void getSource(String categoryId) async {
    emit(SourceLoadingState());
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message ?? 'Unknown error'));
      } else {
        emit(SourceSuccessState(sourceList: response!.sources ?? []));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: 'Error loading list'));
    }
  }
}
