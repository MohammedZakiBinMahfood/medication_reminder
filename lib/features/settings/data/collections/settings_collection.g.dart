// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsCollectionCollection on Isar {
  IsarCollection<SettingsCollection> get settingsCollections =>
      this.collection();
}

const SettingsCollectionSchema = CollectionSchema(
  name: r'SettingsCollection',
  id: 1768772991470096974,
  properties: {
    r'appVersion': PropertySchema(
      id: 0,
      name: r'appVersion',
      type: IsarType.string,
    ),
    r'autoBackupEnabled': PropertySchema(
      id: 1,
      name: r'autoBackupEnabled',
      type: IsarType.bool,
    ),
    r'buildNumber': PropertySchema(
      id: 2,
      name: r'buildNumber',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'defaultHistoryFilter': PropertySchema(
      id: 4,
      name: r'defaultHistoryFilter',
      type: IsarType.long,
    ),
    r'defaultHistoryGrouping': PropertySchema(
      id: 5,
      name: r'defaultHistoryGrouping',
      type: IsarType.long,
    ),
    r'defaultSnoozeMinutes': PropertySchema(
      id: 6,
      name: r'defaultSnoozeMinutes',
      type: IsarType.long,
    ),
    r'firstDayOfWeek': PropertySchema(
      id: 7,
      name: r'firstDayOfWeek',
      type: IsarType.long,
    ),
    r'isDeleted': PropertySchema(
      id: 8,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'language': PropertySchema(
      id: 9,
      name: r'language',
      type: IsarType.string,
    ),
    r'notificationSound': PropertySchema(
      id: 10,
      name: r'notificationSound',
      type: IsarType.bool,
    ),
    r'notificationsEnabled': PropertySchema(
      id: 11,
      name: r'notificationsEnabled',
      type: IsarType.bool,
    ),
    r'reminderBeforeMinutes': PropertySchema(
      id: 12,
      name: r'reminderBeforeMinutes',
      type: IsarType.long,
    ),
    r'themeMode': PropertySchema(
      id: 13,
      name: r'themeMode',
      type: IsarType.long,
    ),
    r'timeFormat24': PropertySchema(
      id: 14,
      name: r'timeFormat24',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 15,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(id: 16, name: r'uuid', type: IsarType.string),
    r'vibrationEnabled': PropertySchema(
      id: 17,
      name: r'vibrationEnabled',
      type: IsarType.bool,
    ),
  },

  estimateSize: _settingsCollectionEstimateSize,
  serialize: _settingsCollectionSerialize,
  deserialize: _settingsCollectionDeserialize,
  deserializeProp: _settingsCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _settingsCollectionGetId,
  getLinks: _settingsCollectionGetLinks,
  attach: _settingsCollectionAttach,
  version: '3.3.2',
);

int _settingsCollectionEstimateSize(
  SettingsCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.appVersion.length * 3;
  bytesCount += 3 + object.buildNumber.length * 3;
  bytesCount += 3 + object.language.length * 3;
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _settingsCollectionSerialize(
  SettingsCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.appVersion);
  writer.writeBool(offsets[1], object.autoBackupEnabled);
  writer.writeString(offsets[2], object.buildNumber);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeLong(offsets[4], object.defaultHistoryFilter);
  writer.writeLong(offsets[5], object.defaultHistoryGrouping);
  writer.writeLong(offsets[6], object.defaultSnoozeMinutes);
  writer.writeLong(offsets[7], object.firstDayOfWeek);
  writer.writeBool(offsets[8], object.isDeleted);
  writer.writeString(offsets[9], object.language);
  writer.writeBool(offsets[10], object.notificationSound);
  writer.writeBool(offsets[11], object.notificationsEnabled);
  writer.writeLong(offsets[12], object.reminderBeforeMinutes);
  writer.writeLong(offsets[13], object.themeMode);
  writer.writeBool(offsets[14], object.timeFormat24);
  writer.writeDateTime(offsets[15], object.updatedAt);
  writer.writeString(offsets[16], object.uuid);
  writer.writeBool(offsets[17], object.vibrationEnabled);
}

SettingsCollection _settingsCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsCollection();
  object.appVersion = reader.readString(offsets[0]);
  object.autoBackupEnabled = reader.readBool(offsets[1]);
  object.buildNumber = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.defaultHistoryFilter = reader.readLong(offsets[4]);
  object.defaultHistoryGrouping = reader.readLong(offsets[5]);
  object.defaultSnoozeMinutes = reader.readLong(offsets[6]);
  object.firstDayOfWeek = reader.readLong(offsets[7]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[8]);
  object.language = reader.readString(offsets[9]);
  object.notificationSound = reader.readBool(offsets[10]);
  object.notificationsEnabled = reader.readBool(offsets[11]);
  object.reminderBeforeMinutes = reader.readLong(offsets[12]);
  object.themeMode = reader.readLong(offsets[13]);
  object.timeFormat24 = reader.readBool(offsets[14]);
  object.updatedAt = reader.readDateTime(offsets[15]);
  object.uuid = reader.readString(offsets[16]);
  object.vibrationEnabled = reader.readBool(offsets[17]);
  return object;
}

P _settingsCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsCollectionGetId(SettingsCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsCollectionGetLinks(
  SettingsCollection object,
) {
  return [];
}

void _settingsCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  SettingsCollection object,
) {
  object.id = id;
}

extension SettingsCollectionByIndex on IsarCollection<SettingsCollection> {
  Future<SettingsCollection?> getByUuid(String uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  SettingsCollection? getByUuidSync(String uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<SettingsCollection?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<SettingsCollection?> getAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(SettingsCollection object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(SettingsCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<SettingsCollection> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(
    List<SettingsCollection> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension SettingsCollectionQueryWhereSort
    on QueryBuilder<SettingsCollection, SettingsCollection, QWhere> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsCollectionQueryWhere
    on QueryBuilder<SettingsCollection, SettingsCollection, QWhereClause> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
  uuidEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'uuid', value: [uuid]),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
  uuidNotEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [],
                upper: [uuid],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [uuid],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [uuid],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [],
                upper: [uuid],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension SettingsCollectionQueryFilter
    on QueryBuilder<SettingsCollection, SettingsCollection, QFilterCondition> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  appVersionEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'appVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  appVersionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'appVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  appVersionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'appVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  appVersionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'appVersion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  appVersionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'appVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  appVersionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'appVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  appVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'appVersion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  appVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'appVersion',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  appVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'appVersion', value: ''),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  appVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'appVersion', value: ''),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  autoBackupEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'autoBackupEnabled', value: value),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  buildNumberEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'buildNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  buildNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'buildNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  buildNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'buildNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  buildNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'buildNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  buildNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'buildNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  buildNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'buildNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  buildNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'buildNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  buildNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'buildNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  buildNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'buildNumber', value: ''),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  buildNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'buildNumber', value: ''),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultHistoryFilterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'defaultHistoryFilter',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultHistoryFilterGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'defaultHistoryFilter',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultHistoryFilterLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'defaultHistoryFilter',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultHistoryFilterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'defaultHistoryFilter',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultHistoryGroupingEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'defaultHistoryGrouping',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultHistoryGroupingGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'defaultHistoryGrouping',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultHistoryGroupingLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'defaultHistoryGrouping',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultHistoryGroupingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'defaultHistoryGrouping',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultSnoozeMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'defaultSnoozeMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultSnoozeMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'defaultSnoozeMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultSnoozeMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'defaultSnoozeMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  defaultSnoozeMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'defaultSnoozeMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  firstDayOfWeekEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'firstDayOfWeek', value: value),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  firstDayOfWeekGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'firstDayOfWeek',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  firstDayOfWeekLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'firstDayOfWeek',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  firstDayOfWeekBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'firstDayOfWeek',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDeleted', value: value),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  languageEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  languageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  languageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  languageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'language',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  languageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  languageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'language',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  languageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'language',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'language', value: ''),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'language', value: ''),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  notificationSoundEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notificationSound', value: value),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  notificationsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notificationsEnabled',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  reminderBeforeMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reminderBeforeMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  reminderBeforeMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reminderBeforeMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  reminderBeforeMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reminderBeforeMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  reminderBeforeMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reminderBeforeMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  themeModeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'themeMode', value: value),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  themeModeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'themeMode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  themeModeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'themeMode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  themeModeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'themeMode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  timeFormat24EqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timeFormat24', value: value),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  uuidEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  uuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  uuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  uuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'uuid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  uuidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  uuidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'uuid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uuid', value: ''),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uuid', value: ''),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
  vibrationEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'vibrationEnabled', value: value),
      );
    });
  }
}

