class Survey {
  String id;
  Target target;
  String title;
  String description;
  List<Question> questions;
  bool active;
  DateTime createdAt;

  Survey({
    required this.id,
    required this.target,
    required this.title,
    required this.description,
    required this.questions,
    required this.active,
    required this.createdAt,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      id: json['_id'] ?? '',
      target: Target.fromJson(json['target']),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      questions: (json['questions'] as List)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
      active: json['active'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'target': target.toJson(),
      'title': title,
      'description': description,
      'questions': questions.map((q) => q.toJson()).toList(),
      'active': active,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class Target {
  AgeRange ageRange;
  String geographicScope;
  String occupation;

  Target({
    required this.ageRange,
    required this.geographicScope,
    required this.occupation,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      ageRange: AgeRange.fromJson(json['ageRange']),
      geographicScope: json['geographicScope'] ?? '',
      occupation: json['occupation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ageRange': ageRange.toJson(),
      'geographicScope': geographicScope,
      'occupation': occupation,
    };
  }
}

class AgeRange {
  int min;
  int max;

  AgeRange({required this.min, required this.max});

  factory AgeRange.fromJson(Map<String, dynamic> json) {
    return AgeRange(
      min: json['min'] ?? 0,
      max: json['max'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
    };
  }
}

class Question {
  QuestionText question;
  String type;
  List<String> options;
  String id;

  Question({
    required this.question,
    required this.type,
    required this.options,
    required this.id,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: QuestionText.fromJson(json['question']),
      type: json['type'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question.toJson(),
      'type': type,
      'options': options,
      '_id': id,
    };
  }
}

class QuestionText {
  String ar;
  String en;

  QuestionText({
    required this.ar,
    required this.en,
  });

  factory QuestionText.fromJson(Map<String, dynamic> json) {
    return QuestionText(
      ar: json['ar'] ?? '',
      en: json['en'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ar': ar,
      'en': en,
    };
  }
}
