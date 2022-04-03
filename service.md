Create service

```
sudo vim /etc/systemd/system/nixie.service
```

```
[Unit]
Discription=Start Nixie clock at boot
After=network.target
StartLimitIntervalSec=0

[Service]
Restart=always
RestartSec=2
ExecStart=/home/pi/bin/nixie

[Timer]
OnBootSec=5
OnUnitInactiveSec=1s

[Install]
WantedBy=multi-user.target
```

Start me up

```
systemctl enable nixie.service
systemctl start nixie.service
systemctl restart nixie.service
systemctl daemon-reload

# log and debug:
journalctl -u nixie.service
```
