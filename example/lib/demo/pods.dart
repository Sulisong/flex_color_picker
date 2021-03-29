import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

// Simple Riverpod State provider's, that I called "Pod:s" as it is nice
// and short, and might become the official new name for Riverpod providers.
//
// This demo app is perhaps a bit a-typical in the sense that we want every
// toggle to update something as it happens while minimizing re-builds as
// much as possible. All the properties are just simple values, maps or simple
// objects like 'Color' so a simple StateProvider for each property works
// rather nicely and is simple to use, there is just a
// lot of them. Still using each in one individual widgets to toggle each
// state provider's state is pretty easy and simple to do and maintain.
// It also leaves the wrapper very clean and they read well.
//
// For more complex use cases and classes, use StateNotifierProvider instead.

// themeModePod is a [StateProvider] to provide the state of
// the [ThemeMode], used to toggle the application wide theme mode.
final StateProvider<ThemeMode> themeModePod =
    StateProvider<ThemeMode>((ProviderReference ref) {
  return ThemeMode.system;
});

// The other plethora f other state providers are all related to manipulating
// input and view output from the FlexColorPicker.

// StateProvider for the color we give to the color picker on the card.
final StateProvider<Color> cardPickerColorPod =
    StateProvider<Color>((ProviderReference ref) {
  return Colors.blue;
});

// StateProvider for the color we give to the color picker in the dialog.
final StateProvider<Color> dialogPickerColorPod =
    StateProvider<Color>((ProviderReference ref) {
  return Colors.red;
});

// StateProviders for the color we get back via onColorChangeStart callback.
final StateProvider<Color> onColorChangeStartPod =
    StateProvider<Color>((ProviderReference ref) {
  return Colors.white;
});

// StateProviders for the color we get back via onColorChanged callback
final StateProvider<Color> onColorChangedPod =
    StateProvider<Color>((ProviderReference ref) {
  return Colors.white;
});

// StateProviders for the color we get back via onColorChangeEnd callback
final StateProvider<Color> onColorChangeEndPod =
    StateProvider<Color>((ProviderReference ref) {
  return Colors.white;
});

// StateProvider for the recently used colors for color picker on the card.
// We could start with some specific list as well. We get a new list of
// recently used colors back from the color picker whenever a new color is
// selected and its internal list is updated, the callback for this is
// `onRecentColorsChanged`. We just update the entire list state with the
// new list we get from the picker. Using the callback is optional, but you
// could use it to store recently used colors during the session or even
// between sessions.
final StateProvider<List<Color>> cardRecentColorsPod =
    StateProvider<List<Color>>((ProviderReference ref) {
  return <Color>[];
});

// StateProvider for the recently used colors for color picker in the dialog.
final StateProvider<List<Color>> dialogRecentColorsPod =
    StateProvider<List<Color>>((ProviderReference ref) {
  return <Color>[];
});

// ****************************************************************************
// The rest of the provider all deal with the API input settings for the
// FlexColorPicker demo. They are mostly in the order they appear on the screen.
// ****************************************************************************

// ****************************************************************************
//  Show and Hide Riverpod "Pod" providers.
// ****************************************************************************

// State of enabled color pickers.
final StateProvider<Map<ColorPickerType, bool>> pickersEnabledPod =
    StateProvider<Map<ColorPickerType, bool>>((ProviderReference ref) {
  return <ColorPickerType, bool>{
    ColorPickerType.both: false,
    ColorPickerType.primary: true,
    ColorPickerType.accent: true,
    ColorPickerType.bw: false,
    ColorPickerType.custom: true,
    ColorPickerType.wheel: true,
  };
});

// State of shades color selection.
final StateProvider<bool> enableShadesSelectionPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of including index 850 for grey color.
final StateProvider<bool> includeIndex850Pod =
    StateProvider<bool>((ProviderReference ref) {
  return false;
});

// State of enabling opacity for color.
final StateProvider<bool> enableOpacityPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of showing Material color name.
final StateProvider<bool> showMaterialNamePod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of showing general color name.
final StateProvider<bool> showColorNamePod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of showing color code edit-display field: on/off.
final StateProvider<bool> showColorCodePod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of showing color code using color as background.
final StateProvider<bool> colorCodeHasColorPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of color code field being read only.
final StateProvider<bool> colorCodeReadOnlyPod =
    StateProvider<bool>((ProviderReference ref) {
  return false;
});

// State of showing color code int value.
final StateProvider<bool> showColorValuePod =
    StateProvider<bool>((ProviderReference ref) {
  return false;
});

// State of showing recently used colors.
final StateProvider<bool> showRecentColorsPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of showing title.
final StateProvider<bool> showTitlePod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of showing heading.
final StateProvider<bool> showHeadingPod =
    StateProvider<bool>((ProviderReference ref) {
  return false;
});

// State of showing sub heading, for both swatch color pickers and wheel.
final StateProvider<bool> showSubheadingPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of showing subheading for opacity control.
final StateProvider<bool> showOpacitySubheadingPod =
    StateProvider<bool>((ProviderReference ref) {
  return false;
});

