class SoccerMatch {
  Fixture fixture;
  Team home;
  Team away;
  Goal goal;
  SoccerMatch(this.fixture, this.home, this.away, this.goal);

  factory SoccerMatch.fromJson(Map<String, dynamic> json) {
    return SoccerMatch(
      Fixture.fromJson(json['fixture']),
      Team.fromJson(json['teams']['home']),
      Team.fromJson(json['teams']['away']),
      Goal.fromJson(json['goals']),
    );
  }
}

//store the fixture
class Fixture {
  int id;
  String date;
  Status status;
  Fixture(this.id, this.date, this.status);
  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      json['id'],
      json['date'],
      Status.fromJson(json['status']),
    );
  }
}

//store the status
class Status {
  int elapsed;
  String long;
  Status(this.elapsed, this.long);
  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      json['elapsed'],
      json['long'],
    );
  }
}

//store team data
class Team {
  int id;
  String name;
  String logoUrl;
  bool winner;
  Team(this.id, this.name, this.logoUrl, this.winner);
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      json['id'],
      json['name'],
      json['logo'],
      json['winner'],
    );
  }
}

//store the goal data
class Goal {
  int home;
  int away;
  Goal(this.home, this.away);
  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      json['home'],
      json['away'],
    );
  }
}
