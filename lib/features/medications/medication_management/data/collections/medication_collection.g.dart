// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicationCollectionCollection on Isar {
  IsarCollection<MedicationCollection> get medicationCollections =>
      this.collection();
}

const MedicationCollectionSchema = CollectionSchema(
  name: r'MedicationCollection',
  id: -7306647530144697029,
  properties: {
    r'color': PropertySchema(id: 0, name: r'color', type: IsarType.string),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dosage': PropertySchema(id: 2, name: r'dosage', type: IsarType.string),
    r'foodInstruction': PropertySchema(
      id: 3,
      name: r'foodInstruction',
      type: IsarType.int,
    ),
    r'imagePath': PropertySchema(
      id: 4,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(id: 5, name: r'isActive', type: IsarType.bool),
    r'isDeleted': PropertySchema(
      id: 6,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(id: 7, name: r'name', type: IsarType.string),
    r'priority': PropertySchema(id: 8, name: r'priority', type: IsarType.int),
    r'profileUuid': PropertySchema(
      id: 9,
      name: r'profileUuid',
      type: IsarType.string,
    ),
    r'reorderThreshold': PropertySchema(
      id: 10,
      name: r'reorderThreshold',
      type: IsarType.long,
    ),
    r'stockQuantity': PropertySchema(
      id: 11,
      name: r'stockQuantity',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(id: 13, name: r'uuid', type: IsarType.string),
  },

  estimateSize: _medicationCollectionEstimateSize,
  serialize: _medicationCollectionSerialize,
  deserialize: _medicationCollectionDeserialize,
  deserializeProp: _medicationCollectionDeserializeProp,
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
    r'profileUuid': IndexSchema(
      id: 1129968050600041444,
      name: r'profileUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'profileUuid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'isActive': IndexSchema(
      id: 8092228061260947457,
      name: r'isActive',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isActive',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _medicationCollectionGetId,
  getLinks: _medicationCollectionGetLinks,
  attach: _medicationCollectionAttach,
  version: '3.3.2',
);

int _medicationCollectionEstimateSize(
  MedicationCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.color.length * 3;
  bytesCount += 3 + object.dosage.length * 3;
  {
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.profileUuid.length * 3;
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _medicationCollectionSerialize(
  MedicationCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.color);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.dosage);
  writer.writeInt(offsets[3], object.foodInstruction);
  writer.writeString(offsets[4], object.imagePath);
  writer.writeBool(offsets[5], object.isActive);
  writer.writeBool(offsets[6], object.isDeleted);
  writer.writeString(offsets[7], object.name);
  writer.writeInt(offsets[8], object.priority);
  writer.writeString(offsets[9], object.profileUuid);
  writer.writeLong(offsets[10], object.reorderThreshold);
  writer.writeLong(offsets[11], object.stockQuantity);
  writer.writeDateTime(offsets[12], object.updatedAt);
  writer.writeString(offsets[13], object.uuid);
}

MedicationCollection _medicationCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MedicationCollection();
  object.color = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.dosage = reader.readString(offsets[2]);
  object.foodInstruction = reader.readInt(offsets[3]);
  object.id = id;
  object.imagePath = reader.readStringOrNull(offsets[4]);
  object.isActive = reader.readBool(offsets[5]);
  object.isDeleted = reader.readBool(offsets[6]);
  object.name = reader.readString(offsets[7]);
  object.priority = reader.readInt(offsets[8]);
  object.profileUuid = reader.readString(offsets[9]);
  object.reorderThreshold = reader.readLongOrNull(offsets[10]);
  object.stockQuantity = reader.readLongOrNull(offsets[11]);
  object.updatedAt = reader.readDateTime(offsets[12]);
  object.uuid = reader.readString(offsets[13]);
  return object;
}

P _medicationCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readInt(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readInt(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _medicationCollectionGetId(MedicationCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _medicationCollectionGetLinks(
  MedicationCollection object,
) {
  return [];
}

void _medicationCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  MedicationCollection object,
) {
  object.id = id;
}

extension MedicationCollectionByIndex on IsarCollection<MedicationCollection> {
  Future<MedicationCollection?> getByUuid(String uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  MedicationCollection? getByUuidSync(String uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<MedicationCollection?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<MedicationCollection?> getAllByUuidSync(List<String> uuidValues) {
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

  Future<Id> putByUuid(MedicationCollection object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(MedicationCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<MedicationCollection> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(
    List<MedicationCollection> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension MedicationCollectionQueryWhereSort
    on QueryBuilder<MedicationCollection, MedicationCollection, QWhere> {
  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhere>
  anyIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isActive'),
      );
    });
  }
}

extension MedicationCollectionQueryWhere
    on QueryBuilder<MedicationCollection, MedicationCollection, QWhereClause> {
  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
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

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
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

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
  uuidEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'uuid', value: [uuid]),
      );
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
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

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
  profileUuidEqualTo(String profileUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'profileUuid',
          value: [profileUuid],
        ),
      );
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
  profileUuidNotEqualTo(String profileUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileUuid',
                lower: [],
                upper: [profileUuid],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileUuid',
                lower: [profileUuid],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileUuid',
                lower: [profileUuid],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileUuid',
                lower: [],
                upper: [profileUuid],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
  isActiveEqualTo(bool isActive) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'isActive', value: [isActive]),
      );
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterWhereClause>
  isActiveNotEqualTo(bool isActive) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isActive',
                lower: [],
                upper: [isActive],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isActive',
                lower: [isActive],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isActive',
                lower: [isActive],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isActive',
                lower: [],
                upper: [isActive],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension MedicationCollectionQueryFilter
    on
        QueryBuilder<
          MedicationCollection,
          MedicationCollection,
          QFilterCondition
        > {
  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  colorEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  colorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  colorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  colorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'color',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  colorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  colorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  colorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  colorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'color',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  colorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'color', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  colorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'color', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  dosageEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dosage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  dosageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dosage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  dosageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dosage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  dosageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dosage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  dosageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'dosage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  dosageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'dosage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  dosageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'dosage',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  dosageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'dosage',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  dosageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dosage', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  dosageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'dosage', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  foodInstructionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'foodInstruction', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  foodInstructionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'foodInstruction',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  foodInstructionLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'foodInstruction',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  foodInstructionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'foodInstruction',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'imagePath'),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'imagePath'),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'imagePath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'imagePath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'imagePath', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'imagePath', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDeleted', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'priority', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  priorityGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'priority',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  priorityLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'priority',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  priorityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'priority',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  profileUuidEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  profileUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  profileUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  profileUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'profileUuid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  profileUuidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  profileUuidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  profileUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  profileUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'profileUuid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  profileUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'profileUuid', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  profileUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'profileUuid', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  reorderThresholdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'reorderThreshold'),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  reorderThresholdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'reorderThreshold'),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  reorderThresholdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reorderThreshold', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  reorderThresholdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reorderThreshold',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  reorderThresholdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reorderThreshold',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  reorderThresholdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reorderThreshold',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  stockQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'stockQuantity'),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  stockQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'stockQuantity'),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  stockQuantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stockQuantity', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  stockQuantityGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stockQuantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  stockQuantityLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stockQuantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  stockQuantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stockQuantity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uuid', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationCollection,
    MedicationCollection,
    QAfterFilterCondition
  >
  uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uuid', value: ''),
      );
    });
  }
}

