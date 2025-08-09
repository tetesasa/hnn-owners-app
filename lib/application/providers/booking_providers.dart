import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';
import '../../data/repositories/firestore_booking_repository.dart';
import '../usecases/create_booking_usecase.dart';
import '../usecases/update_booking_usecase.dart';
import '../usecases/cancel_booking_usecase.dart';
import 'auth_providers.dart';
import 'pet_providers.dart';

part 'booking_providers.g.dart';

// リポジトリプロバイダー
@riverpod
BookingRepository bookingRepository(Ref ref) {
  return FirestoreBookingRepository(
    firestore: ref.watch(firebaseFirestoreProvider),
  );
}

// UseCase プロバイダー
@riverpod
CreateBookingUseCase createBookingUseCase(Ref ref) {
  return CreateBookingUseCase(
    bookingRepository: ref.watch(bookingRepositoryProvider),
    petRepository: ref.watch(petRepositoryProvider),
  );
}

@riverpod
UpdateBookingUseCase updateBookingUseCase(Ref ref) {
  return UpdateBookingUseCase(
    bookingRepository: ref.watch(bookingRepositoryProvider),
  );
}

@riverpod
CancelBookingUseCase cancelBookingUseCase(Ref ref) {
  return CancelBookingUseCase(
    bookingRepository: ref.watch(bookingRepositoryProvider),
  );
}

@riverpod
GetBookingsUseCase getBookingsUseCase(Ref ref) {
  return GetBookingsUseCase(
    bookingRepository: ref.watch(bookingRepositoryProvider),
  );
}

@riverpod
GetBookingDetailUseCase getBookingDetailUseCase(Ref ref) {
  return GetBookingDetailUseCase(
    bookingRepository: ref.watch(bookingRepositoryProvider),
  );
}

// 予約管理ステート
@riverpod
class BookingNotifier extends _$BookingNotifier {
  @override
  Future<Booking?> build(String bookingId) async {
    final bookingRepo = ref.watch(bookingRepositoryProvider);
    return await bookingRepo.getBookingById(bookingId);
  }

  Future<void> refreshBooking() async {
    ref.invalidateSelf();
  }
}

// 顧客の予約一覧管理
@riverpod
class CustomerBookingsNotifier extends _$CustomerBookingsNotifier {
  @override
  Future<List<Booking>> build(String customerId) async {
    final bookingRepo = ref.watch(bookingRepositoryProvider);
    return await bookingRepo.getCustomerBookings(customerId);
  }

  Future<void> refreshBookings() async {
    ref.invalidateSelf();
  }

  Future<List<Booking>> getBookingsWithFilter({
    BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final bookingRepo = ref.read(bookingRepositoryProvider);
    return await bookingRepo.getBookings(
      customerId: customerId,
      status: status,
      startDate: startDate,
      endDate: endDate,
    );
  }
}

// 現在のユーザーの予約管理
@riverpod
Future<List<Booking>> currentUserBookings(Ref ref) async {
  final authState = ref.watch(authStateChangesProvider);

  return authState.when(
    data: (user) async {
      if (user?.customerId == null) return [];

      final bookingRepo = ref.watch(bookingRepositoryProvider);
      return await bookingRepo.getCustomerBookings(user!.customerId!);
    },
    loading: () => [],
    error: (_, __) => [],
  );
}

// 今後の予約一覧
@riverpod
Future<List<Booking>> upcomingBookings(Ref ref) async {
  final authState = ref.watch(authStateChangesProvider);

  return authState.when(
    data: (user) async {
      if (user?.customerId == null) return [];

      final bookingRepo = ref.watch(bookingRepositoryProvider);
      return await bookingRepo.getUpcomingBookings(user!.customerId!);
    },
    loading: () => [],
    error: (_, __) => [],
  );
}

// 過去の予約一覧
@riverpod
Future<List<Booking>> pastBookings(Ref ref) async {
  final authState = ref.watch(authStateChangesProvider);

  return authState.when(
    data: (user) async {
      if (user?.customerId == null) return [];

      final bookingRepo = ref.watch(bookingRepositoryProvider);
      return await bookingRepo.getPastBookings(user!.customerId!);
    },
    loading: () => [],
    error: (_, __) => [],
  );
}

// 予約統計
@riverpod
Future<Map<String, int>> bookingStatistics(Ref ref) async {
  final authState = ref.watch(authStateChangesProvider);

  return authState.when(
    data: (user) async {
      if (user?.customerId == null) return <String, int>{};

      final bookingRepo = ref.watch(bookingRepositoryProvider);
      return await bookingRepo.getBookingStatistics(user!.customerId!);
    },
    loading: () => <String, int>{},
    error: (_, __) => <String, int>{},
  );
}

// リアルタイム予約監視
@riverpod
Stream<List<Booking>> watchCurrentUserBookings(Ref ref) {
  final authState = ref.watch(authStateChangesProvider);

  return authState.when(
    data: (user) {
      if (user?.customerId == null) return Stream.value([]);

      final bookingRepo = ref.watch(bookingRepositoryProvider);
      return bookingRepo.watchCustomerBookings(user!.customerId!);
    },
    loading: () => Stream.value([]),
    error: (_, __) => Stream.value([]),
  );
}

@riverpod
Stream<Booking?> watchBooking(Ref ref, String bookingId) {
  final bookingRepo = ref.watch(bookingRepositoryProvider);
  return bookingRepo.watchBooking(bookingId);
}

// 予約検索
@riverpod
class BookingSearchNotifier extends _$BookingSearchNotifier {
  @override
  List<Booking> build() => [];

