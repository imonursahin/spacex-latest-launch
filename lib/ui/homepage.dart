// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/bloc/spacex_bloc.dart';
import 'package:spacex/model/spacex_model.dart';

import '../services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SpacexModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('SpaceX'),
          centerTitle: true,
        ),
        body: BlocProvider(
            create: (context) =>
                SpacexBloc(RepositoryProvider.of<SpacexService>(context))
                  ..add(SpacexLoadEvent()),
            child: Center(
              child: BlocBuilder<SpacexBloc, SpacexState>(
                builder: (context, state) {
                  if (state is SpacexError) {
                    return Text(
                      state.message,
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    );
                  } else if (state is SpacexLoaded) {
                    return _buildSpacexCard(
                      model: state.model,
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            )));
  }
}

Container _buildSpacexCard({required SpacexModel model}) {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        Image.network(model.links!.patch!.small ?? 'not found img'),
        const SizedBox(
          height: 15,
        ),
        _buildInfo(model, 'Name: ', (model.name ?? 'not found name')),
        const Divider(color: Colors.green),
        _buildInfo(
            model, 'Flight Number: ', (model.flightNumber ?? 0).toString()),
        const Divider(color: Colors.green),
        _buildInfo(model, 'Date: ', (model.dateUtc ?? 'not found date')),
        const Divider(color: Colors.green),
        _buildInfo(model, 'Success: ', (model.success ?? false).toString()),
        const Divider(color: Colors.green),
        _buildInfo(model, 'Details: ', (model.details ?? 'not found details')),
      ],
    ),
  );
}

Row _buildInfo(SpacexModel model, String title, String description) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      Text(
        description,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
