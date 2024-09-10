import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interior_design/utils/formatters/formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => Zformatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() =>
      AddressModel(
          id: '',
          name: '',
          phoneNumber: '',
          street: '',
          city: '',
          state: '',
          postalCode: '',
          country: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNo': phoneNumber,
      'Street': street,
      'City': city,
      'State': state,
      'PostalCode': postalCode,
      'Country': country,
      'DateTime': DateTime.now(),
      'SelectedAddress': selectedAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['Id'] as String,
      name: data['Name'] as String,
      phoneNumber: data['PhoneNo'] as String,
      street: data['Street'] as String,
      city: data['City'] as String,
      state: data['State'] as String,
      postalCode: data['Postal Code'] as String,
      country: data['Country'] as String,
      selectedAddress: data['SelectedAddress'] as bool,
      dateTime: (data['DateTime'] as Timestamp).toDate(),
    );
  }

  // Factory constructor to create an AddressModel from a DocumentSnapshot
  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return AddressModel(id: snapshot.id,
        name: data['Name'] ?? '',
        phoneNumber: data['PhoneNo'] ?? '',
        street: data['Street'] ?? '',
        city: data['City'] ?? '',
        state: data['State'] ?? '',
        postalCode: data['PostalCode'] ?? '',
        country: data['Country'] ?? '',
        selectedAddress: data['SelectedAddress'] as bool,
        dateTime: (data['DateTime'] as Timestamp).toDate(),
    );
  }

  @override
  String toString() {
    return '$street, $city, $state, $postalCode, $country';
  }
}
