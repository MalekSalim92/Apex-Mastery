import {oppService_CTO} from "./oppService_CTO"
import {oppService_Manager} from "./oppService_Manager"
import {oppServiceFactory} from "./oppServiceFactory"

export class oppService{
    calculateOpp(userType){
        let classType;
        if(userType === 'CTO'){
            
            classType = new oppService_CTO();
        }
        else if(userType ==='Manager'){
            classType = new oppService_Manager();
        }

        const oppFactory = new oppServiceFactory(classType);
        oppFactory.calculateOpp();
    }
}