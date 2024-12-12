class SoccerMatch {
  Fixture fixture;
  Team home;
  Team away;
  Goal goal;
  SoccerMatch(this.fixture, this.home, this.away, this.goal);

  factory SoccerMatch.fromjson(Map<String, dynamic> jason) {
    return SoccerMatch(
      Fixture.fromjson(jason['fixture']),
      Team.fromjson(jason['teams']['home']),
      Team.fromjson(jason['teams']['away']),
      Goal.fromjson(jason['goals']),
    );
  }
}

//store the fixture
class Fixture {
  int id;
  int date;
  Status status;
  Fixture(this.id, this.date, this.status);
  factory Fixture.fromjson(Map<String, dynamic> jason) {
    return Fixture(
      jason['id'],
      jason['date'],
      Status.fromjson(jason['status']),
    );
  }
}

//store the status
class Status {
  int elapsed;
  String long;
  Status(this.elapsed, this.long);
  factory Status.fromjson(Map<String, dynamic> jason) {
    return Status(
      jason['elapsed'],
      jason['long'],
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
  factory Team.fromjson(Map<String, dynamic> jason) {
    return Team(
      jason['id'],
      jason['name'],
      jason['logo'],
      jason['winner'],
    );
  }
}

//store the goal data
class Goal {
  int home;
  int away;
  Goal(this.home, this.away);
  factory Goal.fromjson(Map<String, dynamic> jason) {
    return Goal(
      jason['home'],
      jason['away'],
    );
  }
}
