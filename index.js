import {AppRegistry} from 'react-native'
import App from './App'
import ScanID from './src/screens/ScanID'
import MRZ from './src/screens/MrzScreen'
import SelfieID from './src/screens/SelfieID'
import {name as appName} from './app.json'

AppRegistry.registerComponent('MAIN', () => App)
AppRegistry.registerComponent('SCANID', () => ScanID)
AppRegistry.registerComponent('MRZ', () => MRZ)
AppRegistry.registerComponent('SELFIE', () => SelfieID)


