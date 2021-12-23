import 'package:ble_data_transfer_demo/generated/stats.pb.dart';

enum DeviceStatisticsMode { unknown, normal, observer, workout, backpain, standing, water }

class DeviceStatistics {
  double standTime = 0.000000001;
  double sitTime = 0.000000001;

  double ergonomic = 0.0;
  double hunching = 0.0;
  double layBack = 0.0;

  double met = 0.0;

  double arm = 0.0;
  double leg = 0.0;
  double back = 0.0;
  double head = 0.0;
  double shoulder = 0.0;

  int exercises = 0;
  int breaks = 0;
  int poseChanges = 0;

  double standingInRow = 0.0;
  double sittingInRow = 0.0;

  double water = 0.0;

  double movement = 0.0;

  DeviceStatistics(
      this.standTime,
      this.sitTime,
      this.ergonomic,
      this.hunching,
      this.layBack,
      this.met,
      this.arm,
      this.leg,
      this.back,
      this.head,
      this.shoulder,
      this.exercises,
      this.breaks,
      this.poseChanges,
      this.standingInRow,
      this.sittingInRow,
      this.movement,
      this.water);

  DeviceStatisticsMode mode = DeviceStatisticsMode.unknown;

  DeviceStatistics.fromProto(Statistics proto) {
    standTime = proto.standtime;
    sitTime = proto.sittime;
    ergonomic = proto.ergonomic;
    hunching = proto.hunching;
    layBack = proto.layback;
    met = proto.met;
    arm = proto.arm;
    leg = proto.leg;
    back = proto.back;
    head = proto.head;
    shoulder = proto.shoulder;
    exercises = proto.exercises;
    breaks = proto.breaks;
    poseChanges = proto.poseChanges;
    standingInRow = proto.standingInRow;
    sittingInRow = proto.sittingInRow;
    water = proto.water;
    movement = proto.movement;

    switch (proto.mode) {
      case Statistics_Mode.UNKNOWN:
        mode = DeviceStatisticsMode.unknown;
        break;
      case Statistics_Mode.NORMAL:
        mode = DeviceStatisticsMode.normal;
        break;
      case Statistics_Mode.BACKPAIN:
        mode = DeviceStatisticsMode.backpain;
        break;
      case Statistics_Mode.WORKOUT:
        mode = DeviceStatisticsMode.workout;
        break;
      case Statistics_Mode.OBSERVER:
        mode = DeviceStatisticsMode.observer;
        break;
      case Statistics_Mode.STANDING:
        mode = DeviceStatisticsMode.standing;
        break;
      case Statistics_Mode.WATER:
        mode = DeviceStatisticsMode.water;
        break;
    }
  }

  DeviceStatistics.empty();

  @override
  String toString() {
    return 'DeviceStatistics: standTime: $standTime\nergonomic: $ergonomic\nmode: ${mode.index}';
  }
}
