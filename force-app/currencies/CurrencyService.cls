public with sharing class CurrencyService {

    @AuraEnabled (cacheable = true)
    public static Info getGeneralInfo(){
        
        String localeLabel = 'Locale Label in APEX';
        String multiCurrencyLabel = 'Multi Currency Label in APEX : ';
        
        System.debug(System.Label.Default_currency + '  ==>  ' + UserInfo.getDefaultCurrency());
        System.debug(System.Label.language + '  ==>  ' + UserInfo.getLanguage());
        
        localeLabel = System.Label.translationExists('','Locale','fr') ? System.Label.get('','Locale') : localeLabel;
        multiCurrencyLabel = System.Label.translationExists('','is_Multi_Currency','fr') ? System.Label.is_Multi_Currency : multiCurrencyLabel;
        System.debug(localeLabel + '  ==>  ' + UserInfo.getLocale());
        System.debug(multiCurrencyLabel + '  ==>  ' + UserInfo.isMultiCurrencyOrganization());
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