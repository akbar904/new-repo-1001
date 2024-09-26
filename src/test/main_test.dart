
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animalswitcher/main.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('main.dart', () {
		group('MyApp', () {
			testWidgets('renders HomeScreen', (tester) async {
				await tester.pumpWidget(MyApp());
				expect(find.byType(HomeScreen), findsOneWidget);
			});
		});

		group('AnimalCubit', () {
			late MockAnimalCubit animalCubit;

			setUp(() {
				animalCubit = MockAnimalCubit();
			});

			blocTest<AnimalCubit, Animal>(
				'emits Dog when toggleAnimal is called',
				build: () => animalCubit,
				act: (cubit) => cubit.toggleAnimal(),
				expect: () => <Animal>[Animal(name: 'Dog', icon: Icons.person)],
			);

			blocTest<AnimalCubit, Animal>(
				'emits Cat when toggleAnimal is called again',
				build: () => animalCubit,
				act: (cubit) {
					cubit.toggleAnimal();
					cubit.toggleAnimal();
				},
				expect: () => <Animal>[
					Animal(name: 'Dog', icon: Icons.person),
					Animal(name: 'Cat', icon: Icons.access_time)
				],
			);
		});
	});
}
