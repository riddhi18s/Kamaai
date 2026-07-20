import 'package:flutter/material.dart';

class LanguageSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback? onVoicePressed;

  const LanguageSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.focusNode,
    this.onVoicePressed,
  });

  @override
  State<LanguageSearchBar> createState() => _LanguageSearchBarState();
}

class _LanguageSearchBarState extends State<LanguageSearchBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_refresh);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        textInputAction: TextInputAction.search,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: "अपनी भाषा खोजें / Search language",
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Color(0xff165C34),
          ),
          suffixIcon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            child: Row(
              key: ValueKey(widget.controller.text.isNotEmpty),
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.controller.text.isNotEmpty)
                  IconButton(
                    tooltip: "Clear",
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      widget.controller.clear();
                      widget.onChanged("");
                    },
                  ),
                IconButton(
                  tooltip: "Speak language",
                  onPressed: widget.onVoicePressed,
                  icon: const Icon(
                    Icons.mic_rounded,
                    color: Color(0xff165C34),
                  ),
                ),
              ],
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Color(0xff165C34),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}