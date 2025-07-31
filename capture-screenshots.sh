#!/usr/bin/env bash
# Screenshot automation (requires Node + youtube-screenshot-capturer)
# Install with: npm install -g youtube-screenshot-capturer

set -euo pipefail

# Verify dependencies
if ! command -v youtube-screenshot-capturer &>/dev/null; then
  echo "❌ youtube-screenshot-capturer CLI not found. Install via: npm install -g youtube-screenshot-capturer"
  exit 1
fi

VIDEO_ID="TQhv6Wol6Ns"
BASE_URL="https://youtu.be/$VIDEO_ID"

# Arrays of segment start times (seconds) and slug names
IDS=(1 2 3 4 5 6 7 8 9)
TIMES=(16 36 117 153 217 390 519 763 960)
SLUGS=(
  "vibe_coding_after_hours"
  "retro_mac_os_inspiration"
  "time_traveling_browser"
  "multilingual_agent_interface"
  "programmatic_elevator_music"
  "baby_cursor_prototyping"
  "shader_based_webcam_effects"
  "human_ai_collaboration_ethos"
  "design_roles_will_blur"
)

# Create output directory
mkdir -p assets/images

# Loop through and capture each screenshot
for idx in "${!IDS[@]}"; do
  i=${IDS[$idx]}
  t=${TIMES[$idx]}
  slug=${SLUGS[$idx]}
  outfile="assets/images/segment${i}_${slug}.png"
  echo "📸 Capturing segment $i at ${t}s → $outfile"
  youtube-screenshot-capturer \
    --url "$BASE_URL" \
    --time "$t" \
    --output "$outfile" \
    --width 1280 --height 720
done