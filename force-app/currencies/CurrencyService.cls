public with sharing class CurrencyService {
    
    @AuraEnabled (cacheable = true)
    public static Info getGeneralInfo(){
        
        String localeLabelFallback = 'Locale Label in APEX';
        String multiCurrencyLabelFallback = 'Multi Currency Label in APEX : ';
        
        System.debug(System.Label.Default_currency + '  ==>  ' + UserInfo.getDefaultCurrency());
        System.debug(System.Label.language + '  ==>  ' + UserInfo.getLanguage());
        
        String localeLabel = getLabel('Locale',localeLabelFallback,'fr') ;
        String multiCurrencyLabel = getLabel('is_Multi_Currency',multiCurrencyLabelFallback,'es') ;
        String multiCurrencyLabelRussian = getLabel('is_Multi_Currency',multiCurrencyLabelFallback,'ru') ;
        
        System.debug(localeLabel + '  ==>  ' + UserInfo.getLocale());
        System.debug(multiCurrencyLabel + '  ==>  ' + UserInfo.isMultiCurrencyOrganization());
        System.debug('multiCurrencyLabelRussian' + '  ==>  ' + multiCurrencyLabelRussian);
        
        Info information = new Info();
        information.defaultCurrency = UserInfo.getDefaultCurrency();
        information.locale = UserInfo.getLocale();
        information.language = UserInfo.getLanguage();
        information.isMultiCurrency = UserInfo.isMultiCurrencyOrganization();
        
        return information;
    }
    
    private static String getLabel(String name, String fallback, String language){
        
        String label = System.Label.translationExists('',name,language) ? System.label.get('',name,language) : fallback;
        return label;
    }

    @AuraEnabled
    public static List<Opportunity> getOpportunities(){
        Opportunity opp = [SELECT Id,Name,Amount,format(Amount) amm,CurrencyIsoCode FROM Opportunity WHERE Amount = 400 limit 1];
        System.debug(opp.Amount);
        System.debug(opp.get('amm'));
        return SelectAll();
    }

    private static List<Opportunity> SelectAll(){
        return [SELECT Id,Name,format(Amount) amm2,format(ConvertCurrency(Amount)) amm, ConvertCurrency(Amount) ammNoFormat,Amount,CurrencyIsoCode FROM Opportunity];
    }



    
    public class Info{
        @AuraEnabled public String defaultCurrency;
        @AuraEnabled public String locale;
        @AuraEnabled public String language;
        @AuraEnabled public Boolean isMultiCurrency;
    }
}