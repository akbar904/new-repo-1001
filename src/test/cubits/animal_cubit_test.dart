
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animalswitcher/cubits/animal_cubit.dart';
import 'package:animalswitcher/models/animal_model.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is Cat', () {
			expect(animalCubit.state, Animal(name: 'Cat', icon: Icons.access_time));
		});

		blocTest<AnimalCubit, Animal>(
			'emits Dog when toggleAnimal is called from Cat state',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [Animal(name: 'Dog', icon: Icons.person)],
		);

		blocTest<AnimalCubit, Animal>(
			'emits Cat when toggleAnimal is called from Dog state',
			build: () {
				animalCubit.toggleAnimal(); // Move to Dog state first
				return animalCubit;
			},
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [Animal(name: 'Cat', icon: Icons.access_time)],
		);
	});
}
