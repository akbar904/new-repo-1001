
import 'package:flutter/material.dart';

class Animal {
	final String name;
	final IconData icon;

	Animal({
		required this.name,
		required this.icon,
	});

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;

		return other is Animal &&
			other.name == name &&
			other.icon == icon;
	}

	@override
	int get hashCode => name.hashCode ^ icon.hashCode;

	@override
	String toString() => 'Animal(name: $name, icon: $icon)';
}
