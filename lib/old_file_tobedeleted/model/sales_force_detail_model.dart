import 'dart:convert';

class SalesforceDetailModel {
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

  SalesforceDetailModel({
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

  factory SalesforceDetailModel.fromRawJson(String str) =>
      SalesforceDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalesforceDetailModel.fromJson(Map<String, dynamic> json) =>
      SalesforceDetailModel(
        attributes: Attributes.fromJson(json["attributes"]),
        id: json["Id"],
        isDeleted: json["IsDeleted"],
        // masterRecordId: json["MasterRecordId"],
        name: json["Name"],
        type: json["Type"],
        recordTypeId: json["RecordTypeId"],
        billingStreet: json["BillingStreet"],
        billingCity: json["BillingCity"],
        // billingState: json["BillingState"],
        // billingPostalCode: json["BillingPostalCode"],
        billingCountry: json["BillingCountry"],
        // billingLatitude: json["BillingLatitude"],
        // billingLongitude: json["BillingLongitude"],
        // billingGeocodeAccuracy: json["BillingGeocodeAccuracy"],
        // billingAddress: BillingAddress.fromJson(json["BillingAddress"]),
        // shippingStreet: json["ShippingStreet"],
        // shippingCity: json["ShippingCity"],
        // shippingState: json["ShippingState"],
        // shippingPostalCode: json["ShippingPostalCode"],
        // shippingCountry: json["ShippingCountry"],
        // shippingLatitude: json["ShippingLatitude"],
        // shippingLongitude: json["ShippingLongitude"],
        // shippingGeocodeAccuracy: json["ShippingGeocodeAccuracy"],
        // shippingAddress: json["ShippingAddress"],
        // phone: json["Phone"],
        // fax: json["Fax"],
        // website: json["Website"],
        photoUrl: json["PhotoUrl"],
        // industry: json["Industry"],
        // annualRevenue: json["AnnualRevenue"],
        // numberOfEmployees: json["NumberOfEmployees"],
        // description: json["Description"],
        currencyIsoCode: json["CurrencyIsoCode"],
        ownerId: json["OwnerId"],
        createdDate: json["CreatedDate"],
        createdById: json["CreatedById"],
        lastModifiedDate: json["LastModifiedDate"],
        lastModifiedById: json["LastModifiedById"],
        systemModstamp: json["SystemModstamp"],
        // lastActivityDate: json["LastActivityDate"],
        lastViewedDate: json["LastViewedDate"],
        lastReferencedDate: json["LastReferencedDate"],
        // jigsaw: json["Jigsaw"],
        // jigsawCompanyId: json["JigsawCompanyId"],
        // accountSource: json["AccountSource"],
        // sicDesc: json["SicDesc"],
        // activeC: json["Active__c"],
        // natureOfBusinessC: json["Nature_of_Business__c"],
        // bankNameC: json["Bank_Name__c"],
        // aCNoC: json["A_C_No__c"],
        // swiftCodeC: json["Swift_Code__c"],
        // nameOfAccountC: json["Name_of_Account__c"],
        // bankLocationC: json["Bank_Location__c"],
        // accountCompanyNameC: json["Account_Company_Name__c"],
        // typeOfLogisticC: json["Type_of_Logistic__c"],
        // totalNoOffOpportunitiesC: json["Total_No_Off_Opportunities__c"],
        // specificationOfProductsC: json["Specification_of_Products__c"],
        // imageOfPackedProductsC: json["Image_of_Packed_Products__c"],
        // msdsC: json["MSDS__c"],
        // estimatedDeliveryC: json["Estimated_Delivery__c"],
        // quotationC: json["Quotation__c"],
        // packagingDetailsC: json["Packaging_Details__c"],
        // paymentTermsC: json["Payment_Terms__c"],
        // anySpecificationFromCustomerC: json["Any_Specification_from_Customer__c"],
        // applicationTheProductWillBeUsedForC: json["Application_the_product_will_be_used_for__c"],
        // portOfDischargeC: json["Port_of_Discharge__c"],
        // incotermsDeliveryTermsC: json["Incoterms_Delivery_Terms__c"],
        // anySpecificGradesC: json["Any_specific_grades__c"],
        // tdsC: json["TDS__c"],
        // quantityRequiredC: json["Quantity_Required__c"],
        // portOfLoadingC: json["Port_of_Loading__c"],
        // ibanNoC: json["IBAN_No__c"],
        // companyRegistrationC: json["Company_Registration__c"],
        // bankStreetC: json["Bank_Street__c"],
        // bankCityC: json["Bank_City__c"],
        // bankStateC: json["Bank_State__c"],
        // bankCountryC: json["Bank_Country__c"],
        // bankPostalCodeC: json["Bank_Postal_Code__c"],
        // regionC: json["Region__c"],
        // trackingLinkC: json["Tracking_Link__c"],
        // workedByC: json["Worked_By__c"],
        // parentCompanyC: json["PARENT_COMPANY__c"],
        // bankAddressC: json["Bank_Address__c"],
        // bankCurrencyC: json["Bank_Currency__c"],
        // bankPhoneC: json["Bank_Phone__c"],
        // bankFaxC: json["Bank_Fax__c"],
        businessEntityC: json["Business_Entity__c"],
        // uomC: json["UOM__c"],
        insuranceCompanyNameC: json["Insurance_Company_Name__c"],
        // productNameC: json["Product_Name__c"],
        // ainNoC: json["AIN_NO__c"],
        // binNoC: json["BIN_NO__c"],
        // cellPhoneC: json["Cell_Phone__c"],
        // breadWinnerBwAccountStatusC: json["Bread_Winner__BW_Account_Status__c"],
        // breadWinnerTotalAmountCreditC: json["Bread_Winner__Total_Amount_Credit__c"],
        // breadWinnerTotalAmountDueC: json["Bread_Winner__Total_Amount_Due__c"],
        // breadWinnerTotalAmountInvoicedC: json["Bread_Winner__Total_Amount_Invoiced__c"],
        // breadWinnerTotalAmountOverdueC: json["Bread_Winner__Total_Amount_Overdue__c"],
        // breadWinnerTotalAmountPaidC: json["Bread_Winner__Total_Amount_Paid__c"],
        // breadWinnerTotalDraftAmountC: json["Bread_Winner__Total_Draft_Amount__c"],
        // breadWinnerTotalUnallocatedCreditC: json["Bread_Winner__Total_Unallocated_Credit__c"],
        // creditLimitC: json["Credit_Limit__c"],
        // totalCostPriceQuantityC: json["Total_Cost_Price_Quantity__c"],
        // totalCostPriceC: json["Total_Cost_Price__c"],
        // totalOpportunityAmountC: json["Total_Opportunity_Amount__c"],
        // totalOpportunityQuantityC: json["Total_Opportunity_Quantity__c"],
        // totalAmountOfAllOpportunitiesC: json["Total_Amount_of_all_Opportunities__c"],
        // taxIdentificationNumberVatC: json["TAX_IDENTIFICATION_NUMBER_VAT__c"],
        // salesTaxIdentificationNumberCstC: json["SALES_TAX_IDENTIFICATION_NUMBER_CST__c"],
        // gstRegNoC: json["GST_Reg_No__c"],
        // netSalesValueNsvC: json["Net_Sales_Value_NSV__c"],
        // importExportCodeIecC: json["IMPORT_EXPORT_CODE_IEC__c"],
        // stateNameAndCodeC: json["State_Name_and_Code__c"],
        // authorisedDealerCodeAdcC: json["Authorised_Dealer_Code_ADC__c"],
        // chaNumberC: json["CHA_Number__c"],
        // otherChaChargesC: json["Other_CHA_Charges__c"],
        // clearanceChargeC: json["Clearance_Charge__c"],
        // relatedToC: json["Related_To__c"],
        // totalQuantityC: json["Total_Quantity__c"],
        // emailC: json["Email__c"],
        // rh2TestCurrencyC: json["rh2__testCurrency__c"],
        // sendEmailReminderC: json["Send_Email_Reminder__c"],
        // workedBy2C: json["Worked_By_2__c"],
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
        "Id": id,
        "IsDeleted": isDeleted,
        // "MasterRecordId": masterRecordId,
        "Name": name,
        "Type": type,
        // "RecordTypeId": recordTypeId,
        // "BillingStreet": billingStreet,
        // "BillingCity": billingCity,
        // "BillingState": billingState,
        // "BillingPostalCode": billingPostalCode,
        // "BillingCountry": billingCountry,
        // "BillingLatitude": billingLatitude,
        // "BillingLongitude": billingLongitude,
        // "BillingGeocodeAccuracy": billingGeocodeAccuracy,
        // "BillingAddress": billingAddress.toJson(),
        // "ShippingStreet": shippingStreet,
        // "ShippingCity": shippingCity,
        // "ShippingState": shippingState,
        // "ShippingPostalCode": shippingPostalCode,
        // "ShippingCountry": shippingCountry,
        // "ShippingLatitude": shippingLatitude,
        // "ShippingLongitude": shippingLongitude,
        // "ShippingGeocodeAccuracy": shippingGeocodeAccuracy,
        // "ShippingAddress": shippingAddress,
        // "Phone": phone,
        // "Fax": fax,
        // "Website": website,
        // "PhotoUrl": photoUrl,
        // "Industry": industry,
        // "AnnualRevenue": annualRevenue,
        // "NumberOfEmployees": numberOfEmployees,
        // "Description": description,
        // "CurrencyIsoCode": currencyIsoCode,
        // "OwnerId": ownerId,
        // "CreatedDate": createdDate,
        // "CreatedById": createdById,
        // "LastModifiedDate": lastModifiedDate,
        // "LastModifiedById": lastModifiedById,
        // "SystemModstamp": systemModstamp,
        // "LastActivityDate": lastActivityDate,
        // "LastViewedDate": lastViewedDate,
        // "LastReferencedDate": lastReferencedDate,
        // "Jigsaw": jigsaw,
        // "JigsawCompanyId": jigsawCompanyId,
        // "AccountSource": accountSource,
        // "SicDesc": sicDesc,
        // "Active__c": activeC,
        // "Nature_of_Business__c": natureOfBusinessC,
        // "Bank_Name__c": bankNameC,
        // "A_C_No__c": aCNoC,
        // "Swift_Code__c": swiftCodeC,
        // "Name_of_Account__c": nameOfAccountC,
        // "Bank_Location__c": bankLocationC,
        // "Account_Company_Name__c": accountCompanyNameC,
        // "Type_of_Logistic__c": typeOfLogisticC,
        // "Total_No_Off_Opportunities__c": totalNoOffOpportunitiesC,
        // "Specification_of_Products__c": specificationOfProductsC,
        // "Image_of_Packed_Products__c": imageOfPackedProductsC,
        // "MSDS__c": msdsC,
        // "Estimated_Delivery__c": estimatedDeliveryC,
        // "Quotation__c": quotationC,
        // "Packaging_Details__c": packagingDetailsC,
        // "Payment_Terms__c": paymentTermsC,
        // "Any_Specification_from_Customer__c": anySpecificationFromCustomerC,
        // "Application_the_product_will_be_used_for__c": applicationTheProductWillBeUsedForC,
        // "Port_of_Discharge__c": portOfDischargeC,
        // "Incoterms_Delivery_Terms__c": incotermsDeliveryTermsC,
        // "Any_specific_grades__c": anySpecificGradesC,
        // "TDS__c": tdsC,
        // "Quantity_Required__c": quantityRequiredC,
        // "Port_of_Loading__c": portOfLoadingC,
        // "IBAN_No__c": ibanNoC,
        // "Company_Registration__c": companyRegistrationC,
        // "Bank_Street__c": bankStreetC,
        // "Bank_City__c": bankCityC,
        // "Bank_State__c": bankStateC,
        // "Bank_Country__c": bankCountryC,
        // "Bank_Postal_Code__c": bankPostalCodeC,
        // "Region__c": regionC,
        // "Tracking_Link__c": trackingLinkC,
        // "Worked_By__c": workedByC,
        // "PARENT_COMPANY__c": parentCompanyC,
        // "Bank_Address__c": bankAddressC,
        // "Bank_Currency__c": bankCurrencyC,
        // "Bank_Phone__c": bankPhoneC,
        // "Bank_Fax__c": bankFaxC,
        "Business_Entity__c": businessEntityC,
        // "UOM__c": uomC,
        // "Insurance_Company_Name__c": insuranceCompanyNameC,
        // "Product_Name__c": productNameC,
        // "AIN_NO__c": ainNoC,
        // "BIN_NO__c": binNoC,
        // "Cell_Phone__c": cellPhoneC,
        // "Bread_Winner__BW_Account_Status__c": breadWinnerBwAccountStatusC,
        // "Bread_Winner__Total_Amount_Credit__c": breadWinnerTotalAmountCreditC,
        // "Bread_Winner__Total_Amount_Due__c": breadWinnerTotalAmountDueC,
        // "Bread_Winner__Total_Amount_Invoiced__c": breadWinnerTotalAmountInvoicedC,
        // "Bread_Winner__Total_Amount_Overdue__c": breadWinnerTotalAmountOverdueC,
        // "Bread_Winner__Total_Amount_Paid__c": breadWinnerTotalAmountPaidC,
        // "Bread_Winner__Total_Draft_Amount__c": breadWinnerTotalDraftAmountC,
        // "Bread_Winner__Total_Unallocated_Credit__c": breadWinnerTotalUnallocatedCreditC,
        // "Credit_Limit__c": creditLimitC,
        // "Total_Cost_Price_Quantity__c": totalCostPriceQuantityC,
        // "Total_Cost_Price__c": totalCostPriceC,
        // "Total_Opportunity_Amount__c": totalOpportunityAmountC,
        // "Total_Opportunity_Quantity__c": totalOpportunityQuantityC,
        // "Total_Amount_of_all_Opportunities__c": totalAmountOfAllOpportunitiesC,
        // "TAX_IDENTIFICATION_NUMBER_VAT__c": taxIdentificationNumberVatC,
        // "SALES_TAX_IDENTIFICATION_NUMBER_CST__c": salesTaxIdentificationNumberCstC,
        // "GST_Reg_No__c": gstRegNoC,
        // "Net_Sales_Value_NSV__c": netSalesValueNsvC,
        // "IMPORT_EXPORT_CODE_IEC__c": importExportCodeIecC,
        // "State_Name_and_Code__c": stateNameAndCodeC,
        // "Authorised_Dealer_Code_ADC__c": authorisedDealerCodeAdcC,
        // "CHA_Number__c": chaNumberC,
        // "Other_CHA_Charges__c": otherChaChargesC,
        // "Clearance_Charge__c": clearanceChargeC,
        // "Related_To__c": relatedToC,
        // "Total_Quantity__c": totalQuantityC,
        // "Email__c": emailC,
        // "rh2__testCurrency__c": rh2TestCurrencyC,
        // "Send_Email_Reminder__c": sendEmailReminderC,
        // "Worked_By_2__c": workedBy2C,
      };
}

class Attributes {
  final String type;
  final String url;

  Attributes({
    required this.type,
    required this.url,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
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

  BillingAddress({
    required this.city,
    required this.country,
    required this.geocodeAccuracy,
    required this.latitude,
    required this.longitude,
    required this.postalCode,
    required this.state,
    required this.street,
  });

  factory BillingAddress.fromRawJson(String str) =>
      BillingAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
        city: json["city"],
        country: json["country"],
        geocodeAccuracy: json["geocodeAccuracy"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        postalCode: json["postalCode"],
        state: json["state"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "geocodeAccuracy": geocodeAccuracy,
        "latitude": latitude,
        "longitude": longitude,
        "postalCode": postalCode,
        "state": state,
        "street": street,
      };
}
