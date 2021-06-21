import React, { Component } from 'react';
import {
    SafeAreaView,
    Text,
    TouchableOpacity,
    View,
    NativeModules,
    NativeEventEmitter,
    Image
} from 'react-native';

const Navigation = NativeModules.Navigation;


class SelfieID extends Component {
    constructor(props) {
        super(props)
        this.state = {
            step: 0
        }
    }

    nativeScreenMRZ = () => {
        Navigation.navigateTo('MrzReader')
    }
    nativeScreenID = () => {
        Navigation.navigateTo('IDScan')
    }
    nativeScreenSelfie = () => {
        Navigation.navigateTo('Selfie')
    }
    render() {
        const selfieID = this.props.selfieID

        return (
            <SafeAreaView style={{ flex: 1, justifyContent: 'center', width: 400, height: 600, alignItems: 'center' }}>
                <View style={{ justifyContent: 'center', width: 300}}>
                    <Image source={{ uri: `data:image/gif;base64,${selfieID}` }} style={{ width: 300, height: 200 }} />
                </View>
                <View style={{ justifyContent: 'center', alignItems: 'center', borderColor: 'green', width: 300, borderWidth: 2 }}>
                    <TouchableOpacity style={{ margin: 10, width: 270 }} onPress={this.nativeScreenMRZ}>
                        <Text style={{ padding: 20, color: 'green', borderColor: 'red', borderWidth: 2, textAlign: 'center', fontSize: 20 }}>MRZScan</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={{ margin: 10, width: 270 }} onPress={this.nativeScreenID}>
                        <Text style={{ padding: 20, color: 'green', borderColor: 'red', borderWidth: 2, textAlign: 'center', fontSize: 20 }}>ID scan</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={{ margin: 10, width: 270 }} onPress={this.nativeScreenSelfie}>
                        <Text style={{ padding: 20, color: 'green', borderColor: 'red', borderWidth: 2, textAlign: 'center', fontSize: 20 }}>Selfie</Text>
                    </TouchableOpacity>
                </View>
            </SafeAreaView>
        )
    }
}
export default SelfieID