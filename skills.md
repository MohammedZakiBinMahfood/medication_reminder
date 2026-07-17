# مهارة: بناء Feature + Auth باستخدام app_platform + Riverpod

## هيكل المجلدات — Feature

```
features/<domain>/<feature_name>/
├── models/
│   ├── models.dart                          # Barrel file
│   ├── <feature>_field.dart                 # Enum للحقول
│   ├── <feature>_state_model.dart           # State Model + .mapper.dart
│   ├── <feature>_list_model.dart            # موديل العرض (قائمة)
│   ├── <feature>_details_model.dart         # موديل التفاصيل
│   ├── add/<feature>_add_model.dart         # موديل الإنشاء
│   └── edit/<feature>_edit_model.dart       # موديل التعديل
├── repositories/
│   ├── repositories.dart
│   ├── <feature>_repository.dart            # Abstract
│   └── <feature>_repository_impl.dart       # Implementation + Provider
├── providers/
│   ├── providers.dart
│   ├── <feature>_state_notifier.dart        # State Model Notifier
│   ├── <feature>_crud_notifier.dart         # CRUD مع ActionStore
│   ├── <feature>_list_notifier.dart         # قائمة مع Pagination
│   ├── <feature>_form_provider.dart         # Validation Controller
│   └── <feature>_filters_provider.dart      # QueryFilters
└── presentation/
    ├── screens/
    └── widgets/
```

## هيكل المجلدات — Auth

```
features/auth/
├── models/
│   ├── login_response_model.dart            # LoginResponseModel + UserModel
│   └── models.dart
├── repositories/
│   ├── auth_repository.dart                 # Abstract
│   └── auth_repository_impl.dart            # Implementation
├── providers/
│   ├── auth_notifier.dart                   # AuthStatus + Login + Logout
│   ├── remember_me_provider.dart            # تذكرني
│   └── providers.dart
└── presentation/
    ├── screens/
    │   └── login_screen.dart
    └── widgets/
```

---

## 1. Models — تعريف البيانات

### 1.1 Enum للحقول (Validation)

```dart
// models/<feature>_field.dart
enum EmployeeField {
  name,
  nameEn,
  phone,
  email,
  salary,
  department,
}
```

### 1.2 State Model (حالة الفورم)

```dart
// models/<feature>_state_model.dart
import 'package:dart_mappable/dart_mappable.dart';

part '<feature>_state_model.mapper.dart';

@MappableClass()
class FeatureStateModel with FeatureStateModelMappable {
  FeatureStateModel({
    this.id,
    this.name,
    // ... باقي الحقول
  });

  FeatureStateModel.empty()
      : id = null,
        name = '',
        // ... باقي الحقول

  final int? id;
  final String? name;
  // ... باقي الحقول
}
```

### 1.3 موديل القائمة (للاستجابة من API)

```dart
// models/<feature>_list_model.dart
@MappableClass()
class FeatureListModel with FeatureListModelMappable {
  FeatureListModel({required this.id, required this.name, ...});
  final int id;
  final String name;
  static const fromMap = FeatureListModelMapper.fromMap;
}
```

### 1.4 موديل الإضافة (للـ API)

```dart
// models/add/<feature>_add_model.dart
@MappableClass()
class FeatureAddModel with FeatureAddModelMappable {
  FeatureAddModel({required this.name, ...});
  final String name;
  Map<String, dynamic> toJson() => toMap();
}
```

### 1.5 Login Response Model

```dart
// features/auth/models/login_response_model.dart
@MappableClass()
class LoginResponseModel with LoginResponseModelMappable {
  LoginResponseModel({
    required this.token,
    required this.refreshToken,
    this.expiresIn,
    this.user,
  });
  final String token;
  final String refreshToken;
  final int? expiresIn;
  final UserModel? user;
  static const fromMap = LoginResponseModelMapper.fromMap;
}

@MappableClass()
class UserModel with UserModelMappable {
  UserModel({required this.id, required this.name, required this.email});
  final int id;
  final String name;
  final String email;
  static const fromMap = UserModelMapper.fromMap;
}
```

### 1.6 شغّل code generation

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 2. Repository — طبقة البيانات

### Interface

