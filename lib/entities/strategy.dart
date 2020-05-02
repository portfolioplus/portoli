import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'entity.dart';
import 'dart:convert';

@immutable
class StrategyEntity extends Equatable implements Entity {
  final String id;
  final String description;
  final bool enable;
  final String filterName;
  final int iconColor;
  final int iconId;
  final int iconSize;
  final String name;
  final String title;
  final String queryCollection;
  final int queryLimit;
  final List<dynamic> queryOrder;
  final List<dynamic> queryWhere;

  StrategyEntity(
    this.id,
    this.description,
    this.enable,
    this.filterName, 
    this.iconColor, 
    this.iconId,
    this.iconSize, 
    this.name, 
    this.title, 
    this.queryCollection,
    this.queryLimit,
    this.queryOrder,
    this.queryWhere
  );


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'filterName': filterName,
      'title': title,
      'description': description,
      'enable': enable,
      'icon': {
        'color': iconColor,
        'size': iconSize,
        'id': iconId
      },
      'query': {
        'collection': queryCollection,
        'limit': queryLimit,
        'order': queryOrder,
        'where': queryWhere
      }
    };
  }

  String toHash() {
    String str = toJson().toString();
    return base64.encode(utf8.encode(str));
  }

  @override
  String toString() {
    return 'StrategyEntity { id: $id, name: $name, description: $description, enable: $enable }';
  }

  static StrategyEntity fromJson(Map<String, dynamic> json) {
    return StrategyEntity(
      json['id'] as String,
      json['description'] as String,
      json['enable'] as bool,
      json['filterName'] as String,
      (json['icon'] as Map)['color'] as int,
      (json['icon'] as Map)['id'] as int,
      (json['icon'] as Map)['size'] as int,
      json['name'] as String,
      json['title'] as String,
      (json['query'] as Map)['collection'] as String,
      (json['query'] as Map)['limit'] as int,
      (json['query'] as Map)['order'] as List<dynamic>,
      (json['query'] as Map)['where'] as List<dynamic>,
    );
  }

  static StrategyEntity fromSnapshot(DocumentSnapshot snap) {
    return StrategyEntity(
      snap.documentID,
      snap.data['description'],
      snap.data['enable'],
      snap.data['filterName'],
      snap.data['icon']['color'],
      snap.data['icon']['id'],
      snap.data['icon']['size'],
      snap.data['name'],
      snap.data['title'],
      snap.data['query']['collection'],
      snap.data['query']['limit'],
      snap.data['query']['order'],
      snap.data['query']['where'],
    );
  }

  Map<String, Object> toDocument() {
    return toJson();
  }

  Query toQuery() {
    Query query = Firestore.instance.collection(this.queryCollection);
    // add where clausels
    queryWhere.forEach((where) {
      int value = where['value']  ?? (throw ArgumentError("value is required"));
      String operand = where['operator'] ?? (throw ArgumentError("operator is required"));
      String field = where['field'] ?? (throw ArgumentError("field is required"));
      if(operand == '>=') {
        query = query.where(field, isGreaterThanOrEqualTo: value);
      } else if(operand == '==') {
        query = query.where(field, isEqualTo: value);
      }  else if(operand == '>') {
        query = query.where(field, isGreaterThan: value);
      } else if(operand == '<') {
        query = query.where(field, isLessThan: value);
      } else {
        throw new FormatException("Unknown operator $operand."); 
      }
    });
    
    queryOrder.forEach((order) {
      bool descending = order['descending'] ?? false;
      String field = order['field'] ?? (throw ArgumentError("field is required"));
      query = query.orderBy(field, descending: descending);
    });
    return query.limit(this.queryLimit);
  }

  @override
  List<Object> get props => [id, description, enable, filterName, iconColor, iconId, iconSize, name, title, queryCollection, queryLimit, queryOrder, queryWhere];
}