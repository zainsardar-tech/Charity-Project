# Installation Guide

Because this Charity Admin System is designed to operate 100% locally and offline, the installation revolves entirely around compiling a native Flutter Desktop application.

Follow these steps to get the system running on any fresh machine.

## Prerequisites
1. **Flutter SDK**: Ensure you have Flutter installed natively on your OS.
   - On Linux: `sudo snap install flutter --classic`
   - On Windows: Download the SDK `zip` from flutter.dev and append to your PATH.
2. **Build Tools**:
   - `Visual Studio 2022+` with C++ Desktop Development (For Windows Targets).
   - `build-essential` and `clang` (For Linux Targets).

## Building from Source

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-ngo-organization/charity-admin.git
   cd charity-admin
   ```

2. **Initialize Flutter Engine**
   Ensure your local Flutter config accepts desktop builds:
   ```bash
   flutter config --enable-linux-desktop
   # OR
   flutter config --enable-windows-desktop
   ```

3. **Install Dependencies**
   The project massively relies on `riverpod` and `drift` (SQLite mapping):
   ```bash
   flutter pub get
   ```

4. **Generate the Local Database (Drift Generators)**
   Drift requires generating the `database.g.dart` mapping files offline:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the Application**
   ```bash
   flutter run -d linux   # To spin up natively on Linux
   # OR
   flutter run -d windows # To spin up natively on Windows
   ```

## Production Build

To compile a final, standalone professional binary (`.exe` or `.AppImage`):
```bash
flutter build linux --release
# OR
flutter build windows --release
```
The raw standalone output executable will be cleanly placed inside `build/linux/` or `build/windows/` which you can distribute directly to Manager machines!
