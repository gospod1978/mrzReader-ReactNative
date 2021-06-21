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
const Message = NativeModules.Message;

class MrzScreen extends Component {
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
        const mrz = this.props.mrz

        return (
            <SafeAreaView style={{ flex: 1, justifyContent: 'center', width: 400, height: 600, alignItems: 'center'}}>
                <Image source={{ uri: `data:image/gif;base64,${mrz[3]}` }} style={{ width: 300, height: 200 }} />
                <View style={{ justifyContent: 'center', borderColor: 'green', width: 300, borderWidth: 2 }}>
                    <Text>Nationality: {mrz[0]}</Text>
                    <Text>Country code: {mrz[1]}</Text>
                    <Text>DocumentType: {mrz[2]}</Text>
                    <Text>Document Number: {mrz[4]}</Text>
                    <Text>ID number: {mrz[6]}</Text>
                    <Text>First name: {mrz[5]}</Text>
                    <Text>SurName: {mrz[7]}</Text>
                    <Text>Birthdate: {mrz[8]}</Text>
                    <Text>ExpiryDate: {mrz[9]}</Text>
                    <Text>Date issue: {mrz[10]}</Text>
                    <Text>Sex: {mrz[11]}</Text>
                </View>
                <View style={{ justifyContent: 'center', alignItems: 'center', borderColor: 'green', width: 300}}>
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
export default MrzScreen