#!/bin/bash
# usage: installer/build_installer.sh <artefacts dir> <version>
set -euo pipefail
ART="$1"; VER="$2"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORK="$ROOT/build/installer"
rm -rf "$WORK"; mkdir -p "$WORK/root/Library/Audio/Plug-Ins/VST3" "$WORK/root/Library/Audio/Plug-Ins/Components" "$WORK/dmg"

cp -R "$ART/VST3/MKGEE RIG.vst3" "$WORK/root/Library/Audio/Plug-Ins/VST3/"
cp -R "$ART/AU/MKGEE RIG.component" "$WORK/root/Library/Audio/Plug-Ins/Components/"

# stop the installer "relocating" bundles to wherever an old copy lives
pkgbuild --analyze --root "$WORK/root" "$WORK/components.plist"
/usr/libexec/PlistBuddy -c "Print" "$WORK/components.plist" >/dev/null
n=$(/usr/libexec/PlistBuddy -c "Print" "$WORK/components.plist" | grep -c "BundleIsRelocatable" || true)
for ((i=0; i<n; i++)); do
  /usr/libexec/PlistBuddy -c "Set :$i:BundleIsRelocatable false" "$WORK/components.plist"
done

pkgbuild --root "$WORK/root" \
         --component-plist "$WORK/components.plist" \
         --identifier com.kalabash.mkgeerig \
         --version "$VER" \
         --install-location / \
         --scripts "$ROOT/installer/scripts" \
         "$WORK/MKGEE-RIG-core.pkg"

cat > "$WORK/distribution.xml" <<XML
<?xml version="1.0" encoding="utf-8"?>
<installer-gui-script minSpecVersion="2">
  <title>MKGEE RIG $VER</title>
  <organization>com.kalabash</organization>
  <options customize="never" require-scripts="false" hostArchitectures="arm64,x86_64"/>
  <welcome file="welcome.txt" mime-type="text/plain"/>
  <choices-outline><line choice="default"/></choices-outline>
  <choice id="default" title="MKGEE RIG (VST3 + AU)"><pkg-ref id="com.kalabash.mkgeerig"/></choice>
  <pkg-ref id="com.kalabash.mkgeerig" version="$VER" onConclusion="none">MKGEE-RIG-core.pkg</pkg-ref>
</installer-gui-script>
XML
mkdir -p "$WORK/res"
cat > "$WORK/res/welcome.txt" <<TXT
MKGEE RIG $VER by Kalabash

Installs:
  /Library/Audio/Plug-Ins/VST3/MKGEE RIG.vst3
  /Library/Audio/Plug-Ins/Components/MKGEE RIG.component  (Audio Unit)

After installing, rescan plug-ins in your DAW (Ableton: Settings > Plug-Ins > Rescan).
TXT
productbuild --distribution "$WORK/distribution.xml" --resources "$WORK/res" \
             --package-path "$WORK" "$WORK/dmg/Install MKGEE RIG.pkg"

cat > "$WORK/dmg/READ ME.txt" <<TXT
MKGEE RIG $VER  (VST3 + AU, Apple Silicon + Intel)

1. Double-click "Install MKGEE RIG.pkg".
   If macOS says it can't verify the developer: right-click the .pkg > Open > Open
   (or System Settings > Privacy & Security > "Open Anyway").
2. Rescan plug-ins in your DAW. It shows up under Kalabash > MKGEE RIG.

Chain: guitar in > drop > vibe > para eq > fuzz verb > echo > 4-track preamp > cassette > out
TXT

mkdir -p "$ROOT/dist"
hdiutil create -volname "MKGEE RIG $VER" -srcfolder "$WORK/dmg" -ov -format UDZO "$ROOT/dist/MKGEE-RIG-$VER-mac.dmg"
echo "built $ROOT/dist/MKGEE-RIG-$VER-mac.dmg"