extension MedicationCollectionQueryObject
    on
        QueryBuilder<
          MedicationCollection,
          MedicationCollection,
          QFilterCondition
        > {}

extension MedicationCollectionQueryLinks
    on
        QueryBuilder<
          MedicationCollection,
          MedicationCollection,
          QFilterCondition
        > {}

extension MedicationCollectionQuerySortBy
    on QueryBuilder<MedicationCollection, MedicationCollection, QSortBy> {
  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByFoodInstruction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodInstruction', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByFoodInstructionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodInstruction', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByProfileUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileUuid', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByProfileUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileUuid', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByReorderThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderThreshold', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByReorderThresholdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderThreshold', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByStockQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByStockQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension MedicationCollectionQuerySortThenBy
    on QueryBuilder<MedicationCollection, MedicationCollection, QSortThenBy> {
  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByFoodInstruction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodInstruction', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByFoodInstructionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodInstruction', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByProfileUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileUuid', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByProfileUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileUuid', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByReorderThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderThreshold', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByReorderThresholdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderThreshold', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByStockQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByStockQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QAfterSortBy>
  thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension MedicationCollectionQueryWhereDistinct
    on QueryBuilder<MedicationCollection, MedicationCollection, QDistinct> {
  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByColor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByDosage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByFoodInstruction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodInstruction');
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByImagePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByProfileUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profileUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByReorderThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reorderThreshold');
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByStockQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockQuantity');
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<MedicationCollection, MedicationCollection, QDistinct>
  distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension MedicationCollectionQueryProperty
    on
        QueryBuilder<
          MedicationCollection,
          MedicationCollection,
          QQueryProperty
        > {
  QueryBuilder<MedicationCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MedicationCollection, String, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<MedicationCollection, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MedicationCollection, String, QQueryOperations>
  dosageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosage');
    });
  }

  QueryBuilder<MedicationCollection, int, QQueryOperations>
  foodInstructionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodInstruction');
    });
  }

  QueryBuilder<MedicationCollection, String?, QQueryOperations>
  imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<MedicationCollection, bool, QQueryOperations>
  isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<MedicationCollection, bool, QQueryOperations>
  isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<MedicationCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MedicationCollection, int, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<MedicationCollection, String, QQueryOperations>
  profileUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileUuid');
    });
  }

  QueryBuilder<MedicationCollection, int?, QQueryOperations>
  reorderThresholdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reorderThreshold');
    });
  }

  QueryBuilder<MedicationCollection, int?, QQueryOperations>
  stockQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockQuantity');
    });
  }

  QueryBuilder<MedicationCollection, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<MedicationCollection, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
