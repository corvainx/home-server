#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "==> Installing Rust"
pkg install -y rust

echo "==> Installing dufs (simple web file server with upload GUI)"
cargo install dufs

echo "==> Adding cargo bin to PATH"
if ! grep -q '.cargo/bin' ~/.bashrc 2>/dev/null; then
  echo 'export PATH=$PATH:$HOME/.cargo/bin' >>~/.bashrc
fi
export PATH=$PATH:$HOME/.cargo/bin

echo "==> Setup complete"
echo ""
echo "To start the file server:"
echo "  dufs -p 8000 ~/storage/cloud --allow-upload -a 'admin:test1234@/:rw'  "
echo ""
echo "Access it at:"
echo "  http://localhost:8000        (on this phone)"
echo "  http://<phone-ip>:8000       (from other devices, e.g. Arch laptop)"
