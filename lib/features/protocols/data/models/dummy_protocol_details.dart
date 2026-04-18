class DummyProtocolDetails {
  final String title;
  final String subtitle;
  final List<String> tags;
  final String durationWeeks;
  final String totalSessions;
  final String sessionDuration;
  final List<DummyProtocolPhase> phases;

  DummyProtocolDetails({
    required this.title,
    required this.subtitle,
    required this.tags,
    required this.durationWeeks,
    required this.totalSessions,
    required this.sessionDuration,
    required this.phases,
  });
}

class DummyProtocolPhase {
  final String phaseName;
  final String phaseTitle;
  final List<String> rehabGoals;
  final List<String> criteriaToProgress;
  final List<String> impairments;
  final List<DummyIntervention> interventions;
  final List<String> goals;
  final String rationale;

  DummyProtocolPhase({
    required this.phaseName,
    required this.phaseTitle,
    required this.rehabGoals,
    required this.criteriaToProgress,
    required this.impairments,
    required this.interventions,
    required this.goals,
    required this.rationale,
  });
}

class DummyIntervention {
  final String name;
  final List<String> items;

  DummyIntervention({
    required this.name,
    required this.items,
  });
}

final DummyProtocolDetails dummyProtocolDetailsData = DummyProtocolDetails(
  title: 'Protocol Details',
  subtitle: 'Knee Recovery - 8 Weeks',
  tags: ['Knee Rehab', '18 Sessions', 'Intermediate', '3 Phases'],
  durationWeeks: '6',
  totalSessions: '18',
  sessionDuration: '45m',
  phases: [
    DummyProtocolPhase(
      phaseName: 'Phase 1',
      phaseTitle: 'Pain Management',
      rehabGoals: [
        'Protect the joint and reduce pain.',
        'Minimize swelling and inflammation.',
        'Restore patellar mobility & full passive extension.',
        'Re-establish basic quad control & patient education.',
      ],
      criteriaToProgress: [
        'Pain ≤ 3/10 VAS at rest.',
        'Full passive knee ROM.',
        'No significant joint effusion; independent with HEP.',
      ],
      impairments: [
        'Acute pain, limited ROM (< 90°), quadriceps atrophy, and antalgic gait pattern.',
      ],
      interventions: [
        DummyIntervention(
          name: 'PRICE Protocol',
          items: ['Protection, Rest, Ice, Compression, Elevation.'],
        ),
        DummyIntervention(
          name: 'TENS / IPT',
          items: ['Transcutaneous Electrical Nerve Stimulation.'],
        ),
        DummyIntervention(
          name: 'Exercises',
          items: [
            'Isometric quad sets',
            'Ankle pumps',
            'Patella mobilizations',
            'Cryotherapy',
            'SLR in all planes'
          ],
        ),
      ],
      goals: [
        'Achieve passive ROM 0-90°',
        'Reduce pain',
        'Ambulate independently',
      ],
      rationale:
          'Early ROM preservation helps avoid arthrofibrosis. Pain management reduces central sensitization.',
    ),
    DummyProtocolPhase(
      phaseName: 'Phase 2',
      phaseTitle: 'Strength & Mobility',
      rehabGoals: [
        'Improve quadriceps strength.',
        'Progress to full active ROM.',
        'Normalize gait pattern.',
      ],
      criteriaToProgress: [
        'Full active ROM.',
        'Symmetrical gait.',
        'Ability to perform straight leg raise without extension lag.',
      ],
      impairments: [
        'Decreased muscle strength, mild mobility deficits.',
      ],
      interventions: [
        DummyIntervention(
          name: 'Strengthening',
          items: ['Mini squats', 'Leg press', 'Hamstring curls'],
        ),
      ],
      goals: [
        'Regain 80% strength compared to uninjured leg.',
      ],
      rationale: 'Gradual loading promotes tissue healing and remodeling.',
    ),
    DummyProtocolPhase(
      phaseName: 'Phase 3',
      phaseTitle: 'Return to Activity',
      rehabGoals: [
        'Sport-specific or activity-specific training.',
        'Maximize strength and endurance.',
      ],
      criteriaToProgress: [
        '90% strength and hop test symmetry.',
        'Pain-free during all activities.',
      ],
      impairments: [
        'Mild deficits in power and agility.',
      ],
      interventions: [
        DummyIntervention(
          name: 'Agility',
          items: ['Plyometrics', 'Cutting drills', 'Running program'],
        ),
      ],
      goals: [
        'Return to full unrestricted activity.',
      ],
      rationale: 'Simulating activity demands prepares the tissue for normal function.',
    ),
  ],
);
