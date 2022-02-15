///
//  Generated code. Do not modify.
//  source: get_dir_content.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;

class SingleFile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SingleFile', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deepcare.get_dir_content'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.OU3)
    ..aOM<$0.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  SingleFile._() : super();
  factory SingleFile({
    $core.String? name,
    $core.int? size,
    $0.Timestamp? time,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (size != null) {
      _result.size = size;
    }
    if (time != null) {
      _result.time = time;
    }
    return _result;
  }
  factory SingleFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SingleFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SingleFile clone() => SingleFile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SingleFile copyWith(void Function(SingleFile) updates) => super.copyWith((message) => updates(message as SingleFile)) as SingleFile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SingleFile create() => SingleFile._();
  SingleFile createEmptyInstance() => create();
  static $pb.PbList<SingleFile> createRepeated() => $pb.PbList<SingleFile>();
  @$core.pragma('dart2js:noInline')
  static SingleFile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingleFile>(create);
  static SingleFile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get size => $_getIZ(1);
  @$pb.TagNumber(2)
  set size($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get time => $_getN(2);
  @$pb.TagNumber(3)
  set time($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureTime() => $_ensure(2);
}

class GetDirContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetDirContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deepcare.get_dir_content'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..pc<SingleFile>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'files', $pb.PbFieldType.PM, subBuilder: SingleFile.create)
    ..hasRequiredFields = false
  ;

  GetDirContent._() : super();
  factory GetDirContent({
    $core.String? path,
    $core.Iterable<SingleFile>? files,
  }) {
    final _result = create();
    if (path != null) {
      _result.path = path;
    }
    if (files != null) {
      _result.files.addAll(files);
    }
    return _result;
  }
  factory GetDirContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDirContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDirContent clone() => GetDirContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDirContent copyWith(void Function(GetDirContent) updates) => super.copyWith((message) => updates(message as GetDirContent)) as GetDirContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDirContent create() => GetDirContent._();
  GetDirContent createEmptyInstance() => create();
  static $pb.PbList<GetDirContent> createRepeated() => $pb.PbList<GetDirContent>();
  @$core.pragma('dart2js:noInline')
  static GetDirContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDirContent>(create);
  static GetDirContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<SingleFile> get files => $_getList(1);
}

