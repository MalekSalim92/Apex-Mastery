import { LightningElement,wire } from 'lwc';
import getGeneralInfo from '@salesforce/apex/CurrencyService.getGeneralInfo';
import getOpportunities from '@salesforce/apex/CurrencyService.getOpportunities';
import LOCALE from '@salesforce/i18n/locale';
import CURRENCY from '@salesforce/i18n/currency';
export default class Currencies extends LightningElement {
    CURRENCY = CURRENCY;
    LOCALE = LOCALE;
    columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' },
    { label: 'Amount', fieldName: 'Amount' },
    { label: 'format', fieldName: 'amm' },
    { label: 'amm2', fieldName: 'amm2' },
    { label: 'noFormat', fieldName: 'ammNoFormat' }
    ];
    infoArray = [];
    opps = [];
    // @wire(getGeneralInfo)
    // wiredInfo(data,error){
    //     if(data){
    //         this.infoArray = Object.keys(data).map(key => {return {name: key , value : data[key]};
    //         });
    //         console.log(JSON.stringify(this.infoArray));
    //     }
    //     else{
    //         console.error('Error --->' + error);
    //     }
    // }

    connectedCallback(){
        this.getInfo();
        this.getOpps();
    }

            async getInfo(){
                try{
                    const result = await getGeneralInfo();
                    this.infoArray = Object.entries(result).map(([key,value]) => {
                        return {
                            id: key,
                            label: key,
                            value: value
                        };
                    });
                }
                catch {
                    console.error(error);
                }
        }

        async getOpps(){
            try{
                this.opps = await getOpportunities();
                console.log('Opps : ' + JSON.stringify(this.opps))
            }
            catch{
                console.error(error);
            }
        }
}