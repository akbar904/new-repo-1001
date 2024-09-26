
// test/models/animal_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:animalswitcher/models/animal_model.dart';

void main() {
	group('Animal model tests', () {
		test('Animal should have a name and an icon', () {
			final animal = Animal(name: 'Cat', icon: Icons.access_time);
			expect(animal.name, 'Cat');
			expect(animal.icon, Icons.access_time);
		});

		test('Animal model should support equality based on name and icon', () {
			final animal1 = Animal(name: 'Cat', icon: Icons.access_time);
			final animal2 = Animal(name: 'Cat', icon: Icons.access_time);
			final animal3 = Animal(name: 'Dog', icon: Icons.person);

			expect(animal1, equals(animal2));
			expect(animal1, isNot(equals(animal3)));
		});

		test('Animal model should have a toString method', () {
			final animal = Animal(name: 'Cat', icon: Icons.access_time);
			expect(animal.toString(), 'Animal(name: Cat, icon: IconData(U+0E192))');
		});
	});
}
