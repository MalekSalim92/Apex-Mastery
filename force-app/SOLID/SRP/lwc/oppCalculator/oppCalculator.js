import { LightningElement } from 'lwc';
import {oppService} from './oppService'
export default class OppCalculator extends LightningElement {
    userType = 'Manager'
    calculateOpp(){
        const  oppSer = new oppService()
        oppSer.calculateOpp(this.userType);
    }


}