  Future<void> searchBookings({
    String? customerId,
    String? query,
    DateTimeRange? dateRange,
    List<BookingStatus>? statuses,
    List<ServiceType>? serviceTypes,
  }) async {
    try {
      final bookingRepo = ref.read(bookingRepositoryProvider);
      final results = await bookingRepo.searchBookings(
        customerId: customerId,
        query: query,
        dateRange: dateRange,
        statuses: statuses,
        serviceTypes: serviceTypes,
      );

      state = results;
    } catch (e) {
      // エラーハンドリング
      state = [];
    }
  }

  void clearResults() {
    state = [];
  }
}

// 予約操作管理
@riverpod
class BookingOperationsNotifier extends _$BookingOperationsNotifier {
  @override
  BookingOperationsState build() => const BookingOperationsState();

  Future<void> createBooking(BookingRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final useCase = ref.read(createBookingUseCaseProvider);
      final booking = await useCase(request);

      state = state.copyWith(
        isLoading: false,
        lastCreatedBooking: booking,
      );

      // 関連プロバイダーを更新
      ref.invalidate(currentUserBookingsProvider);
      ref.invalidate(upcomingBookingsProvider);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> updateBooking(
      String bookingId, BookingUpdateRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final useCase = ref.read(updateBookingUseCaseProvider);
      final booking = await useCase(bookingId, request);

      state = state.copyWith(
        isLoading: false,
        lastUpdatedBooking: booking,
      );

      // 関連プロバイダーを更新
      ref.invalidate(bookingNotifierProvider(bookingId));
      ref.invalidate(currentUserBookingsProvider);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> cancelBooking(CancelBookingRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final useCase = ref.read(cancelBookingUseCaseProvider);
      await useCase(request);

      state = state.copyWith(isLoading: false);

      // 関連プロバイダーを更新
      ref.invalidate(bookingNotifierProvider(request.bookingId));
      ref.invalidate(currentUserBookingsProvider);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// 状態クラス
class BookingOperationsState {
  const BookingOperationsState({
    this.isLoading = false,
    this.error,
    this.lastCreatedBooking,
    this.lastUpdatedBooking,
  });

  final bool isLoading;
  final String? error;
  final Booking? lastCreatedBooking;
  final Booking? lastUpdatedBooking;

  BookingOperationsState copyWith({
    bool? isLoading,
    String? error,
    Booking? lastCreatedBooking,
    Booking? lastUpdatedBooking,
  }) {
    return BookingOperationsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      lastCreatedBooking: lastCreatedBooking ?? this.lastCreatedBooking,
      lastUpdatedBooking: lastUpdatedBooking ?? this.lastUpdatedBooking,
    );
  }
}
