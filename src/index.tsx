import React, { PureComponent, createRef, type ReactNode } from 'react';
import type { NativeMethods, ViewProps } from 'react-native';
import {
  requireNativeComponent,
  UIManager,
  Platform,
  NativeModules,
  findNodeHandle,
} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-visa-sensory' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

interface NativeVisaViewProps extends ViewProps {}

const ComponentName = 'VisaSensory';

const NativeVisaSensoryView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<NativeVisaViewProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };

interface VisaProps extends ViewProps {
  isSoundEnabled?: boolean;
  isHapticFeedbackEnabled?: boolean;
  checkmarkMode?: 'checkmark' | 'checkmarkWithText' | 'none';
}

type RefType = React.Component<VisaProps> & Readonly<NativeMethods>;

const VisaViewModule = NativeModules.VisaSensory;
if (VisaViewModule == null) console.error('Visa View Module is null');
export class VisaView extends PureComponent<VisaProps> {
  private readonly ref: React.RefObject<RefType>;

  constructor(props: VisaProps) {
    super(props);
    this.ref = createRef<RefType>();
  }

  private get handle(): number | null {
    const nodeHandle = findNodeHandle(this.ref.current);
    if (nodeHandle == null || nodeHandle === -1) {
      throw new Error(
        "Could not get the Visa's native view tag! Does the Visa View exist in the native view-tree?"
      );
    }

    return nodeHandle;
  }

  public startAnimation = async () => {
    return await VisaViewModule.animate(this.handle);
  };

  render(): ReactNode {
    const { backdropColor, ...props } = this.props;
    return (
      <NativeVisaSensoryView
        {...props}
        backdropColor={backdropColor}
        soundEnabled={false}
        ref={this.ref}
      />
    );
  }
}
