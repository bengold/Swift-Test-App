# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
This is an iOS application built with SwiftUI. The project demonstrates various SwiftUI components and controls in a single-view application.

## Build and Development Commands

### Building the Project
```bash
# Build for simulator
xcodebuild -scheme Test -configuration Debug -sdk iphonesimulator build

# Build for device
xcodebuild -scheme Test -configuration Release build

# Clean build folder
xcodebuild -scheme Test clean
```

### Running Tests
```bash
# Run unit tests
xcodebuild test -scheme Test -destination 'platform=iOS Simulator,name=iPhone 16'

# Run UI tests
xcodebuild test -scheme Test -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:TestUITests

# Run a specific test
xcodebuild test -scheme Test -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:TestTests/TestTests/test
```

### Opening in Xcode
```bash
open Test.xcodeproj
```

## Architecture and Structure

### Core Components
- **TestApp.swift**: The app's entry point using SwiftUI's @main attribute. Defines the WindowGroup that launches ContentView.
- **ContentView.swift**: Main UI view showcasing various SwiftUI controls including toggles, sliders, pickers, and text fields. Uses @State for local state management.

### Testing Strategy
The project uses two testing frameworks:
- **Swift Testing** (TestTests/): Modern testing framework using @Test macro for unit tests
- **XCTest** (TestUITests/): Traditional UI testing framework for launch tests and screenshots

### Key Technical Details
- **Deployment Target**: iOS 26.0 (beta/future version)
- **Swift Version**: Latest Swift with modern language features
- **UI Framework**: SwiftUI with previews enabled
- **State Management**: Local @State properties in views