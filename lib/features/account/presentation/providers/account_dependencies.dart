import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/demo_account_repository.dart';
import '../../domain/repositories/account_repository.dart';

part 'account_dependencies.g.dart';

/// 계정 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// 데모 구현이 지금 계정을 메모리에 들고 있으므로 앱이 사는 동안 유지한다.
/// 테스트에서는 `accountRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.
@Riverpod(keepAlive: true)
AccountRepository accountRepository(Ref ref) => DemoAccountRepository();
