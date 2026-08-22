#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "==> Updating packages"
pkg update -y && pkg upgrade -y

echo "==> Installing core tools"
pkg install -y openssh git python nodejs tmux wget curl nano vim nmap htop neofetch

echo "==> Setting up storage access"
termux-setup-storage

echo "==> Installing GUI stack (XFCE + VNC)"
pkg install -y x11-repo
pkg install -y tigervnc xfce4

echo "==> Installing Termux:API (for wifi info, wake-lock, etc)"
pkg install -y termux-api

echo "==> Writing VNC xstartup config"
mkdir -p ~/.vnc
cat >~/.vnc/xstartup <<'EOF'
#!/data/data/com.termux/files/usr/bin/sh
xfce4-session &
EOF
chmod +x ~/.vnc/xstartup

echo "==> Setup complete"
echo ""
echo "Next steps:"
echo "  1. Run 'sshd' to start SSH (port 8022)"
echo "  2. Run 'vncserver' to start the VNC desktop (set a password when prompted)"
echo "  3. Run 'termux-wifi-connectioninfo' to get your IP"
echo "  4. Run 'termux-wake-lock' to stop Android from killing background sessions"
echo ""
echo "Connect from Arch:"
echo "  (on Arch, if not already installed: sudo pacman -S tigervnc)"
echo "  ssh -p 8022 \$(whoami)@<phone-ip>"
echo "  vncviewer <phone-ip>:1"
