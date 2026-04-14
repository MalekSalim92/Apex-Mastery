import { LightningElement, api} from 'lwc';

export default class ConfigurationEditor extends LightningElement {

    _inputVariables = [];
    @api get inputVariables(){return this._inputVariables;};
    set inputVariables(variables){this._inputVariables = variables || []};

    get maxUsageLimit(){
        const param = this.inputVariables.find(({name})=> name ==='maxUsageLimit');
        return param && param.value;
    }

    get isPremium(){
        const param = this._inputVariables.find(({name}) => name === 'isPremium');
        return param && param.value;
    }

    @api validate(){
        const cmpMaxUsageLimit = this.template.querySelector('lightning-slider');
        const validity = [];

        if(this.isPremium && this.maxUsageLimit > 3){
            cmpMaxUsageLimit.setCustomValidity('Max usage limit for premium voucher is 3 only');
            validity.push({
                key : "premium voucher max usage",
                errorString : ' The slider range must be from 1 to 3 only',
            });
        }
        else{
            cmpMaxUsageLimit.setCustomValidity('');
        }
        cmpMaxUsageLimit.reportValidity();
        return validity;
    }

}