```dart
// repositories/<feature>_repository.dart
abstract class FeatureRepository {
  Future<Result<Paginated<FeatureListModel>>> getList({
    required Pagination pagination,
    QueryFilters? filters,
  });
  Future<Result<FeatureAddResponseModel>> create(FeatureAddModel model);
  Future<Result<FeatureAddResponseModel>> update(FeatureEditModel model);
  Future<Result<String>> delete(int id);
}
```

### Auth Repository

```dart
// features/auth/repositories/auth_repository.dart
abstract class AuthRepository {
  Future<Result<LoginResponseModel>> login(String username, String password);
  Future<Result<String>> refreshToken(String refreshToken);
  Future<Result<void>> logout();
}
```

### Implementation

```dart
// repositories/<feature>_repository_impl.dart
final featureRepositoryProvider = Provider<FeatureRepository>((ref) {
  return FeatureRepositoryImpl(apiClient: ref.read(apiClientProvider));
});

class FeatureRepositoryImpl implements FeatureRepository {
  final ApiClient apiClient;
  FeatureRepositoryImpl({required this.apiClient});

  @override
  Future<Result<Paginated<FeatureListModel>>> getList({
    required Pagination pagination,
    QueryFilters? filters,
  }) {
    return apiClient.get(
      '/endpoint/data-for-list',
      query: {
        if (filters != null && !filters.isEmpty) ...filters.toQuery(),
        'pageNumber': pagination.page.toString(),
        'pageSize': pagination.limit.toString(),
      },
      parser: (json) {
        final rawData = (json['data'] as List?) ?? [];
        final hasNext = json['hasNext'] as bool? ?? false;
        final items = rawData.map((e) => FeatureListModel.fromMap(e)).toList();
        return Paginated<FeatureListModel>(
          items: items,
          pagination: pagination,
          hasNext: hasNext,
        );
      },
    );
  }

  @override
  Future<Result<FeatureAddResponseModel>> create(FeatureAddModel model) {
    return apiClient.post(
      '/endpoint',
      body: model.toJson(),
      parser: (json) => FeatureAddResponseModel.fromMap(json['data']),
    );
  }

  // ... update, delete, toggleStatus بنفس النمط
}
```

### Auth Repository Implementation

```dart
// features/auth/repositories/auth_repository_impl.dart
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(apiClient: ref.read(apiClientProvider));
});

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient apiClient;
  AuthRepositoryImpl({required this.apiClient});

  @override
  Future<Result<LoginResponseModel>> login(String username, String password) {
    return apiClient.post(
      '/auth/login',
      body: {'username': username, 'password': password},
      parser: (json) => LoginResponseModel.fromMap(json['data']),
    );
  }

  @override
  Future<Result<String>> refreshToken(String refreshToken) {
    return apiClient.post(
      '/auth/refresh',
      body: {'refreshToken': refreshToken},
      parser: (json) => json['data']['token'] as String,
    );
  }

  @override
  Future<Result<void>> logout() {
    return apiClient.post('/auth/logout', parser: (_) => null);
  }
}
```

---

## 3. Token Provider — تخزين واسترجاع التوكن

```dart
// lib/core/auth/token_provider_impl.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app_platform_network/network.dart';

class SecureTokenProvider implements TokenProvider {
  final FlutterSecureStorage _storage;
  static const _tokenKey = 'auth_token';
  static const _refreshTokenKey = 'refresh_token';

  SecureTokenProvider(this._storage);

  @override
  Future<String?> getToken() => _storage.read(key: _tokenKey);

  Future<void> saveToken(String token) =>
      _storage.write(key: _tokenKey, value: token);

  Future<void> saveRefreshToken(String token) =>
      _storage.write(key: _refreshTokenKey, value: token);

  Future<String?> getRefreshToken() =>
      _storage.read(key: _refreshTokenKey);

  Future<void> clearTokens() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
```

---

## 4. حقن التبعيات (Dependency Injection)

```dart
// lib/core/di/providers.dart
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) =>
    const FlutterSecureStorage());

final secureTokenProvider = Provider<SecureTokenProvider>((ref) =>
    SecureTokenProvider(ref.read(secureStorageProvider)));

final tokenProvider = Provider<TokenProvider>((ref) =>
    ref.read(secureTokenProvider));

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('حقنها يدويًا في main.dart');
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final httpClient = http.Client();
  ref.onDispose(() => httpClient.close());
  return HttpApiClient(
    baseUrl: 'https://api.example.com',
    client: httpClient,
    tokenProvider: ref.read(tokenProvider),
  );
});
```

