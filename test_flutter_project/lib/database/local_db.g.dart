// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class LocalPhotoData extends DataClass implements Insertable<LocalPhotoData> {
  final int id;
  final int pageNo;
  final String link;
  final String linkSrc;
  LocalPhotoData(
      {required this.id,
      required this.pageNo,
      required this.link,
      required this.linkSrc});
  factory LocalPhotoData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return LocalPhotoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      pageNo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}page_no'])!,
      link: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link'])!,
      linkSrc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link_src'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['page_no'] = Variable<int>(pageNo);
    map['link'] = Variable<String>(link);
    map['link_src'] = Variable<String>(linkSrc);
    return map;
  }

  LocalPhotoCompanion toCompanion(bool nullToAbsent) {
    return LocalPhotoCompanion(
      id: Value(id),
      pageNo: Value(pageNo),
      link: Value(link),
      linkSrc: Value(linkSrc),
    );
  }

  factory LocalPhotoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalPhotoData(
      id: serializer.fromJson<int>(json['id']),
      pageNo: serializer.fromJson<int>(json['pageNo']),
      link: serializer.fromJson<String>(json['link']),
      linkSrc: serializer.fromJson<String>(json['linkSrc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pageNo': serializer.toJson<int>(pageNo),
      'link': serializer.toJson<String>(link),
      'linkSrc': serializer.toJson<String>(linkSrc),
    };
  }

  LocalPhotoData copyWith(
          {int? id, int? pageNo, String? link, String? linkSrc}) =>
      LocalPhotoData(
        id: id ?? this.id,
        pageNo: pageNo ?? this.pageNo,
        link: link ?? this.link,
        linkSrc: linkSrc ?? this.linkSrc,
      );
  @override
  String toString() {
    return (StringBuffer('LocalPhotoData(')
          ..write('id: $id, ')
          ..write('pageNo: $pageNo, ')
          ..write('link: $link, ')
          ..write('linkSrc: $linkSrc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pageNo, link, linkSrc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalPhotoData &&
          other.id == this.id &&
          other.pageNo == this.pageNo &&
          other.link == this.link &&
          other.linkSrc == this.linkSrc);
}

class LocalPhotoCompanion extends UpdateCompanion<LocalPhotoData> {
  final Value<int> id;
  final Value<int> pageNo;
  final Value<String> link;
  final Value<String> linkSrc;
  const LocalPhotoCompanion({
    this.id = const Value.absent(),
    this.pageNo = const Value.absent(),
    this.link = const Value.absent(),
    this.linkSrc = const Value.absent(),
  });
  LocalPhotoCompanion.insert({
    this.id = const Value.absent(),
    required int pageNo,
    required String link,
    required String linkSrc,
  })  : pageNo = Value(pageNo),
        link = Value(link),
        linkSrc = Value(linkSrc);
  static Insertable<LocalPhotoData> custom({
    Expression<int>? id,
    Expression<int>? pageNo,
    Expression<String>? link,
    Expression<String>? linkSrc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pageNo != null) 'page_no': pageNo,
      if (link != null) 'link': link,
      if (linkSrc != null) 'link_src': linkSrc,
    });
  }

  LocalPhotoCompanion copyWith(
      {Value<int>? id,
      Value<int>? pageNo,
      Value<String>? link,
      Value<String>? linkSrc}) {
    return LocalPhotoCompanion(
      id: id ?? this.id,
      pageNo: pageNo ?? this.pageNo,
      link: link ?? this.link,
      linkSrc: linkSrc ?? this.linkSrc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pageNo.present) {
      map['page_no'] = Variable<int>(pageNo.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (linkSrc.present) {
      map['link_src'] = Variable<String>(linkSrc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalPhotoCompanion(')
          ..write('id: $id, ')
          ..write('pageNo: $pageNo, ')
          ..write('link: $link, ')
          ..write('linkSrc: $linkSrc')
          ..write(')'))
        .toString();
  }
}

class $LocalPhotoTable extends LocalPhoto
    with TableInfo<$LocalPhotoTable, LocalPhotoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalPhotoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _pageNoMeta = const VerificationMeta('pageNo');
  @override
  late final GeneratedColumn<int?> pageNo = GeneratedColumn<int?>(
      'page_no', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String?> link = GeneratedColumn<String?>(
      'link', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _linkSrcMeta = const VerificationMeta('linkSrc');
  @override
  late final GeneratedColumn<String?> linkSrc = GeneratedColumn<String?>(
      'link_src', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, pageNo, link, linkSrc];
  @override
  String get aliasedName => _alias ?? 'local_photo';
  @override
  String get actualTableName => 'local_photo';
  @override
  VerificationContext validateIntegrity(Insertable<LocalPhotoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('page_no')) {
      context.handle(_pageNoMeta,
          pageNo.isAcceptableOrUnknown(data['page_no']!, _pageNoMeta));
    } else if (isInserting) {
      context.missing(_pageNoMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('link_src')) {
      context.handle(_linkSrcMeta,
          linkSrc.isAcceptableOrUnknown(data['link_src']!, _linkSrcMeta));
    } else if (isInserting) {
      context.missing(_linkSrcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalPhotoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return LocalPhotoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocalPhotoTable createAlias(String alias) {
    return $LocalPhotoTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $LocalPhotoTable localPhoto = $LocalPhotoTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [localPhoto];
}
