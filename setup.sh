#!/bin/bash
# One-click WanGP launcher for rented cloud GPUs (Vast.ai and similar).
# Installs WanGP, then starts the web UI on port 7860.
set -e

WORKDIR="${WORKDIR:-/workspace}"
# On Vast templates WANGP_PORT is set to 17860 and the Instance Portal serves it on 7860.
PORT="${WANGP_PORT:-7860}"

mkdir -p "$WORKDIR" && cd "$WORKDIR"

echo "==> Installing system packages"
if command -v apt-get >/dev/null 2>&1; then
  apt-get update -y && apt-get install -y git ffmpeg >/dev/null
fi

echo "==> Downloading WanGP"
if [ ! -d WanGP ]; then
  git clone --depth 1 https://github.com/deepbeepmeep/WanGP.git
fi
cd WanGP

echo "==> Installing Python dependencies (this takes a few minutes the first time)"
python3 -m pip install --upgrade pip
if ! python3 -c "import torch; assert torch.cuda.is_available()" 2>/dev/null; then
  python3 -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128
fi
python3 -m pip install -r requirements.txt

echo "==> Starting WanGP on port $PORT"
export GRADIO_SERVER_NAME=0.0.0.0
export GRADIO_SERVER_PORT="$PORT"
nohup python3 wgp.py --listen --server-port "$PORT" > "$WORKDIR/wangp.log" 2>&1 &

echo "WanGP is starting. Open port $PORT from your instance page."
echo "Models download on first use, so the first generation is slower."
echo "Logs: tail -f $WORKDIR/wangp.log"
