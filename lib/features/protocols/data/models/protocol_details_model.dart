import 'package:equatable/equatable.dart';

class ProtocolDetailsModel extends Equatable {
  final List<ProtocolPhaseModel> phases;

  @override
  List<Object?> get props => [phases];

  const ProtocolDetailsModel({
    required this.phases,
  });

  factory ProtocolDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProtocolDetailsModel(
      phases: (json['phases'] as List<dynamic>?)
              ?.map((phase) => ProtocolPhaseModel.fromJson(phase))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phases': phases.map((phase) => phase.toJson()).toList(),
    };
  }
}

class ProtocolPhaseModel extends Equatable {
  final String phaseName;
  final String phaseTitle;
  final List<String> rehabGoals;
  final List<String> criteriaToProgress;
  final List<String> impairments;
  final List<ProtocolInterventionModel> interventions;
  final List<String> goals;
  final String rationale;

  @override
  List<Object?> get props => [
        phaseName,
        phaseTitle,
        rehabGoals,
        criteriaToProgress,
        impairments,
        interventions,
        goals,
        rationale,
      ];

  const ProtocolPhaseModel({
    required this.phaseName,
    required this.phaseTitle,
    required this.rehabGoals,
    required this.criteriaToProgress,
    required this.impairments,
    required this.interventions,
    required this.goals,
    required this.rationale,
  });

  factory ProtocolPhaseModel.fromJson(Map<String, dynamic> json) {
    return ProtocolPhaseModel(
      phaseName: json['phaseName'] ?? '',
      phaseTitle: json['phaseTitle'] ?? '',
      rehabGoals: List<String>.from(json['rehabGoals'] ?? []),
      criteriaToProgress: List<String>.from(json['criteriaToProgress'] ?? []),
      impairments: List<String>.from(json['impairments'] ?? []),
      interventions: (json['interventions'] as List<dynamic>?)
              ?.map((i) => ProtocolInterventionModel.fromJson(i))
              .toList() ??
          [],
      goals: List<String>.from(json['goals'] ?? []),
      rationale: json['rationale'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phaseName': phaseName,
      'phaseTitle': phaseTitle,
      'rehabGoals': rehabGoals,
      'criteriaToProgress': criteriaToProgress,
      'impairments': impairments,
      'interventions': interventions.map((i) => i.toJson()).toList(),
      'goals': goals,
      'rationale': rationale,
    };
  }
}

class ProtocolInterventionModel extends Equatable {
  final String name;
  final List<String> items;

  @override
  List<Object?> get props => [name, items];

  const ProtocolInterventionModel({
    required this.name,
    required this.items,
  });

  factory ProtocolInterventionModel.fromJson(Map<String, dynamic> json) {
    return ProtocolInterventionModel(
      name: json['name'] ?? '',
      items: List<String>.from(json['items'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'items': items,
    };
  }
}
