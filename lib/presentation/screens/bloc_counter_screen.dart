import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: _CounterBlockView(textStyle: textStyle),
    );
  }
}

class _CounterBlockView extends StatelessWidget {
  const _CounterBlockView({
    required this.textStyle,
  });

  final TextTheme textStyle;

  void increaseCounterBy(BuildContext context, {int value = 1}) {
    // context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().increaseBy(value: value);
  }

  void resetCounter(BuildContext context) {
    // context.read<CounterBloc>().add(const CounterReset());
    context.read<CounterBloc>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: context.select(
            (CounterBloc counterBloc) =>
                Text("Bloc Counter: ${counterBloc.state.transactionCount}"),
          ),
          actions: [
            IconButton(
              onPressed: () => resetCounter(context),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Center(
          child: context.select(
            (CounterBloc counterBloc) => Text(
              "Counter value: ${counterBloc.state.counter}",
              style: textStyle.displaySmall,
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              onPressed: () => increaseCounterBy(context, value: 3),
              child: const Text("+3"),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () => increaseCounterBy(context, value: 2),
              child: const Text("+2"),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: '3',
              onPressed: () => increaseCounterBy(context),
              child: const Text("+1"),
            ),
          ],
        ));
  }
}
