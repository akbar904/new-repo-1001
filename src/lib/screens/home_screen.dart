
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animalswitcher/cubits/animal_cubit.dart';
import 'package:animalswitcher/models/animal_model.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Animal Switcher'),
			),
			body: BlocBuilder<AnimalCubit, Animal>(
				builder: (context, animal) {
					return Center(
						child: GestureDetector(
							onTap: () => context.read<AnimalCubit>().toggleAnimal(),
							child: Column(
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									Text(
										animal.name,
										style: TextStyle(fontSize: 24),
									),
									Icon(animal.icon, size: 48),
								],
							),
						),
					);
				},
			),
		);
	}
}
