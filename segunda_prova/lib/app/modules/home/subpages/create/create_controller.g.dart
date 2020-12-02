// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CreateController = BindInject(
  (i) => CreateController(i<HomeRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateController on _CreateControllerBase, Store {
  final _$titleAtom = Atom(name: '_CreateControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$bodyAtom = Atom(name: '_CreateControllerBase.body');

  @override
  String get body {
    _$bodyAtom.reportRead();
    return super.body;
  }

  @override
  set body(String value) {
    _$bodyAtom.reportWrite(value, super.body, () {
      super.body = value;
    });
  }

  final _$statusAtom = Atom(name: '_CreateControllerBase.status');

  @override
  CreateStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(CreateStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$CreatePostsAsyncAction =
      AsyncAction('_CreateControllerBase.CreatePosts');

  @override
  Future<void> CreatePosts() {
    return _$CreatePostsAsyncAction.run(() => super.CreatePosts());
  }

  final _$_CreateControllerBaseActionController =
      ActionController(name: '_CreateControllerBase');

  @override
  dynamic changeTitle(String value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.changeTitle');
    try {
      return super.changeTitle(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBody(String value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.changeBody');
    try {
      return super.changeBody(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
body: ${body},
status: ${status}
    ''';
  }
}
