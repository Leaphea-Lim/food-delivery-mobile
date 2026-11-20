/// អាសយដ្ឋានដែលបានរក្សាទុក (តារាង addresses)
class SavedAddress {
  const SavedAddress({
    required this.id,
    required this.label,
    required this.addressLine,
    this.note,
    this.isDefault = false,
  });

  final String id;
  final String label; // Home / Work / Other
  final String addressLine;
  final String? note;
  final bool isDefault;

  SavedAddress copyWith({
    String? label,
    String? addressLine,
    String? note,
    bool? isDefault,
  }) {
    return SavedAddress(
      id: id,
      label: label ?? this.label,
      addressLine: addressLine ?? this.addressLine,
      note: note ?? this.note,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
