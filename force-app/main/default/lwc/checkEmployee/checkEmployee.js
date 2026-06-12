import { LightningElement } from 'lwc';
import findEmployee from '@salesforce/apex/findEmployee.checkEmployee'

export default class CheckEmployee extends LightningElement {

    employeeName="";
    exist=false;

    writeName=(e)=>{
        this.employeeName=e.target.value;
    }

    checkEmployeeExist=()=>{
        findEmployee({empname:this.employeeName}).then(result=>{
            if(result){
                this.exist = true
            }else{
                this.exist = false
            }
        })

    }
}