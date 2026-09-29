import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 폼 입력창. 흰 바탕, radius 4, 높이 44, 글자 Pretendard Regular 16.
///
/// 오른쪽 [trailing]에는 보통 [AppInputTrailing]을 둔다
/// ("✓ 확인완료", "인증번호", "02:58"). 포커스가 오면 오렌지 테두리가 보인다.
/// [maxLines]가 1보다 크면 여러 줄 입력창이 되어 줄 수만큼 자란다 ("채널 소개").
/// 흰 화면 위에서는 [bordered]로 옅은 테두리를 늘 보인다 (Figma 로그인 37:4024).
///
/// [controller]를 주지 않으면 [initialValue]로 내부 controller를 만든다.
/// 바깥에서 값을 비워야 하면 key를 바꿔 새로 만든다.
class AppTextInput extends StatefulWidget {
  const AppTextInput({
    super.key,
    required this.hint,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.trailing,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.maxLines = 1,
    this.enabled = true,
    this.obscureText = false,
    this.bordered = false,
    this.autofillHints,
    this.semanticLabel,
  });

  final String hint;
  final TextEditingController? controller;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final Widget? trailing;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final bool enabled;

  /// 비밀번호처럼 글자를 가린다. 한 줄 입력창에서만 쓴다.
  final bool obscureText;

  /// 포커스가 없어도 옅은 테두리(검정 10%)를 보인다.
  final bool bordered;
  final Iterable<String>? autofillHints;

  /// 읽어 줄 필드 이름 ("사업자등록번호"). 위에 따로 보이는 라벨과 같게 둔다.
  final String? semanticLabel;

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  TextEditingController? _ownController;
  final _focusNode = FocusNode();

  TextEditingController get _controller =>
      widget.controller ??
      (_ownController ??= TextEditingController(text: widget.initialValue));

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    _ownController?.dispose();
    super.dispose();
  }

  void _onFocusChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final multiline = widget.maxLines > 1;
    final style = multiline
        ? AppTextStyles.pretendardBody1RegularRelaxed
        : AppTextStyles.pretendardBody1Regular;

    final field = TextField(
      controller: _controller,
      focusNode: _focusNode,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      keyboardType:
          widget.keyboardType ?? (multiline ? TextInputType.multiline : null),
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText,
      autofillHints: widget.autofillHints,
      minLines: multiline ? 2 : 1,
      maxLines: widget.maxLines,
      style: style,
      cursorColor: AppColors.mainOrange,
      decoration: InputDecoration.collapsed(
        hintText: widget.hint,
        hintStyle: style.copyWith(color: AppColors.textDisabled),
        hintMaxLines: widget.maxLines,
      ),
    );

    return Container(
      constraints: BoxConstraints(
        minHeight: multiline ? 0 : AppControlHeight.inputLg,
      ),
      padding: EdgeInsets.only(
        left: AppSpacing.s16,
        right: AppSpacing.s12,
        top: multiline ? AppSpacing.s14 : 0,
        bottom: multiline ? AppSpacing.s14 : 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundDefault,
        borderRadius: AppRadius.r4All,
        border: Border.all(
          color: _focusNode.hasFocus
              ? AppColors.borderBrand
              : widget.bordered
              ? AppColors.borderSubtle
              : AppColors.backgroundTransparent,
          width: AppBorderWidth.thin,
        ),
      ),
      child: Row(
        crossAxisAlignment: multiline
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Expanded(
            child: widget.semanticLabel == null
                ? field
                : Semantics(label: widget.semanticLabel, child: field),
          ),
          if (widget.trailing != null) ...[
            const SizedBox(width: AppSpacing.s8),
            widget.trailing!,
          ],
        ],
      ),
    );
  }
}

enum _AppInputTrailingKind { status, action, timer, progress, unit }

/// [AppTextInput] 오른쪽 끝에 두는 표시.
///
/// - [AppInputTrailing.status]   오렌지 체크 원 + 글자 ("확인완료", "사용가능")
/// - [AppInputTrailing.action]   회색 굵은 글자 버튼 ("인증번호", "중복확인")
/// - [AppInputTrailing.timer]    진한 오렌지 남은 시간 ("02:58")
/// - [AppInputTrailing.progress] 확인 중 작은 진행 표시
/// - [AppInputTrailing.unit]     회색 굵은 단위 ("원")
class AppInputTrailing extends StatelessWidget {
  const AppInputTrailing.status(this.label, {super.key})
    : _kind = _AppInputTrailingKind.status,
      onPressed = null;

  const AppInputTrailing.action(
    this.label, {
    super.key,
    required this.onPressed,
  }) : _kind = _AppInputTrailingKind.action;

