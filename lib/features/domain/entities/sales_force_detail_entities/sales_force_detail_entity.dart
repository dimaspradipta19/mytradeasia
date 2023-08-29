import 'package:equatable/equatable.dart';

class SalesforceDetailModel extends Equatable {
  final Attributes attributes;
  final String id;
  final bool isDeleted;
  // final dynamic masterRecordId;
  final String name;
  final String type;
  final String recordTypeId;
  final String billingStreet;
  final String billingCity;
  // final dynamic billingState;
  // final dynamic billingPostalCode;
  final String billingCountry;
  // final dynamic billingLatitude;
  // final dynamic billingLongitude;
  // final dynamic billingGeocodeAccuracy;
  // final BillingAddress billingAddress;
  // final dynamic shippingStreet;
  // final dynamic shippingCity;
  // final dynamic shippingState;
  // final dynamic shippingPostalCode;
  // final dynamic shippingCountry;
  // final dynamic shippingLatitude;
  // final dynamic shippingLongitude;
  // final dynamic shippingGeocodeAccuracy;
  // final dynamic shippingAddress;
  // final dynamic phone;
  // final dynamic fax;
  // final dynamic website;
  final String photoUrl;
  // final dynamic industry;
  // final dynamic annualRevenue;
  // final dynamic numberOfEmployees;
  // final dynamic description;
  final String currencyIsoCode;
  final String ownerId;
  final String createdDate;
  final String createdById;
  final String lastModifiedDate;
  final String lastModifiedById;
  final String systemModstamp;
  // final dynamic lastActivityDate;
  final dynamic lastViewedDate;
  final dynamic lastReferencedDate;
  // final dynamic jigsaw;
  // final dynamic jigsawCompanyId;
  // final dynamic accountSource;
  // final dynamic sicDesc;
  // final bool activeC;
  // final dynamic natureOfBusinessC;
  // final dynamic bankNameC;
  // final dynamic aCNoC;
  // final dynamic swiftCodeC;
  // final dynamic nameOfAccountC;
  // final dynamic bankLocationC;
  // final String accountCompanyNameC;
  // final dynamic typeOfLogisticC;
  // final int totalNoOffOpportunitiesC;
  // final dynamic specificationOfProductsC;
  // final bool imageOfPackedProductsC;
  // final bool msdsC;
  // final dynamic estimatedDeliveryC;
  // final dynamic quotationC;
  // final dynamic packagingDetailsC;
  // final dynamic paymentTermsC;
  // final dynamic anySpecificationFromCustomerC;
  // final dynamic applicationTheProductWillBeUsedForC;
  // final dynamic portOfDischargeC;
  // final dynamic incotermsDeliveryTermsC;
  // final dynamic anySpecificGradesC;
  // final bool tdsC;
  // final dynamic quantityRequiredC;
  // final dynamic portOfLoadingC;
  // final dynamic ibanNoC;
  // final dynamic companyRegistrationC;
  // final dynamic bankStreetC;
  // final dynamic bankCityC;
  // final dynamic bankStateC;
  // final dynamic bankCountryC;
  // final dynamic bankPostalCodeC;
  // final dynamic regionC;
  // final dynamic trackingLinkC;
  // final String workedByC;
  // final dynamic parentCompanyC;
  // final dynamic bankAddressC;
  // final dynamic bankCurrencyC;
  // final dynamic bankPhoneC;
  // final dynamic bankFaxC;
  final String businessEntityC;
  // final dynamic uomC;
  final String insuranceCompanyNameC;
  // final dynamic productNameC;
  // final dynamic ainNoC;
  // final dynamic binNoC;
  // final dynamic cellPhoneC;
  // final String breadWinnerBwAccountStatusC;
  // final dynamic breadWinnerTotalAmountCreditC;
  // final dynamic breadWinnerTotalAmountDueC;
  // final dynamic breadWinnerTotalAmountInvoicedC;
  // final dynamic breadWinnerTotalAmountOverdueC;
  // final dynamic breadWinnerTotalAmountPaidC;
  // final int breadWinnerTotalDraftAmountC;
  // final dynamic breadWinnerTotalUnallocatedCreditC;
  // final int creditLimitC;
  // final dynamic totalCostPriceQuantityC;
  // final dynamic totalCostPriceC;
  // final dynamic totalOpportunityAmountC;
  // final dynamic totalOpportunityQuantityC;
  // final int totalAmountOfAllOpportunitiesC;
  // final dynamic taxIdentificationNumberVatC;
  // final dynamic salesTaxIdentificationNumberCstC;
  // final dynamic gstRegNoC;
  // final dynamic netSalesValueNsvC;
  // final dynamic importExportCodeIecC;
  // final dynamic stateNameAndCodeC;
  // final dynamic authorisedDealerCodeAdcC;
  // final dynamic chaNumberC;
  // final dynamic otherChaChargesC;
  // final dynamic clearanceChargeC;
  // final dynamic relatedToC;
  // final int totalQuantityC;
  // final dynamic emailC;
  // final dynamic rh2TestCurrencyC;
  // final bool sendEmailReminderC;
  // final dynamic workedBy2C;

