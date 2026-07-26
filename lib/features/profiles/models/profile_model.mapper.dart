// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'profile_model.dart';

class ProfileModelMapper extends ClassMapperBase<ProfileModel> {
  ProfileModelMapper._();

  static ProfileModelMapper? _instance;
  static ProfileModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfileModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProfileModel';

  static String _$uuid(ProfileModel v) => v.uuid;
  static const Field<ProfileModel, String> _f$uuid = Field('uuid', _$uuid);
  static String _$name(ProfileModel v) => v.name;
  static const Field<ProfileModel, String> _f$name = Field('name', _$name);
  static String _$color(ProfileModel v) => v.color;
  static const Field<ProfileModel, String> _f$color = Field('color', _$color);
  static int _$avatarIconCodePoint(ProfileModel v) => v.avatarIconCodePoint;
  static const Field<ProfileModel, int> _f$avatarIconCodePoint = Field(
    'avatarIconCodePoint',
    _$avatarIconCodePoint,
  );
  static bool _$isDefault(ProfileModel v) => v.isDefault;
  static const Field<ProfileModel, bool> _f$isDefault = Field(
    'isDefault',
    _$isDefault,
  );
  static int _$sortOrder(ProfileModel v) => v.sortOrder;
  static const Field<ProfileModel, int> _f$sortOrder = Field(
    'sortOrder',
    _$sortOrder,
  );
  static DateTime _$createdAt(ProfileModel v) => v.createdAt;
  static const Field<ProfileModel, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static DateTime _$updatedAt(ProfileModel v) => v.updatedAt;
  static const Field<ProfileModel, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
  );

  @override
  final MappableFields<ProfileModel> fields = const {
    #uuid: _f$uuid,
    #name: _f$name,
    #color: _f$color,
    #avatarIconCodePoint: _f$avatarIconCodePoint,
    #isDefault: _f$isDefault,
    #sortOrder: _f$sortOrder,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static ProfileModel _instantiate(DecodingData data) {
    return ProfileModel(
      uuid: data.dec(_f$uuid),
      name: data.dec(_f$name),
      color: data.dec(_f$color),
      avatarIconCodePoint: data.dec(_f$avatarIconCodePoint),
      isDefault: data.dec(_f$isDefault),
      sortOrder: data.dec(_f$sortOrder),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProfileModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProfileModel>(map);
  }

  static ProfileModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProfileModel>(json);
  }
}

mixin ProfileModelMappable {
  String toJson() {
    return ProfileModelMapper.ensureInitialized().encodeJson<ProfileModel>(
      this as ProfileModel,
    );
  }

  Map<String, dynamic> toMap() {
    return ProfileModelMapper.ensureInitialized().encodeMap<ProfileModel>(
      this as ProfileModel,
    );
  }

  ProfileModelCopyWith<ProfileModel, ProfileModel, ProfileModel> get copyWith =>
      _ProfileModelCopyWithImpl<ProfileModel, ProfileModel>(
        this as ProfileModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProfileModelMapper.ensureInitialized().stringifyValue(
      this as ProfileModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProfileModelMapper.ensureInitialized().equalsValue(
      this as ProfileModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ProfileModelMapper.ensureInitialized().hashValue(
      this as ProfileModel,
    );
  }
}

extension ProfileModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProfileModel, $Out> {
  ProfileModelCopyWith<$R, ProfileModel, $Out> get $asProfileModel =>
      $base.as((v, t, t2) => _ProfileModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProfileModelCopyWith<$R, $In extends ProfileModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uuid,
    String? name,
    String? color,
    int? avatarIconCodePoint,
    bool? isDefault,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  ProfileModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProfileModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProfileModel, $Out>
    implements ProfileModelCopyWith<$R, ProfileModel, $Out> {
  _ProfileModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProfileModel> $mapper =
      ProfileModelMapper.ensureInitialized();
  @override
  $R call({
    String? uuid,
    String? name,
    String? color,
    int? avatarIconCodePoint,
    bool? isDefault,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => $apply(
    FieldCopyWithData({
      if (uuid != null) #uuid: uuid,
      if (name != null) #name: name,
      if (color != null) #color: color,
      if (avatarIconCodePoint != null)
        #avatarIconCodePoint: avatarIconCodePoint,
      if (isDefault != null) #isDefault: isDefault,
      if (sortOrder != null) #sortOrder: sortOrder,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
    }),
  );
  @override
  ProfileModel $make(CopyWithData data) => ProfileModel(
    uuid: data.get(#uuid, or: $value.uuid),
    name: data.get(#name, or: $value.name),
    color: data.get(#color, or: $value.color),
    avatarIconCodePoint: data.get(
      #avatarIconCodePoint,
      or: $value.avatarIconCodePoint,
    ),
    isDefault: data.get(#isDefault, or: $value.isDefault),
    sortOrder: data.get(#sortOrder, or: $value.sortOrder),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  ProfileModelCopyWith<$R2, ProfileModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProfileModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

