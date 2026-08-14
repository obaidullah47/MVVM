# Implementation Plan - Fixing Button Logic and UI Issues

The user reported that buttons are not working. Based on code analysis, the buttons are actually triggering API calls, but the app fails to navigate to the Home screen on success, and it doesn't show any error messages in the UI when things fail. Additionally, there are some UI property errors and UX issues with the custom button component.

## User Review Required

> [!IMPORTANT]
> This plan will add navigation to the `Home` screen after successful login and signup. It will also modify how error messages are displayed (from console-only to UI-based flushbars).

## Proposed Changes

### Logic and State Management

#### [MODIFY] [auth_view_model.dart](file:///C:/Users/Obaidullah-Ch/StudioProjects/mvvm/lib/view_model/auth_view_model.dart)
- Update `login` and `signup` methods to navigate to `RoutesNames.Home` upon success.
- Add error handling in the `onError` block to show error messages to the user using `GeneralUtils.flushbarerrormessage`.
- Ensure `loading` states are correctly managed.

### UI Components

#### [MODIFY] [round_buttons.dart](file:///C:/Users/Obaidullah-Ch/StudioProjects/mvvm/lib/res/components/round_buttons.dart)
- Wrap the `InkWell` in a `Material` widget to ensure proper tap response and splash effects.
- Disable `onTap` when `loading` is true to prevent multiple simultaneous API hits.
- Improve visual feedback by ensuring the `InkWell` splash is not obscured by the `Container` decoration.

### Screens

#### [MODIFY] [login_screen.dart](file:///C:/Users/Obaidullah-Ch/StudioProjects/mvvm/lib/view/login_screen.dart)
- Fix `InputDecoration` properties: change `hint: Text(...)` to `hintText: "..."`.
- Remove the redundant "Your api hit" flushbar from the login button's `onPress`.
- Wrap the body in a `SingleChildScrollView` to prevent keyboard overflow issues.

#### [MODIFY] [signup_screen.dart](file:///C:/Users/Obaidullah-Ch/StudioProjects/mvvm/lib/view/signup_screen.dart)
- Wrap the body in a `SingleChildScrollView` to prevent keyboard overflow issues.

## Verification Plan

### Manual Verification
1.  **Login Flow**:
    *   Enter valid credentials and verify navigation to the Home screen.
    *   Enter invalid credentials and verify that a red error flushbar appears at the top.
    *   Click the button while it's loading and verify it doesn't trigger multiple requests.
2.  **Signup Flow**:
    *   Fill in all fields and verify navigation to the Home screen after successful registration.
    *   Test validation (e.g., empty fields) and verify error messages.
3.  **UI/UX**:
    *   Verify that the "Login" and "Sign Up" buttons show a ripple effect when tapped.
    *   Verify that no "pixel overflow" errors occur when the keyboard is opened.
