import '../entities/customer.dart';
import '../entities/user.dart';
import '../entities/authentication_result.dart';

abstract class CustomerRepository {
  Future<Customer?> getCustomerById(String customerId);

  Future<Customer?> getCustomerByFirebaseUid(String firebaseUid);

  Future<List<Customer>> findCustomersByEmailAndPhone({
    required String email,
    required String phone,
    String? name,
  });

  Future<Customer> updateCustomer(Customer customer);

  Future<void> linkCustomerToFirebaseUser({
    required String customerId,
    required String firebaseUid,
  });

  Future<UserProfile?> getUserProfile(String userId);

  Future<UserProfile> createUserProfile(UserProfile profile);

  Future<UserProfile> updateUserProfile(UserProfile profile);

  Future<void> deleteUserProfile(String userId);

  Future<CustomerLinkingRequest> createCustomerLinkingRequest({
    required String firebaseUid,
    required String customerId,
    String? additionalInfo,
  });

  Future<List<Customer>> getPotentialCustomerMatches({
    required String email,
    required String phone,
    String? name,
  });

  Stream<Customer?> watchCustomer(String customerId);

  Stream<UserProfile?> watchUserProfile(String userId);
}
