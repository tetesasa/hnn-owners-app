import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hnn_owners/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('HNN Owners App Integration Tests', () {
    testWidgets('Complete authentication and booking flow', (WidgetTester tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // === Authentication Flow ===
      
      // Should show welcome screen initially
      expect(find.text('HNN飼い主アプリ'), findsOneWidget);
      expect(find.text('ログイン'), findsOneWidget);
      expect(find.text('新規登録'), findsOneWidget);

      // Navigate to login screen
      await tester.tap(find.text('ログイン'));
      await tester.pumpAndSettle();

      // Should show login form
      expect(find.text('メールアドレス'), findsOneWidget);
      expect(find.text('パスワード'), findsOneWidget);

      // Enter test credentials
      await tester.enterText(
        find.byType(TextFormField).first, 
        'test@catcomeservice.com'
      );
      await tester.enterText(
        find.byType(TextFormField).last, 
        'testpassword123'
      );

      // Submit login form
      await tester.tap(find.text('ログインする'));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Should navigate to home screen after successful login
      expect(find.text('ホーム'), findsOneWidget);
      expect(find.text('予約'), findsOneWidget);
      expect(find.text('ペット'), findsOneWidget);
      expect(find.text('プロフィール'), findsOneWidget);

      // === Booking Flow ===
      
      // Navigate to booking screen
      await tester.tap(find.text('予約'));
      await tester.pumpAndSettle();

      // Should show booking list screen
      expect(find.text('予約一覧'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Tap create new booking button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Should show booking creation screen
      expect(find.text('新しい予約'), findsOneWidget);
      expect(find.text('サービス選択'), findsOneWidget);
      expect(find.text('日時選択'), findsOneWidget);
      expect(find.text('ペット選択'), findsOneWidget);

      // Select service type (visiting)
      await tester.tap(find.text('訪問サービス'));
      await tester.pumpAndSettle();

      // Select date (tomorrow)
      final tomorrow = DateTime.now().add(const Duration(days: 1));
      await tester.tap(find.byIcon(Icons.calendar_today));
      await tester.pumpAndSettle();
      
      // Select tomorrow's date in calendar
      await tester.tap(find.text(tomorrow.day.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Select start time
      await tester.tap(find.text('開始時間'));
      await tester.pumpAndSettle();
      
      await tester.tap(find.text('10'));
      await tester.tap(find.text('00'));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Select end time
      await tester.tap(find.text('終了時間'));
      await tester.pumpAndSettle();
      
      await tester.tap(find.text('18'));
      await tester.tap(find.text('00'));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Select pets (assume at least one pet exists)
      await tester.tap(find.text('ペットを選択'));
      await tester.pumpAndSettle();
      
      // Select first pet
      await tester.tap(find.byType(CheckboxListTile).first);
      await tester.tap(find.text('選択完了'));
      await tester.pumpAndSettle();

      // Add special instructions
      await tester.enterText(
        find.byType(TextFormField).last, 
        '特別な注意事項: お散歩は30分程度でお願いします。'
      );

      // Submit booking
      await tester.tap(find.text('予約を確定する'));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Should show booking confirmation
      expect(find.text('予約が完了しました'), findsOneWidget);
      expect(find.text('予約詳細'), findsOneWidget);

      // Go back to booking list
      await tester.tap(find.text('予約一覧に戻る'));
      await tester.pumpAndSettle();

      // Should see the newly created booking
      expect(find.text('訪問サービス'), findsOneWidget);
      expect(find.text('予約待ち'), findsOneWidget);

      // === Booking Detail Flow ===
      
      // Tap on the booking to view details
      await tester.tap(find.byType(Card).first);
      await tester.pumpAndSettle();

      // Should show booking detail screen
      expect(find.text('予約詳細'), findsOneWidget);
      expect(find.text('サービス'), findsOneWidget);
      expect(find.text('日時'), findsOneWidget);
      expect(find.text('ペット'), findsOneWidget);
      expect(find.text('特別な指示'), findsOneWidget);

      // Should show action buttons
      expect(find.text('予約をキャンセル'), findsOneWidget);
      expect(find.text('予約を変更'), findsOneWidget);

      // === Profile Flow ===
      
      // Navigate to profile
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      // Should show profile screen
      expect(find.text('プロフィール'), findsOneWidget);
      expect(find.text('test@catcomeservice.com'), findsOneWidget);
      expect(find.text('設定'), findsOneWidget);
      expect(find.text('ログアウト'), findsOneWidget);

      // === Logout Flow ===
      
      // Tap logout button
      await tester.tap(find.text('ログアウト'));
      await tester.pumpAndSettle();

      // Should show confirmation dialog
      expect(find.text('ログアウトしますか？'), findsOneWidget);
      expect(find.text('キャンセル'), findsOneWidget);
      expect(find.text('ログアウト'), findsNWidgets(2)); // Button and dialog

      // Confirm logout
      await tester.tap(find.text('ログアウト').last);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Should return to welcome screen
      expect(find.text('HNN飼い主アプリ'), findsOneWidget);
      expect(find.text('ログイン'), findsOneWidget);
      expect(find.text('新規登録'), findsOneWidget);
    });

    testWidgets('New user registration flow', (WidgetTester tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Navigate to registration
      await tester.tap(find.text('新規登録'));
      await tester.pumpAndSettle();

      // Should show registration form
      expect(find.text('アカウント作成'), findsOneWidget);
      expect(find.text('お名前'), findsOneWidget);
      expect(find.text('メールアドレス'), findsOneWidget);
      expect(find.text('電話番号'), findsOneWidget);
      expect(find.text('パスワード'), findsOneWidget);
      expect(find.text('パスワード確認'), findsOneWidget);

      // Fill registration form
      await tester.enterText(find.widgetWithText(TextFormField, 'お名前'), 'テスト太郎');
      await tester.enterText(
        find.widgetWithText(TextFormField, 'メールアドレス'), 
        'newuser@catcomeservice.com'
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, '電話番号'), 
        '090-1234-5678'
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'パスワード'), 
        'newpassword123'
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'パスワード確認'), 
        'newpassword123'
      );

      // Agree to terms
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();

      // Submit registration
      await tester.tap(find.text('アカウント作成'));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Should show email verification screen
      expect(find.text('メール認証'), findsOneWidget);
      expect(find.text('認証メールを送信しました'), findsOneWidget);
      expect(find.text('newuser@catcomeservice.com'), findsOneWidget);
    });

    testWidgets('Pet management flow', (WidgetTester tester) async {
      // Launch and login
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Quick login
      await tester.tap(find.text('ログイン'));
      await tester.pumpAndSettle();
      
      await tester.enterText(find.byType(TextFormField).first, 'test@catcomeservice.com');
      await tester.enterText(find.byType(TextFormField).last, 'testpassword123');
      await tester.tap(find.text('ログインする'));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Navigate to pets section
      await tester.tap(find.text('ペット'));
      await tester.pumpAndSettle();

      // Should show pets list
      expect(find.text('ペット一覧'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Add new pet
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Fill pet information
      await tester.enterText(find.widgetWithText(TextFormField, 'ペットの名前'), 'みーちゃん');
      
      // Select pet type
      await tester.tap(find.text('ペットの種類'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('猫'));
      await tester.pumpAndSettle();

      // Enter breed
      await tester.enterText(find.widgetWithText(TextFormField, '品種'), 'ミックス');

      // Select gender
      await tester.tap(find.text('性別'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('メス'));
      await tester.pumpAndSettle();

      // Enter age
      await tester.enterText(find.widgetWithText(TextFormField, '年齢'), '3');

      // Add special notes
      await tester.enterText(
        find.widgetWithText(TextFormField, '特記事項'), 
        '人懐っこい性格です。おやつが大好きです。'
      );

      // Save pet
      await tester.tap(find.text('ペット情報を保存'));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Should return to pets list with new pet
      expect(find.text('みーちゃん'), findsOneWidget);
      expect(find.text('猫'), findsOneWidget);
      expect(find.text('3歳'), findsOneWidget);
    });

    testWidgets('Error handling flow', (WidgetTester tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Test invalid login
      await tester.tap(find.text('ログイン'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).first, 'invalid@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'wrongpassword');
      await tester.tap(find.text('ログインする'));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Should show error message
      expect(find.textContaining('ログインに失敗'), findsOneWidget);
      expect(find.byIcon(Icons.error), findsOneWidget);

      // Test network error handling
      // (This would require mocking network failures)
      
      // Test form validation
      await tester.tap(find.text('新規登録'));
      await tester.pumpAndSettle();

      // Try to submit empty form
      await tester.tap(find.text('アカウント作成'));
      await tester.pump();

      // Should show validation errors
      expect(find.text('お名前を入力してください'), findsOneWidget);
      expect(find.text('メールアドレスを入力してください'), findsOneWidget);
      expect(find.text('電話番号を入力してください'), findsOneWidget);
      expect(find.text('パスワードを入力してください'), findsOneWidget);
    });
  });
}