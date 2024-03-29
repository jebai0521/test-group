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
  Button,
  Alert,
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

import CookieManager from 'react-native-cookies';
import WebView from 'react-native-webview';

const Axios = require('axios');
// var rp = require('request-promise');
const shop = 'perkd-dev';
const store = `${shop}.myshopify.com`;
const email = '8357581722@qq.com';
const first_name = 'WEN';
const last_name = 'YAN';

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      // source: {uri: 'https://www.baidu.com/'},
      source: null,
    };
  }

  sso = async () => {
    // let password = '';
    const customer = {
      email: email,
      password: null,
    };

    var requests = [
      {
        method: 'get',
        // url: `https://76d9514a.ngrok.io/perkd/verify?shop=${store}&email=${email}&first_name=${first_name}&last_name=${last_name}`,
        url: `https://mcdev.perkd.me/perkd/verify?shop=${store}&email=${email}&first_name=${first_name}&last_name=${last_name}`,
        headers: {'Content-Type': 'application/json'},
        handler: function(result) {
          console.log(result);
          customer.password = result.data.password;
          requests[requests.length - 1].data = JSON.stringify({customer});
        },
      },
      {
        method: 'get',
        url: `https://${shop}.myshopify.com/`,
      },
      {
        method: 'post',
        url: `https://${shop}.myshopify.com/password`,
        data: JSON.stringify({
          password: 'ifriap',
        }),
        headers: {'Content-Type': 'application/json'},
      },
      {
        method: 'post',
        url: `https://${shop}.myshopify.com/account/login`,
        headers: {'Content-Type': 'application/json'},
      },
    ];

    try {
      for (let i = 0; i < requests.length; i++) {
        console.log(requests[i]);
        const result = await Axios(requests[i]);
        console.log(result);
        if (requests[i].handler) {
          requests[i].handler(result);
        }
      }
    } catch (e) {
      console.log(e);
      return;
    }
    console.log('request success', customer);

    setTimeout(() => {
      this.setState({
        source: {uri: `https://${shop}.myshopify.com/`},
      });
    }, 1000);
  };

  cleanCookie = () => {
    CookieManager.clearAll();
  };

  readCookie = async () => {
    const cookies = await CookieManager.get(
      `https://${shop}.myshopify.com/`,
      false,
    );

    console.log('cookies ==> ', cookies);
  };

  render() {
    return (
      <View>
        <StatusBar barStyle="dark-content" />
        <SafeAreaView>
          <ScrollView
            contentInsetAdjustmentBehavior="automatic"
            style={styles.scrollView}>
            <View style={styles.body}>
              <Button onPress={this.cleanCookie} title="cleanCookie" />
              <Button onPress={this.readCookie} title="readCookie" />
              <Button onPress={this.sso} title="SSO" />
              <WebView
                useWebKit
                sharedCookiesEnabled
                style={styles.webview}
                source={this.state.source}
              />
            </View>
          </ScrollView>
        </SafeAreaView>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  webview: {
    height: 800,
    // flex: 1,
    backgroundColor: 'red',
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
    flexDirection: 'column',
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
