
import { NativeModules } from 'react-native';

const { RNShandePay } = NativeModules;

export default class shandePay {
    static getText(){
        RNShandePay.wechaPay()
    }
};
