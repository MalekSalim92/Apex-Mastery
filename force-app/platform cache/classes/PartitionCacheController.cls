public with sharing class PartitionCacheController 
{

        @AuraEnabled 
        public static void storeAccountToCache()
        {
            List<Account> accs = [SELECT Id FROM Account];
            Cache.Session.put('AccountCachedDefaultSession',accs);
            Cache.Session.put('local.TacoPartition.AccountCachedInTacoSession',accs);
            Cache.Org.put('AccountCachedInDefaultOrg',accs);
            Cache.Org.put('local.TacoPartition.AccountCachedToTacoOrg',accs);
        }

        @AuraEnabled
        public static List<Account> getAccountBySOQL()
        {
            return [SELECT ID FROM Account];
        }
        
        @auraEnabled 
        public static List<Account> getAccountByCachePartition()
        {
            return (List<Account>) Cache.Org.get('AccountCachedDefaultSession');
        }


        public static List<Account> getAccounts()
        {
            List<Account> cachedAccounts = (List<Account>) Cache.Org.get(Constants.ACCOUNT_CACHE_KEY);
            if(cachedAccounts != null)
            {
                return cachedAccounts;
            }

            List<Account> dbAccounts = [SELECT Id FROM Account];
            Cache.Org.put(Constants.ACCOUNT_CACHE_KEY,dbAccounts,Constants.CACHE_TIMEOUT);
            return dbAccounts; 

        }

        // to be called in each triggerHandler
        public void invalidateCache() 
        {
            Cache.Org.remove(Constants.ACCOUNT_CACHE_KEY);
        }
    }