// State of showing sub heading for recently used colors.
final StateProvider<bool> showRecentSubheadingPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// ****************************************************************************
//  Picker Design Riverpod "Pod" providers.
// ****************************************************************************

// State of picker item size.
final StateProvider<double> sizePod =
    StateProvider<double>((ProviderReference ref) {
  return 40;
});

// State of picker item border radius.
final StateProvider<double> borderRadiusPod =
    StateProvider<double>((ProviderReference ref) {
  return 4;
});

// State of picker item elevation.
final StateProvider<double> elevationPod =
    StateProvider<double>((ProviderReference ref) {
  return 0;
});

// State of picker item spacing.
final StateProvider<double> spacingPod =
    StateProvider<double>((ProviderReference ref) {
  return 4;
});

// State of picker item run spacing.
final StateProvider<double> runSpacingPod =
    StateProvider<double>((ProviderReference ref) {
  return 4;
});

// State of using border on picker items.
final StateProvider<bool> hasBorderPod =
    StateProvider<bool>((ProviderReference ref) {
  return false;
});

// State of wheel diameter.
final StateProvider<double> wheelDiameterPod =
    StateProvider<double>((ProviderReference ref) {
  return 190;
});

// State of wheel width.
final StateProvider<double> wheelWidthPod =
    StateProvider<double>((ProviderReference ref) {
  return 16;
});

// State of using border on wheel picker .
final StateProvider<bool> wheelHasBorderPod =
    StateProvider<bool>((ProviderReference ref) {
  return false;
});

// State of used height on color opacity slider.
final StateProvider<double> opacityTrackHeightPod =
    StateProvider<double>((ProviderReference ref) {
  return 22;
});

// State of used width on color opacity slider.
final StateProvider<double> opacityTrackWidthPod =
    StateProvider<double>((ProviderReference ref) {
  return 700;
});

// State of used thumb radius on color opacity slider.
final StateProvider<double> opacityThumbRadiusPod =
    StateProvider<double>((ProviderReference ref) {
  return 16;
});

// State of showing tooltips.
final StateProvider<bool> enableTooltipsPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// ****************************************************************************
//  Picker Layout Riverpod "Pod" providers.
// ****************************************************************************

// State of used alignment in the color picker
final StateProvider<CrossAxisAlignment> alignmentPod =
    StateProvider<CrossAxisAlignment>((ProviderReference ref) {
  return CrossAxisAlignment.center;
});

// State of used spacing between each item in the column in the picker.
final StateProvider<double> columnSpacingPod =
    StateProvider<double>((ProviderReference ref) {
  return 8;
});

// State of used padding surrounding the content around the picker.
final StateProvider<double> paddingPod =
    StateProvider<double>((ProviderReference ref) {
  return 10;
});

// State of using a close button on dialog toolbar.
final StateProvider<bool> closeButtonPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of using a OK button on dialog toolbar.
final StateProvider<bool> okButtonPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of using having close button as last action on dialog toolbar.
final StateProvider<bool> closeIsLastPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of having Cancel OK bottom action in the dialog.
final StateProvider<bool> dialogActionButtonsPod =
    StateProvider<bool>((ProviderReference ref) {
  return false;
});

// State of having icons on Cancel OK bottom actions buttons in the dialog.
final StateProvider<bool> dialogActionIconsPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// ****************************************************************************
//  Copy Paste Actions Riverpod "Pod" providers.
// ****************************************************************************

// State of used color code COPY format.
final StateProvider<ColorPickerCopyFormat> copyFormatPod =
    StateProvider<ColorPickerCopyFormat>((ProviderReference ref) {
  return ColorPickerCopyFormat.dartCode;
});

// State of using CTRL-C keyboard shortcut.
final StateProvider<bool> ctrlCPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of using CTRL-V keyboard shortcut.
final StateProvider<bool> ctrlVPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of using Copy button on toolbar.
final StateProvider<bool> copyButtonPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of using Paste button on toolbar.
final StateProvider<bool> pasteButtonPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of using Paste button on edit code field.
final StateProvider<bool> editFieldCopyButtonPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of using long press copy-paste context menu.
final StateProvider<bool> longPressMenuPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of using secondary (right) click copy-paste context menu.
final StateProvider<bool> secondaryMenuPod =
    StateProvider<bool>((ProviderReference ref) {
  return false;
});

// State of using secondary (right) click on desktop and long press
// on devices to show the copy-paste context menu
final StateProvider<bool> secondaryOnDesktopLongOnDevicePod =
    StateProvider<bool>((ProviderReference ref) {
  return false;
});

// State of if Web 3-char code RGB, should be interpreted as RRGGBB.
final StateProvider<bool> parseShortHexCodePod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of if text edit field should use code parser on keyboard paste.
final StateProvider<bool> editUsesParsedPastePod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of if color code parse error should result in a snackbar error message.
final StateProvider<bool> snackbarParseErrorPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});

// State of if color code parse error should give audible and vibration alert.
final StateProvider<bool> feedbackParseErrorPod =
    StateProvider<bool>((ProviderReference ref) {
  return true;
});
