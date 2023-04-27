import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubitCounterView(
        textStyle: textStyle,
      ),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    required this.textStyle,
  });

  void increaseCounterBy(BuildContext context, int value) {
    context.read<CounterCubit>().increaseBy(value);
  }

  void resetCounter(BuildContext context) {
    context.read<CounterCubit>().reset();
  }

  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
        appBar: AppBar(
          title: context.select((CounterCubit value) {
            return Text("Cubit Counter: ${value.state.transactionCount}");
          }),
          actions: [
            IconButton(
              onPressed: () {
                resetCounter(context);
              },
              icon: const Icon(Icons.refresh_rounded),
            )
          ],
        ),
        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
            // buildWhen: (previous, current) =>
            //     current.counter != previous.counter,
            builder: (context, state) {
              return Text(
                "Counter value: ${state.counter}",
                style: textStyle.displaySmall,
              );
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              onPressed: () => increaseCounterBy(context, 3),
              child: const Text("+3"),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () => increaseCounterBy(context, 2),
              child: const Text("+2"),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: '3',
              onPressed: () => increaseCounterBy(context, 1),
              child: const Text("+1"),
            ),
          ],
        ));
  }
}
