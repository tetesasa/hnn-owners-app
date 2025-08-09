import '../../domain/entities/authentication_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/customer_repository.dart';

class LinkExistingCustomerUseCase {
  LinkExistingCustomerUseCase({
    required CustomerRepository customerRepository,
  }) : _customerRepository = customerRepository;

  final CustomerRepository _customerRepository;

  Future<AuthenticationResult> execute({
    required String firebaseUid,
    required String customerId,
    String? additionalInfo,
  }) async {
    try {
      // 顧客データが存在するか確認
      final customer = await _customerRepository.getCustomerById(customerId);
      if (customer == null) {
        return AuthenticationResult(
          user: User(uid: firebaseUid, email: ''),
          status: AuthenticationStatus.customerNotFound,
          message: '指定された顧客データが見つかりません。',
        );
      }

      // 既に他のFirebaseユーザーと紐付けられていないか確認
      if (customer.firebaseUid != null && customer.firebaseUid != firebaseUid) {
        return AuthenticationResult(
          user: User(uid: firebaseUid, email: ''),
          status: AuthenticationStatus.failure,
          message: 'この顧客データは既に他のアカウントと紐付けられています。',
        );
      }

      // 顧客データとFirebaseユーザーを紐付け
      await _customerRepository.linkCustomerToFirebaseUser(
        customerId: customerId,
        firebaseUid: firebaseUid,
      );

      // ユーザープロフィールを作成または更新
      UserProfile? existingProfile =
          await _customerRepository.getUserProfile(firebaseUid);

      if (existingProfile == null) {
        final profile = UserProfile(
          userId: firebaseUid,
          customerId: customerId,
          displayName: customer.name,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await _customerRepository.createUserProfile(profile);
        existingProfile = profile;
      } else {
        existingProfile = existingProfile.copyWith(
          customerId: customerId,
          updatedAt: DateTime.now(),
        );
        await _customerRepository.updateUserProfile(existingProfile);
      }

      // 紐付けリクエストを作成（管理者承認用）
      if (additionalInfo != null && additionalInfo.isNotEmpty) {
        await _customerRepository.createCustomerLinkingRequest(
          firebaseUid: firebaseUid,
          customerId: customerId,
          additionalInfo: additionalInfo,
        );
      }

      return AuthenticationResult(
        user: User(uid: firebaseUid, email: customer.email),
        customer: customer,
        profile: existingProfile,
        status: AuthenticationStatus.success,
        message: '顧客データの紐付けが完了しました。',
      );
    } catch (e) {
      return AuthenticationResult(
        user: User(uid: firebaseUid, email: ''),
        status: AuthenticationStatus.failure,
        message: '顧客データの紐付けに失敗しました: $e',
      );
    }
  }
}
