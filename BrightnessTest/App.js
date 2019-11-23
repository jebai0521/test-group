/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  Button,
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

import SystemSetting from 'react-native-system-setting';

class App extends Component {
  increaseBrightness = async () => {
    await SystemSetting.setAppBrightness(0.9);
  };

  reduceBrightness = async () => {
    await SystemSetting.setAppBrightness(0.1);
  };

  increaseSystemBrightness = async () => {
    await SystemSetting.setBrightness(0.9);
  };

  reduceSystemBrightness = async () => {
    await SystemSetting.setBrightness(0.1);
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
            <View style={styles.body}>
              <View style={styles.sectionContainer}>
                <Text style={styles.sectionTitle}>Brightness</Text>
                {/* <Text style={styles.sectionDescription}>
                  Edit <Text style={styles.highlight}>App.js</Text> to change
                  this screen and then come back to see your edits.
                </Text> */}
                <Button
                  style={styles.sectionDescription}
                  onPress={this.increaseBrightness}
                  title="Incrase"
                />
                <Button
                  style={styles.sectionDescription}
                  onPress={this.reduceBrightness}
                  title="Reduce"
                />
                <Button
                  style={styles.sectionDescription}
                  onPress={this.increaseSystemBrightness}
                  title="Incrase"
                />
                <Button
                  style={styles.sectionDescription}
                  onPress={this.reduceSystemBrightness}
                  title="Reduce"
                />
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
