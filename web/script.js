import WebBridge from './node_modules/@expressms/smartapp-bridge/build/main/lib/platforms/web.js';

//var Bridge = require('node_modules/@expressms/smartapp-bridge');
//
//class JsClass {
//    constructor() {
//        this.data = 'js data';
//    }
//
//    get getData() {
//        return this.data;
//    }
//
//    printData() {
//        console.log(this.data);
//    }
//}

window.bridge = new WebBridge();
window.jsClassInstance = new JsClass();