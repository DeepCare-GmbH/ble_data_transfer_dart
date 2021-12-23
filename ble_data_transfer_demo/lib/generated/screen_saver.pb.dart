///
//  Generated code. Do not modify.
//  source: screen_saver.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ScreenSaver extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScreenSaver', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'background')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'movement')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ergonomic')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'aok')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backgroundImage', protoName: 'backgroundImage')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'workingTime', protoName: 'workingTime')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buzzer')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'water')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'waterGoal', $pb.PbFieldType.OF, protoName: 'waterGoal')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..hasRequiredFields = false
  ;

  ScreenSaver._() : super();
  factory ScreenSaver({
    $core.bool? date,
    $core.bool? time,
    $core.bool? background,
    $core.bool? movement,
    $core.bool? ergonomic,
    $core.bool? aok,
    $core.String? backgroundImage,
    $core.bool? workingTime,
    $core.bool? buzzer,
    $core.bool? water,
    $core.double? waterGoal,
    $core.String? username,
  }) {
    final _result = create();
    if (date != null) {
      _result.date = date;
    }
    if (time != null) {
      _result.time = time;
    }
    if (background != null) {
      _result.background = background;
    }
    if (movement != null) {
      _result.movement = movement;
    }
    if (ergonomic != null) {
      _result.ergonomic = ergonomic;
    }
    if (aok != null) {
      _result.aok = aok;
    }
    if (backgroundImage != null) {
      _result.backgroundImage = backgroundImage;
    }
    if (workingTime != null) {
      _result.workingTime = workingTime;
    }
    if (buzzer != null) {
      _result.buzzer = buzzer;
    }
    if (water != null) {
      _result.water = water;
    }
    if (waterGoal != null) {
      _result.waterGoal = waterGoal;
    }
    if (username != null) {
      _result.username = username;
    }
    return _result;
  }
  factory ScreenSaver.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScreenSaver.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScreenSaver clone() => ScreenSaver()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScreenSaver copyWith(void Function(ScreenSaver) updates) => super.copyWith((message) => updates(message as ScreenSaver)) as ScreenSaver; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenSaver create() => ScreenSaver._();
  ScreenSaver createEmptyInstance() => create();
  static $pb.PbList<ScreenSaver> createRepeated() => $pb.PbList<ScreenSaver>();
  @$core.pragma('dart2js:noInline')
  static ScreenSaver getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScreenSaver>(create);
  static ScreenSaver? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get date => $_getBF(0);
  @$pb.TagNumber(1)
  set date($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get time => $_getBF(1);
  @$pb.TagNumber(2)
  set time($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get background => $_getBF(2);
  @$pb.TagNumber(3)
  set background($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBackground() => $_has(2);
  @$pb.TagNumber(3)
  void clearBackground() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get movement => $_getBF(3);
  @$pb.TagNumber(4)
  set movement($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMovement() => $_has(3);
  @$pb.TagNumber(4)
  void clearMovement() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get ergonomic => $_getBF(4);
  @$pb.TagNumber(5)
  set ergonomic($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasErgonomic() => $_has(4);
  @$pb.TagNumber(5)
  void clearErgonomic() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get aok => $_getBF(5);
  @$pb.TagNumber(6)
  set aok($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAok() => $_has(5);
  @$pb.TagNumber(6)
  void clearAok() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get backgroundImage => $_getSZ(6);
  @$pb.TagNumber(7)
  set backgroundImage($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBackgroundImage() => $_has(6);
  @$pb.TagNumber(7)
  void clearBackgroundImage() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get workingTime => $_getBF(7);
  @$pb.TagNumber(8)
  set workingTime($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasWorkingTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearWorkingTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get buzzer => $_getBF(8);
  @$pb.TagNumber(9)
  set buzzer($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBuzzer() => $_has(8);
  @$pb.TagNumber(9)
  void clearBuzzer() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get water => $_getBF(9);
  @$pb.TagNumber(10)
  set water($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasWater() => $_has(9);
  @$pb.TagNumber(10)
  void clearWater() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get waterGoal => $_getN(10);
  @$pb.TagNumber(11)
  set waterGoal($core.double v) { $_setFloat(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasWaterGoal() => $_has(10);
  @$pb.TagNumber(11)
  void clearWaterGoal() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get username => $_getSZ(11);
  @$pb.TagNumber(12)
  set username($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasUsername() => $_has(11);
  @$pb.TagNumber(12)
  void clearUsername() => clearField(12);
}

