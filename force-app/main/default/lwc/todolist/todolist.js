import { LightningElement } from 'lwc';
import getTodos from "@salesforce/apex/callfromjson.getTodos";

export default class Todolist extends LightningElement {

    todos = [];
connectedCallback(){
    console.log('Check');
    getTodos().then(result =>{
        this.todos = result;
        console.log(result);
    })

}

}