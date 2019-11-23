/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

const GoogleAPIAvailability = require('react-native-google-api-availability-bridge');

import DeviceInfo from 'react-native-device-info';
import SQLite from '@emanon_/react-native-sqlite-storage';

// or ES6+ destructured imports

import {getUniqueId, getManufacturer} from 'react-native-device-info';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      googleservice: 'loading',
      brand: 'loading',
      apiLevel: 'loading',
      applicationName: 'loading',
      baseOS: 'loading',
      manu: 'loading',
      deviceId: 'loading',
      deviceName: 'loading',
      model: 'loading',
      androidId: 'loading',
    };
  }

  componentDidMount() {
    // GoogleAPIAvailability.checkGooglePlayServices((state, result) => {
    //   this.setState({
    //     googleservice: result,
    //     connectstate: state,
    //   });
    // });

    SQLite.openDatabase(
      {name: 'db_2.3.sql', location: 'Library/Private Documents'},
      function() {},
      function() {},
    );

    this.loadDeviceInfo();
  }

  loadDeviceInfo = async () => {
    const brand = DeviceInfo.getBrand();
    const apiLevel = await DeviceInfo.getApiLevel();
    const applicationName = DeviceInfo.getApplicationName();
    const baseOS = await DeviceInfo.getBaseOs();
    const manu = await DeviceInfo.getManufacturer();
    const deviceId = DeviceInfo.getDeviceId();
    const deviceName = await DeviceInfo.getDeviceName();
    const model = DeviceInfo.getModel();
    const androidId = await DeviceInfo.getAndroidId();

    this.setState({
      brand: brand,
      apiLevel: apiLevel,
      applicationName: applicationName,
      baseOS: baseOS,
      manu: manu,
      deviceId: deviceId,
      deviceName: deviceName,
      model: model,
      androidId: androidId,
    });
  };

  render() {
    return (
      <>
        <StatusBar barStyle="dark-content" />
        <SafeAreaView>
          <ScrollView
            contentInsetAdjustmentBehavior="automatic"
            style={styles.scrollView}>
            <Header />
            {global.HermesInternal == null ? null : (
              <View style={styles.engine}>
                <Text style={styles.footer}>Engine: Hermes</Text>
              </View>
            )}
            <View style={styles.body}>
              <View style={styles.sectionContainer}>
                <Text style={styles.sectionTitle}>Google Serivce Status</Text>
                <Text style={styles.sectionDescription}>
                  {this.state.googleservice}
                </Text>
                <Text style={styles.sectionDescription}>
                  {this.state.connectstate}
                </Text>
              </View>
              <View style={styles.sectionContainer}>
                <Text style={styles.sectionTitle}>Device Info</Text>
                <Text style={styles.sectionDescription}>
                  brand==>{this.state.brand}
                </Text>
                {/* <Text style={styles.sectionDescription}>
                  {this.state.apiLevel}
                </Text> */}
                <Text style={styles.sectionDescription}>
                  applicationName==>{this.state.applicationName}
                </Text>
                <Text style={styles.sectionDescription}>
                  baseOS==>{this.state.baseOS}
                </Text>
                <Text style={styles.sectionDescription}>
                  manu==>{this.state.manu}
                </Text>
                <Text style={styles.sectionDescription}>
                  deviceId==>{this.state.deviceId}
                </Text>
                <Text style={styles.sectionDescription}>
                  deviceName==>{this.state.deviceName}
                </Text>
                <Text style={styles.sectionDescription}>
                  model:{this.state.model}
                </Text>
                <Text style={styles.sectionDescription}>
                  androidId==>{this.state.androidId}
                </Text>
              </View>
            </View>
          </ScrollView>
        </SafeAreaView>
      </>
    );
  }
}
const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});

export default App;
