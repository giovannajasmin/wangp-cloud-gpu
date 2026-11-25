# WanGP on a cloud GPU in one click

Run [WanGP](https://github.com/deepbeepmeep/WanGP) (Wan 2.x, LTX, Hunyuan Video, MiniMax H3, Qwen Image, Flux) on a rented GPU without installing anything on your own PC.

Useful if you are hitting **CUDA out of memory**, your laptop GPU has 6–8 GB of VRAM, or generation is too slow locally.

## ▶️ Launch

**[Launch on Vast.ai](https://cloud.vast.ai/?ref_id=879548&creator_id=879548&name=WanGP%20-%20One%20Click)**: opens a pre-configured instance; WanGP installs itself on boot.

No account yet? [Create one on Vast.ai](https://cloud.vast.ai/?ref_id=879548).

## Which GPU to pick

| What you want to do | GPU | VRAM |
| --- | --- | --- |
| 480p clips, testing | RTX 3090 / 4090 | 24 GB |
| 720p–1080p, longer clips | RTX 5090 / L40S / A6000 | 32–48 GB |
| Highest settings, no compromises | H100 / A100 | 80 GB |

Prices change constantly on the marketplace; sort by price and pick a host with a high reliability score.

## How it works

1. Click **Launch on Vast.ai**, choose a GPU from the table above and rent it.
2. Wait 3–5 minutes while `setup.sh` installs WanGP.
3. On your instance page, open port **7860**: the WanGP interface appears in your browser.
4. When you are done, **destroy the instance** so you stop paying.

The first time you use a model it is downloaded automatically, so the first generation takes longer.

## Running it on any other GPU server

```bash
curl -fsSL https://raw.githubusercontent.com/giovannajasmin/wangp-cloud-gpu/main/setup.sh | bash
```

Then open `http://<server-ip>:7860`.

## Tips

- Save the videos you want to keep before destroying the instance: they are deleted with it.
- Logs: `tail -f /workspace/wangp.log`
- Problems with WanGP itself? Check the [WanGP issues](https://github.com/deepbeepmeep/WanGP/issues).

## Credits

WanGP is developed by [deepbeepmeep](https://github.com/deepbeepmeep/WanGP). This repo only provides a cloud launcher for it.

*The Vast.ai links in this README are affiliate links.*