في `main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
      child: App(),
    ),
  );
}
```

---

## 5. Notifiers — إدارة الحالة

### 5.1 State Notifier — حالة إدخال الفورم

```dart
// providers/<feature>_state_notifier.dart
final featureStateProvider =
    NotifierProvider<FeatureStateNotifier, FeatureStateModel>(
  FeatureStateNotifier.new,
);

class FeatureStateNotifier extends Notifier<FeatureStateModel> {
  @override
  FeatureStateModel build() => FeatureStateModel.empty();

  void setName(String? v) => state = state.copyWith(name: v);
  // ... باقي الـ setters
  void reset() => state = FeatureStateModel.empty();
}
```

### 5.2 List Notifier — قائمة مع Pagination

```dart
// providers/<feature>_list_notifier.dart
final featureListProvider = NotifierProvider.autoDispose<
    FeatureListNotifier, BaseState<Paginated<FeatureListModel>>>(
  FeatureListNotifier.new,
);

class FeatureListNotifier extends BaseNotifier<Paginated<FeatureListModel>> {
  late FeatureRepository repository;
  late QueryFilters filters;
  Pagination _pagination = const Pagination(page: 1, limit: 10);

  @override
  BaseState<Paginated<FeatureListModel>> build() {
    repository = ref.read(featureRepositoryProvider);
    filters = ref.read(featureFiltersProvider);
    Future.microtask(loadFirstPage);
    return const BaseState();
  }

  Future<void> loadFirstPage() async {
    _pagination = _pagination.first();
    setLoading();
    final result = await repository.getList(pagination: _pagination, filters: filters);
    if (result case Success(:final data)) {
      setSuccess(data);
    } else if (result case Failure(:final error)) {
      setError(error);
    }
  }

  Future<void> loadNextPage() async {
    final current = state.data;
    if (current == null || !current.hasNext || current.isLoadingMore) return;
    setSuccess(current.copyWith(isLoadingMore: true));
    _pagination = _pagination.next();
    final result = await repository.getList(pagination: _pagination, filters: filters);
    if (result case Success(:final data)) {
      setSuccess(current.copyWith(
        items: [...current.items, ...data.items],
        isLoadingMore: false,
      ));
    } else if (result case Failure(:final error)) {
      setSuccess(current.copyWith(isLoadingMore: false));
    }
  }
}
```

### 5.3 CRUD Notifier — مع ActionStore

```dart
// providers/<feature>_crud_notifier.dart
final featureCrudProvider =
    StateNotifierProvider<FeatureCrudNotifier, ActionStore>(
  (ref) => FeatureCrudNotifier(repository: ref.read(featureRepositoryProvider), ref: ref),
);

class FeatureCrudNotifier extends StateNotifier<ActionStore> {
  final FeatureRepository repository;
  final Ref ref;
  ActionType screenMode = ActionType.create;

  FeatureCrudNotifier({required this.repository, required this.ref}) : super(ActionStore());

  Future<void> create() async {
    final data = ref.read(featureStateProvider);
    const key = ActionKey(ActionType.create);
    if (state.isLoading(key.value)) return;
    state = state.start(key.value);

    final model = FeatureAddModel(name: data.name ?? '');
    final result = await repository.create(model);

    if (result case Success()) {
      state = state.success(key.value);
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }

  Future<void> update() async {
    final data = ref.read(featureStateProvider);
    final key = ActionKey(ActionType.update, data.id.toString());
    state = state.start(key.value);
    final model = FeatureEditModel(id: data.id!, name: data.name ?? '');
    final result = await repository.update(model);
    if (result case Success()) {
      state = state.success(key.value);
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }

  Future<void> delete(int id) async {
    final key = ActionKey(ActionType.delete, id.toString());
    state = state.start(key.value);
    final result = await repository.delete(id);
    if (result case Success()) {
      state = state.success(key.value);
    } else if (result case Failure(:final error)) {
      state = state.fail(key.value, error);
    }
  }
}
```

### 5.4 Auth Status Notifier

