sudo apt update && sudo apt install -y xdotool && cat << 'EOF' > /root/autoclick.sh
#!/bin/bash

echo "⏳ You have 5 seconds to move your mouse to desired position..."
sleep 5

POS=\$(xdotool getmouselocation --shell)
eval "\$POS"

echo "📍 Mouse locked at position (\$X, \$Y)"
sleep 1

while true; do
  xdotool mousemove \$X \$Y click 1
  echo "✔️ Clicked at \$(date) on (\$X, \$Y)"
  sleep 5
done
EOF

chmod +x /root/autoclick.sh && bash /root/autoclick.sh
