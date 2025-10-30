export class oppServiceFactory{
    classType;
    constructor(classType){
        this.classType = classType
    }

    calculateOpp(){
        this.classType.calculateOpp()
    }
}