```dart
// features/auth/providers/auth_notifier.dart
enum AuthStatus { unknown, authenticated, unauthenticated }

final authStatusProvider = NotifierProvider<AuthStatusNotifier, AuthStatus>(
  AuthStatusNotifier.new,
);

class AuthStatusNotifier extends Notifier<AuthStatus> {
  @override
  AuthStatus build() {
    _checkExistingSession();
    return AuthStatus.unknown;
  }

  Future<void> _checkExistingSession() async {
    final token = await ref.read(secureTokenProvider).getToken();
    state = (token != null && token.isNotEmpty)
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
  }

  void setAuthenticated() => state = AuthStatus.authenticated;
  void setUnauthenticated() => state = AuthStatus.unauthenticated;
}
```

### 5.5 Login Notifier

```dart
final authLoginProvider = NotifierProvider.autoDispose<
  AuthLoginNotifier, BaseState<LoginResponseModel>>(
  AuthLoginNotifier.new,
);

class AuthLoginNotifier extends BaseNotifier<LoginResponseModel> {
  @override
  BaseState<LoginResponseModel> build() => const BaseState();

  Future<void> login({
    required String username,
    required String password,
    required bool rememberMe,
  }) async {
    setLoading();
    final result = await ref.read(authRepositoryProvider).login(username, password);

    if (result case Success(:final data)) {
      final tokenProvider = ref.read(secureTokenProvider);
      await tokenProvider.saveToken(data.token);
      await tokenProvider.saveRefreshToken(data.refreshToken);

      if (rememberMe) {
        await ref.read(rememberMePrefsProvider).setRememberMe(true);
        await ref.read(savedUsernameProvider).save(username);
      } else {
        await ref.read(rememberMePrefsProvider).clear();
      }
      ref.read(authStatusProvider.notifier).setAuthenticated();
      setSuccess(data);
    } else if (result case Failure(:final error)) {
      setError(error);
    }
  }
}
```

### 5.6 Logout Notifier

```dart
final authLogoutProvider = NotifierProvider.autoDispose<
  AuthLogoutNotifier, BaseState<void>>(
  AuthLogoutNotifier.new,
);

class AuthLogoutNotifier extends BaseNotifier<void> {
  @override
  BaseState<void> build() => const BaseState();

  Future<void> logout() async {
    setLoading();
    await ref.read(authRepositoryProvider).logout();
    await ref.read(secureTokenProvider).clearTokens();
    await ref.read(rememberMePrefsProvider).clear();
    ref.read(authStatusProvider.notifier).setUnauthenticated();
    setSuccess(null);
  }
}
```

### 5.7 Remember Me

```dart
// features/auth/providers/remember_me_provider.dart
final rememberMePrefsProvider = Provider<RememberMePrefs>((ref) {
  return RememberMePrefs(ref.read(sharedPrefsProvider));
});

class RememberMePrefs {
  final SharedPreferences _prefs;
  RememberMePrefs(this._prefs);
  static const _key = 'remember_me';
  bool get isEnabled => _prefs.getBool(_key) ?? false;
  Future<void> setRememberMe(bool value) => _prefs.setBool(_key, value);
  Future<void> clear() => _prefs.remove(_key);
}

final savedUsernameProvider = Provider<SavedUsernamePrefs>((ref) {
  return SavedUsernamePrefs(ref.read(sharedPrefsProvider));
});

class SavedUsernamePrefs {
  final SharedPreferences _prefs;
  SavedUsernamePrefs(this._prefs);
  static const _key = 'saved_username';
  String? get() => _prefs.getString(_key);
  Future<void> save(String username) => _prefs.setString(_key, username);
  Future<void> clear() => _prefs.remove(_key);
}
```

---

## 6. Form Validation

### 6.1 Validation Controller

