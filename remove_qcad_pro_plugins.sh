#!/bin/bash

echo "🔧 Removing QCAD Pro and CAM plugin files..."

PLUGIN_DIR="/Applications/QCAD.app/Contents/PlugIns"

# Full list of Pro and CAM plugins to delete
PLUGINS_TO_DELETE=(
  "libqcaddwg.dylib"
  "libqcadopengl3d.dylib"         # CAM only
  "libqcadpdf.dylib"
  "libqcadpolygon.dylib"
  "libqcadproj.dylib"
  "libqcadproscripts.dylib"
  "libqcadproxies.dylib"
  "libqcadtriangulation.dylib"
  "libqcadspatialindexpro.dylib"
  "libqcadshp.dylib"
  "libqcadtrace.dylib"
  "libqcadcamscripts.dylib"       # CAM only
)

for plugin in "${PLUGINS_TO_DELETE[@]}"; do
  PLUGIN_PATH="$PLUGIN_DIR/$plugin"
  if [ -f "$PLUGIN_PATH" ]; then
    echo "🗑️ Deleting $plugin"
    rm "$PLUGIN_PATH"
  else
    echo "✅ $plugin not found (already removed or not installed)"
  fi
done

echo ""
echo "✅ Done! QCAD should now run as the Community Edition."
echo "🔁 Please restart QCAD if it is currently running."
