import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Figma 채팅 입력줄: 입력창(40) + 전송 버튼(52).
/// 입력값이 있으면 전송 버튼이 오렌지로 활성화된다.
class AppMessageField extends StatefulWidget {
  const AppMessageField({
    super.key,
    required this.onSend,
    this.controller,
    this.hintText = '메세지를 입력해주세요',
    this.sendLabel = '전송',
    this.enabled = true,
  });

  /// 전송 시 호출. 호출 뒤 입력값은 비워진다.
  final ValueChanged<String> onSend;
  final TextEditingController? controller;
  final String hintText;
  final String sendLabel;
  final bool enabled;

  @override
  State<AppMessageField> createState() => _AppMessageFieldState();
}

class _AppMessageFieldState extends State<AppMessageField> {
  static const double _sendWidth = 52;

  TextEditingController? _ownController;
  TextEditingController get _controller =>
      widget.controller ?? (_ownController ??= TextEditingController());

  bool get _hasText => _controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  @override
  void didUpdateWidget(covariant AppMessageField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      (oldWidget.controller ?? _ownController)?.removeListener(_onChanged);
      _controller.addListener(_onChanged);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onChanged);
    _ownController?.dispose();
    super.dispose();
  }

  void _onChanged() => setState(() {});

  void _send() {
    if (!widget.enabled || !_hasText) return;
    final text = _controller.text.trim();
    _controller.clear();
    widget.onSend(text);
  }

  @override
  Widget build(BuildContext context) {
    final active = widget.enabled && _hasText;
    final hintStyle = AppTextStyles.pretendardBody2Regular.copyWith(
      color: AppColors.textDisabled,
    );

    return Row(
      children: [
        Expanded(
          child: Container(
            height: AppControlHeight.input,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: AppColors.backgroundPressed,
              borderRadius: AppRadius.r4All,
            ),
            child: TextField(
              controller: _controller,
              enabled: widget.enabled,
              style: AppTextStyles.pretendardBody2Regular,
              maxLines: 1,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _send(),
              decoration: InputDecoration.collapsed(
                hintText: widget.hintText,
                hintStyle: hintStyle,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.s6),
        Semantics(
          button: true,
          enabled: active,
          label: widget.sendLabel,
          child: Material(
            color: active
                ? AppColors.backgroundBrand
                : AppColors.backgroundPressed,
            borderRadius: AppRadius.r4All,
            child: InkWell(
              onTap: active ? _send : null,
              borderRadius: AppRadius.r4All,
              child: SizedBox(
                width: _sendWidth,
                height: AppControlHeight.input,
                child: Center(
                  child: ExcludeSemantics(
                    child: Text(
                      widget.sendLabel,
                      style: active
                          ? AppTextStyles.pretendardBody2.copyWith(
                              color: AppColors.textInverse,
                            )
                          : hintStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