```dart
// providers/<feature>_form_provider.dart
final featureFormProvider = NotifierProvider.autoDispose<
    FeatureFormNotifier, FormValidationState<FeatureField>>(
  FeatureFormNotifier.new,
);

class FeatureFormNotifier extends ValidationController<FeatureField> {
  @override
  FormValidationState<FeatureField> build() {
    init(validators: {
      FeatureField.name: (context) {
        final data = context.read(featureStateProvider);
        return requiredStringValidator(data.name);
      },
      FeatureField.phone: (context) {
        final data = context.read(featureStateProvider);
        if (data.phone == null || data.phone!.isEmpty) return 'مطلوب';
        if (data.phone!.length < 10) return 'رقم الجوال غير صحيح';
        return null;
      },
      FeatureField.email: (context) {
        final data = context.read(featureStateProvider);
        if (data.email == null || data.email!.isEmpty) return null;
        final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        return regex.hasMatch(data.email!) ? null : 'البريد الإلكتروني غير صحيح';
      },
    });
    return state;
  }

  void validateName() => validate(FeatureField.name);
  bool validateForm() => validateAll();
}
```

### 6.2 الاستخدام في الشاشة

```dart
final validation = ref.watch(featureFormProvider);

CTextField(
  label: 'الاسم',
  errorText: validation.field(FeatureField.name).error,
  isRequired: true,
  onChanged: (value) {
    ref.read(featureStateProvider.notifier).setName(value);
    ref.read(featureFormProvider.notifier).validateName();
  },
);

// قبل الحفظ
void onSave() {
  if (!ref.read(featureFormProvider.notifier).validateForm()) return;
  // proceed with API call
}
```

---

## 7. UI — الشاشات

### 7.1 Root Screen — التوجيه حسب Auth

```dart
// lib/app.dart
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authStatusProvider);

    return MaterialApp(
      home: switch (authStatus) {
        AuthStatus.unknown => Scaffold(body: Center(child: CircularProgressIndicator())),
        AuthStatus.authenticated => const HomeScreen(),
        AuthStatus.unauthenticated => const LoginScreen(),
      },
    );
  }
}
```

### 7.2 شاشة Login

```dart
// features/auth/presentation/screens/login_screen.dart
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState create() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadRememberedUsername();
  }

  Future<void> _loadRememberedUsername() async {
    if (ref.read(rememberMePrefsProvider).isEnabled) {
      final username = ref.read(savedUsernameProvider).get();
      if (username != null) {
        _usernameCtrl.text = username;
        setState(() => _rememberMe = true);
      }
    }
  }

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(authLoginProvider);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _usernameCtrl, decoration: InputDecoration(labelText: 'اسم المستخدم')),
            SizedBox(height: 16),
            TextField(controller: _passwordCtrl, obscureText: true, decoration: InputDecoration(labelText: 'كلمة المرور')),
            CheckboxListTile(title: Text('تذكرني'), value: _rememberMe, onChanged: (v) => setState(() => _rememberMe = v ?? false)),
            SizedBox(height: 16),
            switch (loginState.status) {
              LoadStatus.loading => const CircularProgressIndicator(),
              _ => SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _onLogin, child: Text('تسجيل الدخول'))),
            },
            if (loginState.error != null) Text(loginState.error!.errorMessage, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

  void _onLogin() {
    ref.read(authLoginProvider.notifier).login(
      username: _usernameCtrl.text,
      password: _passwordCtrl.text,
      rememberMe: _rememberMe,
    );
  }
}
```

### 7.3 شاشة القائمة مع AsyncView

```dart
class FeatureListScreen extends ConsumerStatefulWidget {
  const FeatureListScreen({super.key});
  @override
  ConsumerState create() => _FeatureListScreenState();
}

class _FeatureListScreenState extends ConsumerState<FeatureListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(featureListProvider.notifier).loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(featureListProvider);

    return AsyncView<Paginated<FeatureListModel>>(
      status: state.status,
      data: state.data,
      error: state.error,
      onSuccess: (_, paginated) => ListView.builder(
        controller: _scrollController,
        itemCount: paginated.items.length + (paginated.hasNext ? 1 : 0),
        itemBuilder: (_, i) {
          if (i >= paginated.items.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListTile(title: Text(paginated.items[i].name));
        },
      ),
      onErrorAction: () => ref.read(featureListProvider.notifier).loadFirstPage(),
    );
  }
}
```

### 7.4 شاشة إنشاء/تعديل

