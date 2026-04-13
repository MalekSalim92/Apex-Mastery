import { LightningElement,wire } from 'lwc';
import getGeneralInfo from '@salesforce/apex/CurrencyService.getGeneralInfo';
export default class Currencies extends LightningElement {

    infoArray = [];

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
        this.getInfo()
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

}