  const SalesforceDetailModel({
    required this.attributes,
    required this.id,
    required this.isDeleted,
    // required this.masterRecordId,
    required this.name,
    required this.type,
    required this.recordTypeId,
    required this.billingStreet,
    required this.billingCity,
    // required this.billingState,
    // required this.billingPostalCode,
    required this.billingCountry,
    // required this.billingLatitude,
    // required this.billingLongitude,
    // required this.billingGeocodeAccuracy,
    // required this.billingAddress,
    // required this.shippingStreet,
    // required this.shippingCity,
    // required this.shippingState,
    // required this.shippingPostalCode,
    // required this.shippingCountry,
    // required this.shippingLatitude,
    // required this.shippingLongitude,
    // required this.shippingGeocodeAccuracy,
    // required this.shippingAddress,
    // required this.phone,
    // required this.fax,
    // required this.website,
    required this.photoUrl,
    // required this.industry,
    // required this.annualRevenue,
    // required this.numberOfEmployees,
    // required this.description,
    required this.currencyIsoCode,
    required this.ownerId,
    required this.createdDate,
    required this.createdById,
    required this.lastModifiedDate,
    required this.lastModifiedById,
    required this.systemModstamp,
    // required this.lastActivityDate,
    required this.lastViewedDate,
    required this.lastReferencedDate,
    // required this.jigsaw,
    // required this.jigsawCompanyId,
    // required this.accountSource,
    // required this.sicDesc,
    // required this.activeC,
    // required this.natureOfBusinessC,
    // required this.bankNameC,
    // required this.aCNoC,
    // required this.swiftCodeC,
    // required this.nameOfAccountC,
    // required this.bankLocationC,
    // required this.accountCompanyNameC,
    // required this.typeOfLogisticC,
    // required this.totalNoOffOpportunitiesC,
    // required this.specificationOfProductsC,
    // required this.imageOfPackedProductsC,
    // required this.msdsC,
    // required this.estimatedDeliveryC,
    // required this.quotationC,
    // required this.packagingDetailsC,
    // required this.paymentTermsC,
    // required this.anySpecificationFromCustomerC,
    // required this.applicationTheProductWillBeUsedForC,
    // required this.portOfDischargeC,
    // required this.incotermsDeliveryTermsC,
    // required this.anySpecificGradesC,
    // required this.tdsC,
    // required this.quantityRequiredC,
    // required this.portOfLoadingC,
    // required this.ibanNoC,
    // required this.companyRegistrationC,
    // required this.bankStreetC,
    // required this.bankCityC,
    // required this.bankStateC,
    // required this.bankCountryC,
    // required this.bankPostalCodeC,
    // required this.regionC,
    // required this.trackingLinkC,
    // required this.workedByC,
    // required this.parentCompanyC,
    // required this.bankAddressC,
    // required this.bankCurrencyC,
    // required this.bankPhoneC,
    // required this.bankFaxC,
    required this.businessEntityC,
    // required this.uomC,
    required this.insuranceCompanyNameC,
    // required this.productNameC,
    // required this.ainNoC,
    // required this.binNoC,
    // required this.cellPhoneC,
    // required this.breadWinnerBwAccountStatusC,
    // required this.breadWinnerTotalAmountCreditC,
    // required this.breadWinnerTotalAmountDueC,
    // required this.breadWinnerTotalAmountInvoicedC,
    // required this.breadWinnerTotalAmountOverdueC,
    // required this.breadWinnerTotalAmountPaidC,
    // required this.breadWinnerTotalDraftAmountC,
    // required this.breadWinnerTotalUnallocatedCreditC,
    // required this.creditLimitC,
    // required this.totalCostPriceQuantityC,
    // required this.totalCostPriceC,
    // required this.totalOpportunityAmountC,
    // required this.totalOpportunityQuantityC,
    // required this.totalAmountOfAllOpportunitiesC,
    // required this.taxIdentificationNumberVatC,
    // required this.salesTaxIdentificationNumberCstC,
    // required this.gstRegNoC,
    // required this.netSalesValueNsvC,
    // required this.importExportCodeIecC,
    // required this.stateNameAndCodeC,
    // required this.authorisedDealerCodeAdcC,
    // required this.chaNumberC,
    // required this.otherChaChargesC,
    // required this.clearanceChargeC,
    // required this.relatedToC,
    // required this.totalQuantityC,
    // required this.emailC,
    // required this.rh2TestCurrencyC,
    // required this.sendEmailReminderC,
    // required this.workedBy2C,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Attributes {
  final String type;
  final String url;

  const Attributes({
    required this.type,
    required this.url,
  });
}

class BillingAddress {
  final String city;
  final String country;
  final dynamic geocodeAccuracy;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic postalCode;
  final dynamic state;
  final String street;

  const BillingAddress({
    required this.city,
    required this.country,
    required this.geocodeAccuracy,
    required this.latitude,
    required this.longitude,
    required this.postalCode,
    required this.state,
    required this.street,
  });
}