```dart
class NewFeatureScreen extends ConsumerStatefulWidget {
  const NewFeatureScreen({super.key});
  @override
  ConsumerState create() => _NewFeatureScreenState();
}

class _NewFeatureScreenState extends ConsumerState<NewFeatureScreen> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: ref.read(featureStateProvider).name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final crud = ref.read(featureCrudProvider.notifier);
    final validation = ref.watch(featureFormProvider);

    _listenForActions();

    return Scaffold(
      appBar: AppBar(title: Text(crud.screenMode == ActionType.create ? 'إضافة' : 'تعديل')),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'الاسم',
              errorText: validation.field(FeatureField.name).error,
            ),
            onChanged: (v) {
              ref.read(featureStateProvider.notifier).setName(v);
              ref.read(featureFormProvider.notifier).validateName();
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (!ref.read(featureFormProvider.notifier).validateForm()) return;
              if (crud.screenMode == ActionType.create) {
                crud.create();
              } else {
                crud.update();
              }
            },
            child: Text('حفظ'),
          ),
        ],
      ),
    );
  }

  void _listenForActions() {
    listenForActions(
      ref: ref,
      provider: featureCrudProvider,
      reactions: {
        const ActionKey(ActionType.create): ActionReaction(
          onSuccess: () => Navigator.pop(context),
          onError: (error) => showSnackBar(error.errorMessage),
        ),
        ActionKey(ActionType.update): ActionReaction(
          onSuccess: () => Navigator.pop(context),
          onError: (error) => showSnackBar(error.errorMessage),
        ),
        ActionKey(ActionType.delete): ActionReaction(
          onSuccess: () => ref.read(featureListProvider.notifier).loadFirstPage(),
          onError: (error) => showSnackBar(error.errorMessage),
        ),
      },
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
```

---

## 8. Refresh Token — التعامل مع 401

```dart
// lib/core/network/refresh_token_handler.dart
class RefreshTokenHandler {
  final SecureTokenProvider tokenProvider;
  final ApiClient apiClient;

  RefreshTokenHandler({required this.tokenProvider, required this.apiClient});

  Future<Result<String>> refresh() async {
    final refreshToken = await tokenProvider.getRefreshToken();
    if (refreshToken == null) return Failure(UnauthorizedError([]));
    return apiClient.post(
      '/auth/refresh',
      body: {'refreshToken': refreshToken},
      parser: (json) => json['data']['token'] as String,
    );
  }
}

// lib/core/network/auth_api_client.dart — Interceptor
class AuthApiClient implements ApiClient {
  final ApiClient _inner;
  final SecureTokenProvider _tokenProvider;
  final Ref _ref;

  AuthApiClient({required ApiClient inner, required SecureTokenProvider tokenProvider, required Ref ref})
      : _inner = inner, _tokenProvider = tokenProvider, _ref = ref;

  @override
  Future<Result<T>> get<T>(String path, {Map<String, dynamic>? query, Map<String, String>? headers, required JsonParser<T> parser}) async {
    final result = await _inner.get(path, query: query, headers: headers, parser: parser);
    return _handleAuthError(result, () => _inner.get(path, query: query, headers: headers, parser: parser));
  }

  Future<Result<T>> _handleAuthError<T>(Result<T> result, Future<Result<T>> Function() retry) async {
    if (result case Failure(:final error) when error.type == ErrorType.unauthorizedError) {
      final refreshResult = await RefreshTokenHandler(tokenProvider: _tokenProvider, apiClient: _inner).refresh();
      if (refreshResult case Success(:final newToken)) {
        await _tokenProvider.saveToken(newToken);
        return retry();
      } else {
        await _tokenProvider.clearTokens();
        _ref.read(authStatusProvider.notifier).setUnauthenticated();
      }
    }
    return result;
  }

  @override
  Future<Result<T>> post<T>(String path, {Map<String, dynamic>? body, Map<String, dynamic>? query, Map<String, String>? headers, required JsonParser<T> parser}) {
    return _handleResult(_inner.post(path, body: body, query: query, headers: headers, parser: parser), () => _inner.post(path, body: body, query: query, headers: headers, parser: parser));
  }

  Future<Result<T>> _handleResult<T>(Future<Result<T>> call, Future<Result<T>> Function() retry) async {
    final result = await call;
    return _handleAuthError(result, retry);
  }

  @override
  Future<Result<T>> put<T>(String path, {Map<String, dynamic>? body, Map<String, String>? headers, required JsonParser<T> parser}) => _handleResult(_inner.put(path, body: body, headers: headers, parser: parser), () => _inner.put(path, body: body, headers: headers, parser: parser));

  @override
  Future<Result<T>> patch<T>(String path, {Map<String, dynamic>? body, Map<String, String>? headers, required JsonParser<T> parser}) => _handleResult(_inner.patch(path, body: body, headers: headers, parser: parser), () => _inner.patch(path, body: body, headers: headers, parser: parser));

  @override
  Future<Result<T>> delete<T>(String path, {Map<String, String>? headers, required JsonParser<T> parser}) => _handleResult(_inner.delete(path, headers: headers, parser: parser), () => _inner.delete(path, headers: headers, parser: parser));
}
```

