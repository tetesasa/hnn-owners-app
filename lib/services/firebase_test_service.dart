// lib/services/firebase_test_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseTestService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Firestore接続テスト
  static Future<bool> testFirestoreConnection() async {
    try {
      // 既存のCUSTOMERSコレクションから1件取得テスト
      final snapshot = await _firestore.collection('CUSTOMERS').limit(1).get();

      debugPrint('✅ Firestore接続成功: ${snapshot.docs.length}件のドキュメント取得');
      return true;
    } catch (e) {
      debugPrint('❌ Firestore接続エラー: $e');
      return false;
    }
  }

  // Firebase Authentication接続テスト
  static Future<bool> testAuthConnection() async {
    try {
      final user = _auth.currentUser;
      debugPrint('✅ Firebase Auth接続成功: Current User = ${user?.uid ?? "未ログイン"}');
      return true;
    } catch (e) {
      debugPrint('❌ Firebase Auth接続エラー: $e');
      return false;
    }
  }

  // 総合接続テスト
  static Future<void> runAllTests() async {
    debugPrint('🔥 Firebase接続テスト開始...');

    await testAuthConnection();
    await testFirestoreConnection();

    debugPrint('🔥 Firebase接続テスト完了');
  }
}
