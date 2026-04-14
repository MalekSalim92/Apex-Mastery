public with sharing class CustomSettingService {

    @AuraEnabled
    public static String getCountryName(){
        Country__c country = Country__c.getInstance();
        System.debug('Country' + country);
        return country.Name__c;
    }

        @AuraEnabled
    public static String getCountryNameDefaultValue(){
        Country__c country = Country__c.getOrgDefaults();
        System.debug('Country' + country);
        return country.Name__c;
    }

    @AuraEnabled
    public static String getCustomMetadataCountry(){
        String country = '';
        country = (CountryMDT__mdt.getInstance('Canada')).DeveloperName;
        return country;
    }

    public static void getAllMetadata(){

        Map<String,CountryMDT__mdt> countriesById= CountryMDT__mdt.getAll();
        List<CountryMDT__mdt> countries = CountryMDT__mdt.getAll().values();
    }
}