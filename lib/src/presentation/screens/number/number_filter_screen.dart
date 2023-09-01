import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophos_app/src/presentation/blogs/blogs.dart';
import 'package:sophos_app/src/presentation/blogs/numer_blog/number_state.dart';
import 'package:sophos_app/src/presentation/widgets/widgets.dart';

class NumberFilterScreen extends StatelessWidget {
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final numberCubit = BlocProvider.of<NumberCubit>(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:CustomTextField( // Usa el TextField personalizado
            controller: _inputController,
            labelText: 'Enter Numbers (comma-separated)',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            numberCubit.filterNumbers(_inputController.text);
          },
          child: Text('Filter Numbers'),
        ),
        BlocBuilder<NumberCubit, NumberState>(
          builder: (context, state) {
            if (state is NumberInitial) {
              return Text('Enter numbers and click "Filter Numbers"');
            } else if (state is NumberLoaded) {
              return Text('Even Numbers: ${state.numbers}');
            } else if (state is NumberError) {
              return Text('Error: ${state.message}');
            } else {
              return Text('Other State (you can customize this)');
            }
          },
        )
      ],
    );
  }
}
