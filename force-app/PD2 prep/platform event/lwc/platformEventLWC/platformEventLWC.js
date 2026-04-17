import { LightningElement } from 'lwc';
import {subscribe,unsubscribe} from 'lightning/empApi';

export default class PlatformEventLWC extends LightningElement {

    channelName = '/event/AccountPe__e';
    subscription = {};

    connectedCallback(){
        this.handleSubscribe();
    }
    handleSubscribe(){
        let messageCallback = (function(response){
            console.log('New message received : ' + JSON.stringify(response));
            
        });
        subscribe(this.channelName, -1,messageCallback).then(response => {
            console.log('Succesfully subscribed to : ' + JSON.stringify(response))
            console.log('Succesfully subscribed to : ' + JSON.stringify(response.channel))
            this.subscription = response
        })
    }

    disconnectedCallback(){
        unsubscribe(this.subscription,response => {
            console.log('Unsubscribed');
        })
    }
}