extension SettingsCollectionQueryObject
    on QueryBuilder<SettingsCollection, SettingsCollection, QFilterCondition> {}

extension SettingsCollectionQueryLinks
    on QueryBuilder<SettingsCollection, SettingsCollection, QFilterCondition> {}

extension SettingsCollectionQuerySortBy
    on QueryBuilder<SettingsCollection, SettingsCollection, QSortBy> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByAppVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appVersion', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByAppVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appVersion', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByAutoBackupEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoBackupEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByAutoBackupEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoBackupEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByBuildNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildNumber', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByBuildNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildNumber', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByDefaultHistoryFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultHistoryFilter', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByDefaultHistoryFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultHistoryFilter', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByDefaultHistoryGrouping() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultHistoryGrouping', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByDefaultHistoryGroupingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultHistoryGrouping', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByDefaultSnoozeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultSnoozeMinutes', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByDefaultSnoozeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultSnoozeMinutes', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByFirstDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstDayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByFirstDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstDayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByNotificationSound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationSound', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByNotificationSoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationSound', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByReminderBeforeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderBeforeMinutes', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByReminderBeforeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderBeforeMinutes', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByTimeFormat24() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeFormat24', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByTimeFormat24Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeFormat24', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByVibrationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  sortByVibrationEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.desc);
    });
  }
}

