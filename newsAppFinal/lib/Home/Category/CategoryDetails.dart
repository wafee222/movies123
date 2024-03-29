import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model/Category.dart';
import '../MyTheme.dart';
import '../News/TabWidget.dart';
import 'Cubic/CatViewModel.dart';
import 'Cubic/States.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'categoryDetails';
  final CategoryDM category;

  const CategoryDetails({required this.category});

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late CategoryDetailsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CategoryDetailsViewModel();
    viewModel.getSource(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryDetailsViewModel, SourceStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.errorMessage),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getSource(widget.category.id);
                  },
                  child: Text('Try Again'),
                ),
              ],
            );
          } else if (state is SourceLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              ),
            );
          } else if (state is SourceSuccessState) {
            final sourceList = state.sourceList;
            return TabWidget(sourceList: sourceList);
          } else {
            return Container(); // Placeholder, you may want to handle other states
          }
        },
      ),
    );
  }
}