  const AppInputTrailing.timer(this.label, {super.key})
    : _kind = _AppInputTrailingKind.timer,
      onPressed = null;

  const AppInputTrailing.unit(this.label, {super.key})
    : _kind = _AppInputTrailingKind.unit,
      onPressed = null;

  const AppInputTrailing.progress({super.key})
    : _kind = _AppInputTrailingKind.progress,
      label = '확인 중',
      onPressed = null;

  final String label;
  final _AppInputTrailingKind _kind;

  /// action 전용. null이면 흐리게 보이고 누를 수 없다.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    switch (_kind) {
      case _AppInputTrailingKind.status:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppSvgIcon(AppIcons.checkCircleSmall, size: AppIconSize.stat),
            const SizedBox(width: AppSpacing.s5),
            Text(
              label,
              style: AppTextStyles.pretendardCaption1Medium.copyWith(
                color: AppColors.textBrand,
              ),
            ),
          ],
        );
      case _AppInputTrailingKind.action:
        final enabled = onPressed != null;
        return Semantics(
          button: true,
          enabled: enabled,
          label: label,
          onTap: onPressed,
          excludeSemantics: true,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onPressed,
            child: ConstrainedBox(
              // 입력창 높이만큼 누를 자리를 넓힌다.
              constraints: const BoxConstraints(
                minHeight: AppControlHeight.inputLg,
              ),
              child: Center(
                widthFactor: 1,
                child: Opacity(
                  opacity: enabled ? 1 : AppOpacity.disabled,
                  child: Text(
                    label,
                    style: AppTextStyles.pretendardH3.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      case _AppInputTrailingKind.timer:
        return Semantics(
          label: '남은 시간 $label',
          excludeSemantics: true,
          child: Text(
            label,
            style: AppTextStyles.archivoLabel.copyWith(
              color: AppColors.textPoint,
            ),
          ),
        );
      case _AppInputTrailingKind.unit:
        return Text(
          label,
          style: AppTextStyles.pretendardH3.copyWith(
            color: AppColors.textSecondary,
          ),
        );
      case _AppInputTrailingKind.progress:
        return Semantics(
          label: label,
          child: const SizedBox.square(
            dimension: AppIconSize.stat,
            child: CircularProgressIndicator(
              strokeWidth: AppBorderWidth.thick,
              color: AppColors.mainOrange,
            ),
          ),
        );
    }
  }
}

/// 누르면 목록을 여는 44 필드 ("은행 선택 ›"). 값이 없어도 글자는 진하게 보인다.
///
/// - 기본: 오른쪽 화살표 ("은행 선택 ›")
/// - [AppPickerField.dropdown]: 아래 화살표 ("선택해주세요. ⌄", 재고 등록 카테고리)
///
/// [trailing]을 주면 화살표 대신 그것을 둔다 (소비기한 "2026.09.26 [D-12]").
/// 40 높이·테두리·작은 채운 화살표인 [AppSelectField]와 모양이 다르다.
class AppPickerField extends StatelessWidget {
  const AppPickerField({
    super.key,
    required this.hint,
    this.value,
    this.onTap,
    this.semanticLabel,
    this.trailing,
  }) : _dropdown = false;

  const AppPickerField.dropdown({
    super.key,
    required this.hint,
    this.value,
    this.onTap,
    this.semanticLabel,
  }) : trailing = null,
       _dropdown = true;

  final String hint;
  final String? value;
  final VoidCallback? onTap;

  /// 읽어 줄 필드 이름 ("정산 은행").
  final String? semanticLabel;

  /// 화살표 자리에 둘 표시 (예: `AppBadge.outline('D-12')`).
  final Widget? trailing;
  final bool _dropdown;

  @override
  Widget build(BuildContext context) {
    const arrow = AppSvgIcon(
      AppIcons.chevronRight,
      color: AppColors.textPrimary,
    );
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: [?semanticLabel, value ?? hint].join(', '),
      onTap: onTap,
      excludeSemantics: true,
      child: Material(
        color: AppColors.backgroundDefault,
        borderRadius: AppRadius.r4All,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.r4All,
          child: Container(
            height: AppControlHeight.inputLg,
            padding: const EdgeInsets.only(
              left: AppSpacing.s16,
              right: AppSpacing.s12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value ?? hint,
                    style: AppTextStyles.pretendardBody1Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppSpacing.s8),
                trailing ??
                    // Figma는 오른쪽 화살표를 90° 돌려 아래 화살표로 쓴다.
                    (_dropdown
                        ? const RotatedBox(quarterTurns: 1, child: arrow)
                        : arrow),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
