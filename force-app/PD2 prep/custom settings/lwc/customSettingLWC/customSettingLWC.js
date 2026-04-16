import { LightningElement } from 'lwc';
import getCountryName from '@salesforce/apex/CustomSettingService.getCountryName';
import getCountryNameDefaultValue from '@salesforce/apex/CustomSettingService.getCountryNameDefaultValue';
import getCustomMetadataCountry from '@salesforce/apex/CustomSettingService.getCustomMetadataCountry';
export default class CustomSettingLWC extends LightningElement {

    countryName = '';
    defaultOrgCountryName = '';
    medatadataCountry = '';
    connectedCallback(){
        console.log('start')
        this.getCountryName();
        this.getOrgDefaultCountryName();
        this.getMetadataCountry();
    }

    async getCountryName(){
        try{

            this.countryName = await getCountryName();
            console.log('countryName : ' + this.countryName);

        }
        catch(error){

            console.error('ERRRROR : ' + error);
        }
    }
    

    async getOrgDefaultCountryName(){
        try{
            this.defaultOrgCountryName = await getCountryNameDefaultValue();
        }   

        catch(error){

        }}

    async getMetadataCountry(){
        try{
            this.medatadataCountry = await getCustomMetadataCountry();
        }   

        catch(error){

        }
    }
}