extension SettingsCollectionQuerySortThenBy
    on QueryBuilder<SettingsCollection, SettingsCollection, QSortThenBy> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByAppVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appVersion', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByAppVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appVersion', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByAutoBackupEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoBackupEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByAutoBackupEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoBackupEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByBuildNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildNumber', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByBuildNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildNumber', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByDefaultHistoryFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultHistoryFilter', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByDefaultHistoryFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultHistoryFilter', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByDefaultHistoryGrouping() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultHistoryGrouping', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByDefaultHistoryGroupingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultHistoryGrouping', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByDefaultSnoozeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultSnoozeMinutes', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByDefaultSnoozeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultSnoozeMinutes', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByFirstDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstDayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByFirstDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstDayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByNotificationSound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationSound', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByNotificationSoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationSound', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByReminderBeforeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderBeforeMinutes', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByReminderBeforeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderBeforeMinutes', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByTimeFormat24() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeFormat24', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByTimeFormat24Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeFormat24', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByVibrationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
  thenByVibrationEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.desc);
    });
  }
}

extension SettingsCollectionQueryWhereDistinct
    on QueryBuilder<SettingsCollection, SettingsCollection, QDistinct> {
  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByAppVersion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appVersion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByAutoBackupEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoBackupEnabled');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByBuildNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buildNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByDefaultHistoryFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultHistoryFilter');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByDefaultHistoryGrouping() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultHistoryGrouping');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByDefaultSnoozeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultSnoozeMinutes');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByFirstDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstDayOfWeek');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByNotificationSound() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationSound');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationsEnabled');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByReminderBeforeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderBeforeMinutes');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeMode');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByTimeFormat24() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeFormat24');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
  distinctByVibrationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vibrationEnabled');
    });
  }
}

extension SettingsCollectionQueryProperty
    on QueryBuilder<SettingsCollection, SettingsCollection, QQueryProperty> {
  QueryBuilder<SettingsCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingsCollection, String, QQueryOperations>
  appVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appVersion');
    });
  }

  QueryBuilder<SettingsCollection, bool, QQueryOperations>
  autoBackupEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoBackupEnabled');
    });
  }

  QueryBuilder<SettingsCollection, String, QQueryOperations>
  buildNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buildNumber');
    });
  }

  QueryBuilder<SettingsCollection, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SettingsCollection, int, QQueryOperations>
  defaultHistoryFilterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultHistoryFilter');
    });
  }

  QueryBuilder<SettingsCollection, int, QQueryOperations>
  defaultHistoryGroupingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultHistoryGrouping');
    });
  }

  QueryBuilder<SettingsCollection, int, QQueryOperations>
  defaultSnoozeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultSnoozeMinutes');
    });
  }

  QueryBuilder<SettingsCollection, int, QQueryOperations>
  firstDayOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstDayOfWeek');
    });
  }

  QueryBuilder<SettingsCollection, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<SettingsCollection, String, QQueryOperations>
  languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<SettingsCollection, bool, QQueryOperations>
  notificationSoundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationSound');
    });
  }

  QueryBuilder<SettingsCollection, bool, QQueryOperations>
  notificationsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationsEnabled');
    });
  }

  QueryBuilder<SettingsCollection, int, QQueryOperations>
  reminderBeforeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderBeforeMinutes');
    });
  }

  QueryBuilder<SettingsCollection, int, QQueryOperations> themeModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeMode');
    });
  }

  QueryBuilder<SettingsCollection, bool, QQueryOperations>
  timeFormat24Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeFormat24');
    });
  }

  QueryBuilder<SettingsCollection, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<SettingsCollection, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }

  QueryBuilder<SettingsCollection, bool, QQueryOperations>
  vibrationEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vibrationEnabled');
    });
  }
}
