import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import { VisaView } from 'react-native-visa-sensory';

export default function App() {
  const ref = React.useRef<any>();

  const startAnimation = async () => {
    try {
      const result = await ref.current.startAnimation();
      console.log({ result });
    } catch (error) {
      console.log({ error });
    }
  };

  return (
    <View style={styles.container}>
      <VisaView color="#32a852" style={styles.box} ref={ref} />
      <Button title={'Start'} onPress={startAnimation} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
