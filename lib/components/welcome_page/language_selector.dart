import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  final List<String> languages;
  final String selectedLanguage;
  final Function(String) onLanguageChange;

  const LanguageSelector({
    super.key,
    required this.languages,
    required this.selectedLanguage,
    required this.onLanguageChange,
  });

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String _currentLanguage = '';

  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.selectedLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _currentLanguage,
      isExpanded: true, // Adjust based on your design
      underline: Container(), // Remove default underline
      items: widget.languages.map((String language) {
        return DropdownMenuItem<String>(
          value: language,
          child: Text(language),
        );
      }).toList(),
      onChanged: (String? newLanguage) {
        setState(() {
          _currentLanguage = newLanguage!;
          widget.onLanguageChange(newLanguage);
        });
      },
    );
  }
}