---

## 9. ملخص الأنواع والمكونات

### `app_platform_core`

| الكلاس | الوصف |
|--------|-------|
| `Result<T>` | `Success(T)` / `Failure(AppError)` |
| `AppError<T>` | `ErrorType` + `errorMessage` |
| `LoadStatus` | `idle`, `loading`, `success`, `error` |
| `Pagination` | `page`, `limit`, `first()`, `next()` |
| `Paginated<T>` | `items`, `hasNext`, `isLoadingMore` |
| `QueryFilters` | `toQuery()` ← `Map<String, String>` |

### `app_platform_network`

| الكلاس | الوصف |
|--------|-------|
| `ApiClient` | واجهة `get()`, `post()`, `put()`, `delete()` |
| `HttpApiClient` | تطبيق مع `http` + `TokenProvider` للتزود بالتوكن |
| `TokenProvider` | `Future<String?> getToken()` |

### `app_platform_state`

| الكلاس | الوصف |
|--------|-------|
| `BaseState<T>` | `status`, `data`, `error` + `copyWith()` |
| `BaseNotifier<T>` | `setLoading()`, `setSuccess()`, `setError()` |
| `ActionStore` | `start()`, `success()`, `fail()`, `clear()` |
| `ActionKey` | `ActionType` + optional `id` |
| `ActionType` | `create`, `update`, `delete`, `login`, `logout` ... |
| `listenForActions()` | الاستماع لتغيرات `ActionStore` في الـ UI |
| `ValidationController<K>` | `validate()`, `validateAll()`, `validateAsync()` |
| `FormValidationState<K>` | `field()`, `isValid`, `canSubmit` |

### `app_platform_ui`

| الكلاس | الوصف |
|--------|-------|
| `AsyncView<T>` | يعرض حسب `LoadStatus` (loading/success/error/empty) |

### Auth Components

| المكوّن | المسؤولية |
|---------|-----------|
| `SecureTokenProvider` | تخزين/استرجاع/مسح التوكن من `flutter_secure_storage` |
| `TokenProvider` (interface) | تزويد التوكن لـ `HttpApiClient` |
| `authStatusProvider` | حالة المصادقة الشاملة (`unknown`/`authenticated`/`unauthenticated`) |
| `authLoginProvider` | `BaseNotifier<LoginResponseModel>` — إدارة login |
| `authLogoutProvider` | `BaseNotifier<void>` — إدارة logout |
| `RememberMePrefs` | تخزين `bool` تفضيل "تذكرني" |
| `RefreshTokenHandler` | معالجة انتهاء صلاحية التوكن |
| `AuthApiClient` | Interceptor يعيد المحاولة بعد refresh |

---

## 10. قواعد ذهبية

1. **لا تستخدم `ref.read` في `build`** — استخدم `ref.watch` في الـ build و `ref.read` في callback خارج الـ build
2. **كل StateNotifier فيه setter لكل حقل** — مع clear إذا كان الحقل optional
3. **`Future.microtask`** في build للـ async calls عشان نتجنب استدعاء async داخل الـ build
4. **`dart_mappable` مع `GenerateMethods.copy`** لنماذج state عشان `copyWith` بدون JSON serialization
5. **Barrel files** (`models.dart`, `providers.dart`) — كل مجلد عنده barrel يصدر كل شيء
6. **التوكن دايمًا في `flutter_secure_storage`** — "تذكرني" مجرد flag في SharedPreferences
7. **عند الـ logout:** امسح التوكن أولاً ثم حدث `authStatusProvider` عشان الـ UI يتغير فورًا
8. **عند 401:** حاول refresh مرة واحدة فقط، وإذا فشل → force logout
