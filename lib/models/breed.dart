import 'image.dart';

class Breed {
  final String id;
  final String name;
  final String temperament;
  final String? life_span;
 final String? alt_names;
final String? wikipedia_url;
 final String? origin;
 final String? weight_imperial;
 final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  final int? suppress_tail;
  final int? short_legs;
  final int? hypoallergenic;
  final int? adaptability;
  final int? affection_level;
  final String? country_code;
  final int? child_friendly;
  final int? dog_friendly;
  final int? energy_level;
  final int? grooming;
  final int? health_issues;
  final int? intelligence;
  final int? shedding_level;
  final int? social_needs;
  final int? stranger_friendly;
  final int? vocalisation;
  final Image? image;

  Breed(
      { required this.id,
        required this.name,
        required this.temperament,
        required this.life_span,
       required this.alt_names,
        required this.wikipedia_url,
  required this.origin,
    required this.weight_imperial,
        required this.experimental,
  required this.hairless,
        required this.natural,
        required this.rare,
        required this.rex,
        required this.suppress_tail,
        required this.short_legs,
        required this.hypoallergenic,
        required this.adaptability,
        required this.affection_level,
        required this.country_code,
        required this.child_friendly,
        required this.dog_friendly,
        required this.energy_level,
        required this.grooming,
        required this.health_issues,
        required this.intelligence,
        required this.shedding_level,
        required this.social_needs,
        required this.stranger_friendly,
        required this.vocalisation,
       required this.image}
      );
  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
        id: json['id'],
        name: json['name'],
        temperament: json ['temperament'],
        life_span: json['life_span'] ,
       alt_names:json['alt_names'],
        wikipedia_url:json['wikipedia_url'],
        origin:json['origin'],
        weight_imperial: json['weight_imperial'],
        experimental:json['experimental'],
        hairless:json['hairless'],
        natural: json['natural'],
        rare: json['rare'],
        rex: json['rex'],
        suppress_tail: json['suppress_tail'],
        short_legs: json['short legs'],
        hypoallergenic: json['hypoallergenic'],
        adaptability: json['adaptability'],
        affection_level: json['affection level'],
        country_code: json['country_code'],
        child_friendly: json['child_friendly'],
        dog_friendly: json['dog_friendly'],
        energy_level: json['energy_level'],
        grooming: json['groomig'],
        health_issues: json['health_issues'],
        intelligence: json['intelligence'],
        shedding_level: json['sheeding_level'],
        social_needs: json['social_needs'],
        stranger_friendly: json['stranger_friendly'],
        vocalisation: json['vocalisation'],

        image:
        json.containsKey('image') ? Image.fromJson(json['image']) : null);
  }
}

