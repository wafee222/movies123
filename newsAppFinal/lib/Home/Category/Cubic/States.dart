import '../../Model/SourceResponce.dart';

class SourceStates{}
class SourceInitialState extends SourceStates{}
class SourceSuccessState extends SourceStates{
  List<Source> sourceList ;
  SourceSuccessState({required this.sourceList});
}
class SourceLoadingState extends SourceStates{}
class SourceErrorState extends SourceStates{
  String errorMessage;
  SourceErrorState({required this.errorMessage});
}
