public with sharing class CurrencyService {

    @AuraEnabled (cacheable = true)
    public static Info getGeneralInfo(){
        
        System.debug('Default currency ==>  ' + UserInfo.getDefaultCurrency());
        System.debug('Locale ==>  ' + UserInfo.getLocale());
        System.debug('Language ==>  ' + UserInfo.getLanguage());
        System.debug('Is Multi Currency ? ==>  ' + UserInfo.isMultiCurrencyOrganization());
        Info information = new Info();
            information.defaultCurrency = UserInfo.getDefaultCurrency();
            information.locale = UserInfo.getLocale();
            information.language = UserInfo.getLanguage();
            information.isMultiCurrency = UserInfo.isMultiCurrencyOrganization();
        
        return information;
    }

    public class Info{
        @AuraEnabled public String defaultCurrency;
        @AuraEnabled public String locale;
        @AuraEnabled public String language;
        @AuraEnabled public Boolean isMultiCurrency;
    }
}