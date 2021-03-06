// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_episode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WatchEpisodeStore on _WatchEpisodeStoreBase, Store {
  final _$episodeDetailsAtom =
      Atom(name: '_WatchEpisodeStoreBase.episodeDetails');

  @override
  EpisodeDetails get episodeDetails {
    _$episodeDetailsAtom.reportRead();
    return super.episodeDetails;
  }

  @override
  set episodeDetails(EpisodeDetails value) {
    _$episodeDetailsAtom.reportWrite(value, super.episodeDetails, () {
      super.episodeDetails = value;
    });
  }

  final _$loadingWatchEpisodeAtom =
      Atom(name: '_WatchEpisodeStoreBase.loadingWatchEpisode');

  @override
  bool get loadingWatchEpisode {
    _$loadingWatchEpisodeAtom.reportRead();
    return super.loadingWatchEpisode;
  }

  @override
  set loadingWatchEpisode(bool value) {
    _$loadingWatchEpisodeAtom.reportWrite(value, super.loadingWatchEpisode, () {
      super.loadingWatchEpisode = value;
    });
  }

  final _$loadingOtherEpisodeAtom =
      Atom(name: '_WatchEpisodeStoreBase.loadingOtherEpisode');

  @override
  bool get loadingOtherEpisode {
    _$loadingOtherEpisodeAtom.reportRead();
    return super.loadingOtherEpisode;
  }

  @override
  set loadingOtherEpisode(bool value) {
    _$loadingOtherEpisodeAtom.reportWrite(value, super.loadingOtherEpisode, () {
      super.loadingOtherEpisode = value;
    });
  }

  final _$errorMsgAtom = Atom(name: '_WatchEpisodeStoreBase.errorMsg');

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  final _$episodeIdAtom = Atom(name: '_WatchEpisodeStoreBase.episodeId');

  @override
  String get episodeId {
    _$episodeIdAtom.reportRead();
    return super.episodeId;
  }

  @override
  set episodeId(String value) {
    _$episodeIdAtom.reportWrite(value, super.episodeId, () {
      super.episodeId = value;
    });
  }

  final _$watchEpisodeIdAtom =
      Atom(name: '_WatchEpisodeStoreBase.watchEpisodeId');

  @override
  String get watchEpisodeId {
    _$watchEpisodeIdAtom.reportRead();
    return super.watchEpisodeId;
  }

  @override
  set watchEpisodeId(String value) {
    _$watchEpisodeIdAtom.reportWrite(value, super.watchEpisodeId, () {
      super.watchEpisodeId = value;
    });
  }

  final _$recommendationsAtom =
      Atom(name: '_WatchEpisodeStoreBase.recommendations');

  @override
  ObservableList<Anime> get recommendations {
    _$recommendationsAtom.reportRead();
    return super.recommendations;
  }

  @override
  set recommendations(ObservableList<Anime> value) {
    _$recommendationsAtom.reportWrite(value, super.recommendations, () {
      super.recommendations = value;
    });
  }

  final _$loadingRecommendationsAtom =
      Atom(name: '_WatchEpisodeStoreBase.loadingRecommendations');

  @override
  bool get loadingRecommendations {
    _$loadingRecommendationsAtom.reportRead();
    return super.loadingRecommendations;
  }

  @override
  set loadingRecommendations(bool value) {
    _$loadingRecommendationsAtom
        .reportWrite(value, super.loadingRecommendations, () {
      super.loadingRecommendations = value;
    });
  }

  final _$loadingMoreRecommendationsAtom =
      Atom(name: '_WatchEpisodeStoreBase.loadingMoreRecommendations');

  @override
  bool get loadingMoreRecommendations {
    _$loadingMoreRecommendationsAtom.reportRead();
    return super.loadingMoreRecommendations;
  }

  @override
  set loadingMoreRecommendations(bool value) {
    _$loadingMoreRecommendationsAtom
        .reportWrite(value, super.loadingMoreRecommendations, () {
      super.loadingMoreRecommendations = value;
    });
  }

  final _$recommendationsErrorAtom =
      Atom(name: '_WatchEpisodeStoreBase.recommendationsError');

  @override
  String get recommendationsError {
    _$recommendationsErrorAtom.reportRead();
    return super.recommendationsError;
  }

  @override
  set recommendationsError(String value) {
    _$recommendationsErrorAtom.reportWrite(value, super.recommendationsError,
        () {
      super.recommendationsError = value;
    });
  }

  final _$loadEpisodeAsyncAction =
      AsyncAction('_WatchEpisodeStoreBase.loadEpisode');

  @override
  Future<void> loadEpisode() {
    return _$loadEpisodeAsyncAction.run(() => super.loadEpisode());
  }

  final _$loadNextEpisodeAsyncAction =
      AsyncAction('_WatchEpisodeStoreBase.loadNextEpisode');

  @override
  Future<void> loadNextEpisode() {
    return _$loadNextEpisodeAsyncAction.run(() => super.loadNextEpisode());
  }

  final _$loadPrevEpisodeAsyncAction =
      AsyncAction('_WatchEpisodeStoreBase.loadPrevEpisode');

  @override
  Future<void> loadPrevEpisode() {
    return _$loadPrevEpisodeAsyncAction.run(() => super.loadPrevEpisode());
  }

  final _$loadRecommendationsAsyncAction =
      AsyncAction('_WatchEpisodeStoreBase.loadRecommendations');

  @override
  Future<void> loadRecommendations() {
    return _$loadRecommendationsAsyncAction
        .run(() => super.loadRecommendations());
  }

  final _$loadMoreRecommendationsAsyncAction =
      AsyncAction('_WatchEpisodeStoreBase.loadMoreRecommendations');

  @override
  Future<void> loadMoreRecommendations() {
    return _$loadMoreRecommendationsAsyncAction
        .run(() => super.loadMoreRecommendations());
  }

  final _$_WatchEpisodeStoreBaseActionController =
      ActionController(name: '_WatchEpisodeStoreBase');

  @override
  void setWatchEpisodeId(String newEpisodeId) {
    final _$actionInfo = _$_WatchEpisodeStoreBaseActionController.startAction(
        name: '_WatchEpisodeStoreBase.setWatchEpisodeId');
    try {
      return super.setWatchEpisodeId(newEpisodeId);
    } finally {
      _$_WatchEpisodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void renderUpdatedEpisode(String id, double newStats) {
    final _$actionInfo = _$_WatchEpisodeStoreBaseActionController.startAction(
        name: '_WatchEpisodeStoreBase.renderUpdatedEpisode');
    try {
      return super.renderUpdatedEpisode(id, newStats);
    } finally {
      _$_WatchEpisodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void renderUpdatedFavorite(Anime anime, bool newValue) {
    final _$actionInfo = _$_WatchEpisodeStoreBaseActionController.startAction(
        name: '_WatchEpisodeStoreBase.renderUpdatedFavorite');
    try {
      return super.renderUpdatedFavorite(anime, newValue);
    } finally {
      _$_WatchEpisodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
episodeDetails: ${episodeDetails},
loadingWatchEpisode: ${loadingWatchEpisode},
loadingOtherEpisode: ${loadingOtherEpisode},
errorMsg: ${errorMsg},
episodeId: ${episodeId},
watchEpisodeId: ${watchEpisodeId},
recommendations: ${recommendations},
loadingRecommendations: ${loadingRecommendations},
loadingMoreRecommendations: ${loadingMoreRecommendations},
recommendationsError: ${recommendationsError}
    ''';
  }
}
