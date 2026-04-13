public with sharing class CurrencyService {

    @AuraEnabled (cacheable = true)
    public static Info getGeneralInfo(){
        
        
        System.debug(System.Label.Default_currency + '  ==>  ' + UserInfo.getDefaultCurrency());
        System.debug(System.Label.Locale + '  ==>  ' + UserInfo.getLocale());
        System.debug(System.Label.language + '  ==>  ' + UserInfo.getLanguage());

        System.debug('translationExists Locale : ' + System.Label.translationExists('','Locale','fr'));
        System.debug('translationExists Multi : '  + System.Label.translationExists('','is_Multi_Currency','fr'));
        System.debug(System.Label.is_Multi_Currency + '  ==>  ' + UserInfo.isMultiCurrencyOrganization());
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