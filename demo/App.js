/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, NativeModules} from 'react-native';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

if (Platform.OS === 'ios') {
  NativeModules.Print.test1('fuck', (p1, p2) => {
    console.log(p1, p2)
  })
  NativeModules.SwiftPrint.test('you', (p1, p2) => {
    console.log(p1, p2)
  })

  console.log(NativeModules.Print.firstDayOfTheWeek, NativeModules.SwiftPrint.firstDayOfTheWeek)
} else {
  console.log(NativeModules.Toast)
  NativeModules.Toast.show('hello', NativeModules.Toast.LONG)
}

type Props = {};
export default class App extends Component<Props> {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Welcome to React Native!</Text>
        <Text style={styles.instructions}>To get started, edit App.js</Text>
        <Text style={styles.instructions}>{instructions}</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
