Android signing and CI setup

This app supports two ways to provide signing credentials for release builds:

1. Development (local): create `android/key.properties` from `android/key.properties.example` and fill values.
   - Keep `android/key.properties` out of version control (it's already in `.gitignore`).

2. CI / automation (recommended): set environment variables in your CI environment:
   - KEYSTORE_FILE: path to your keystore file (absolute or relative to repo root)
   - KEYSTORE_PASSWORD: keystore store password
   - KEY_ALIAS: alias for the key (e.g. upload)
   - KEY_PASSWORD: key password

Example GitHub Actions snippet (secrets configured in repository settings):

```yaml
name: Android Release
on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up JDK
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'
      - name: Decode keystore
        run: |
          echo "$KEYSTORE_BASE64" | base64 --decode > keystore.jks
        env:
          KEYSTORE_BASE64: ${{ secrets.KEYSTORE_BASE64 }}
      - name: Build release APK
        run: flutter build apk --release
        env:
          KEYSTORE_FILE: ${{ runner.workspace }}/keystore.jks
          KEYSTORE_PASSWORD: ${{ secrets.KEYSTORE_PASSWORD }}
          KEY_ALIAS: ${{ secrets.KEY_ALIAS }}
          KEY_PASSWORD: ${{ secrets.KEY_PASSWORD }}
```

Notes:
- Store sensitive values (passwords, base64 keystore) in your CI secret store.
- For local development, copy `android/key.properties.example` -> `android/key.properties` and fill values. Do not commit the real `key.properties`.
