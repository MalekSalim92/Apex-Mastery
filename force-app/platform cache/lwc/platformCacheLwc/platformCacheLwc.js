import { LightningElement } from 'lwc';
import storeAccountToCache from '@salesforce/apex/PartitionCacheController.storeAccountToCache'
import getAccountBySOQL from '@salesforce/apex/PartitionCacheController.getAccountBySOQL'
import getAccountFromCache from '@salesforce/apex/PartitionCacheController.getAccountByCachePartition'
export default class PlatformCacheLwc extends LightningElement {


    async connectedCallback(){
        storeAccountToCache().then(() =>{
            console.log(" :::::::: Account Cached ::::::::");
        })
    }

    async retrieveDataSoql(){
    let startTime = Date.now();
        getAccountBySOQL().then((data)=>{
            console.log(" Account by SOQL : " + JSON.stringify(data))
            let operationTime = Date.now() - startTime;
        console.log("OPERATION TIME SOQL = " + operationTime);
        })
    }

    async retrieveDataCache(){
        let startTime = Date.now();
        getAccountFromCache().then((data)=>{
            console.log(" Account by Cache : " + JSON.stringify(data))
            let operationTime = Date.now() - startTime;
            console.log("OPERATION TIME CACHE = " + operationTime);
        })
    }


}