class MoviesListModel {
  MoviesListModel({
    num? currentPage,
    List<Data>? data,
    String? firstPageUrl,
    num? from,
    String? nextPageUrl,
    String? path,
    num? perPage,
    dynamic prevPageUrl,
    num? to,
  }) {
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
  }

  MoviesListModel.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
  }
  num? _currentPage;
  List<Data>? _data;
  String? _firstPageUrl;
  num? _from;
  String? _nextPageUrl;
  String? _path;
  num? _perPage;
  dynamic _prevPageUrl;
  num? _to;

  MoviesListModel copyWith({
    num? currentPage,
    List<Data>? data,
    String? firstPageUrl,
    num? from,
    String? nextPageUrl,
    String? path,
    num? perPage,
    dynamic prevPageUrl,
    num? to,
  }) => MoviesListModel(
    currentPage: currentPage ?? _currentPage,
    data: data ?? _data,
    firstPageUrl: firstPageUrl ?? _firstPageUrl,
    from: from ?? _from,
    nextPageUrl: nextPageUrl ?? _nextPageUrl,
    path: path ?? _path,
    perPage: perPage ?? _perPage,
    prevPageUrl: prevPageUrl ?? _prevPageUrl,
    to: to ?? _to,
  );

  num? get currentPage => _currentPage;
  List<Data>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  num? get from => _from;
  String? get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  num? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  num? get to => _to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    return map;
  }
}

class Data {
  Data({
    String? id,
    num? movieId,
    String? originalTitle,
    String? originalLanguage,
    String? overview,
    num? popularity,
    String? posterPath,
    String? backdropPath,
    String? releaseDate,
    num? voteAverage,
    num? voteCount,
    num? adult,
    dynamic createdAt,
    dynamic updatedAt,
    List<Casts>? casts,
  }) {
    _id = id;
    _movieId = movieId;
    _originalTitle = originalTitle;
    _originalLanguage = originalLanguage;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _backdropPath = backdropPath;
    _releaseDate = releaseDate;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
    _adult = adult;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _casts = casts;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _movieId = json['movie_id'];
    _originalTitle = json['original_title'];
    _originalLanguage = json['original_language'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _backdropPath = json['backdrop_path'];
    _releaseDate = json['release_date'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
    _adult = json['adult'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['casts'] != null) {
      _casts = [];
      json['casts'].forEach((v) {
        _casts?.add(Casts.fromJson(v));
      });
    }
  }
  String? _id;
  num? _movieId;
  String? _originalTitle;
  String? _originalLanguage;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  String? _backdropPath;
  String? _releaseDate;
  num? _voteAverage;
  num? _voteCount;
  num? _adult;
  dynamic _createdAt;
  dynamic _updatedAt;
  List<Casts>? _casts;

  Data copyWith({
    String? id,
    num? movieId,
    String? originalTitle,
    String? originalLanguage,
    String? overview,
    num? popularity,
    String? posterPath,
    String? backdropPath,
    String? releaseDate,
    num? voteAverage,
    num? voteCount,
    num? adult,
    dynamic createdAt,
    dynamic updatedAt,
    List<Casts>? casts,
  }) => Data(
    id: id ?? _id,
    movieId: movieId ?? _movieId,
    originalTitle: originalTitle ?? _originalTitle,
    originalLanguage: originalLanguage ?? _originalLanguage,
    overview: overview ?? _overview,
    popularity: popularity ?? _popularity,
    posterPath: posterPath ?? _posterPath,
    backdropPath: backdropPath ?? _backdropPath,
    releaseDate: releaseDate ?? _releaseDate,
    voteAverage: voteAverage ?? _voteAverage,
    voteCount: voteCount ?? _voteCount,
    adult: adult ?? _adult,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    casts: casts ?? _casts,
  );

  String? get id => _id;
  num? get movieId => _movieId;
  String? get originalTitle => _originalTitle;
  String? get originalLanguage => _originalLanguage;
  String? get overview => _overview;
  num? get popularity => _popularity;
  String? get posterPath => _posterPath;
  String? get backdropPath => _backdropPath;
  String? get releaseDate => _releaseDate;
  num? get voteAverage => _voteAverage;
  num? get voteCount => _voteCount;
  num? get adult => _adult;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  List<Casts>? get casts => _casts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['movie_id'] = _movieId;
    map['original_title'] = _originalTitle;
    map['original_language'] = _originalLanguage;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    map['backdrop_path'] = _backdropPath;
    map['release_date'] = _releaseDate;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    map['adult'] = _adult;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_casts != null) {
      map['casts'] = _casts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Casts {
  Casts({
    String? id,
    num? movieId,
    String? name,
    String? originalName,
    String? popularity,
    String? profilePath,
    String? character,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    _id = id;
    _movieId = movieId;
    _name = name;
    _originalName = originalName;
    _popularity = popularity;
    _profilePath = profilePath;
    _character = character;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Casts.fromJson(dynamic json) {
    _id = json['id'];
    _movieId = json['movie_id'];
    _name = json['name'];
    _originalName = json['original_name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
    _character = json['character'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  num? _movieId;
  String? _name;
  String? _originalName;
  String? _popularity;
  String? _profilePath;
  String? _character;
  dynamic _createdAt;
  dynamic _updatedAt;

  Casts copyWith({
    String? id,
    num? movieId,
    String? name,
    String? originalName,
    String? popularity,
    String? profilePath,
    String? character,
    dynamic createdAt,
    dynamic updatedAt,
  }) => Casts(
    id: id ?? _id,
    movieId: movieId ?? _movieId,
    name: name ?? _name,
    originalName: originalName ?? _originalName,
    popularity: popularity ?? _popularity,
    profilePath: profilePath ?? _profilePath,
    character: character ?? _character,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );

  String? get id => _id;
  num? get movieId => _movieId;
  String? get name => _name;
  String? get originalName => _originalName;
  String? get popularity => _popularity;
  String? get profilePath => _profilePath;
  String? get character => _character;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['movie_id'] = _movieId;
    map['name'] = _name;
    map['original_name'] = _originalName;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    map['character'] = _character;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
