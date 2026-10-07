#!/bin/sh

ROBLOX_PATH="/Applications/Roblox.app"

if [ ! -d "$ROBLOX_PATH" ]; then
  ROBLOX_PATH="$HOME/Applications/Roblox.app"
  if [ ! -d "$ROBLOX_PATH" ]; then
    echo "Error: Roblox installation not found."
    exit 1
  fi
fi

CLIENT_SETTINGS_DIR="$ROBLOX_PATH/Contents/MacOS/ClientSettings"
mkdir -p "$CLIENT_SETTINGS_DIR"

cat > "$CLIENT_SETTINGS_DIR/ClientAppSettings.json" << 'EOF'
{
 "DFFlagDebugPauseVoxelizer": false,
  "DFFlagDisableDPIScale": true,
  "DFFlagTextureQualityOverrideEnabled": true,
  "DFIntCSGLevelOfDetailSwitchingDistance": 0,
  "DFIntCSGLevelOfDetailSwitchingDistanceL12": 0,
  "DFIntCSGLevelOfDetailSwitchingDistanceL23": 0,
  "DFIntCSGLevelOfDetailSwitchingDistanceL34": 0,
  "DFIntDebugFRMQualityLevelOverride": 1,
  "DFIntTextureQualityOverride": 0,
  "FFlagDebugGraphicsPreferD3D11": false,
  "FFlagDebugGraphicsPreferOpenGL": false,
  "FFlagDebugGraphicsPreferVulkan": true,
  "FFlagDebugSkyGray": true,
  "FFlagHandleAltEnterFullscreenManually": true,
  "FIntDebugForceMSAASamples": 0,
  "FIntFRMMaxGrassDistance": 0,
  "FIntFRMMinGrassDistance": 0,
  "FIntGrassMovementReducedMotionFactor": 0,
  "DFIntTaskSchedulerTargetFps": 240,
  "FFlagTaskSchedulerLimitTargetFpsTo2402": "True”"
}
EOF

echo "Applied to $ROBLOX_PATH"
echo "Restart Roblox for changes to take effect."
