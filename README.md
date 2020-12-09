
# react-native-shande-pay

## Getting started

`$ npm install react-native-shande-pay --save`

### Mostly automatic installation

`$ react-native link react-native-shande-pay`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-shande-pay` and add `RNShandePay.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNShandePay.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNShandePayPackage;` to the imports at the top of the file
  - Add `new RNShandePayPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-shande-pay'
  	project(':react-native-shande-pay').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-shande-pay/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-shande-pay')
  	```


## Usage
```javascript
import RNShandePay from 'react-native-shande-pay';

// TODO: What to do with the module?
RNShandePay;
```
  