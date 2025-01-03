# VIA VPN Helper

## Preparation

#### 1. Create `.env` based on `example.env` and fill out the credentials

#### 2. Start session
Copy this command to bash prompt
```bash
via-cli session start
```

#### 3. Load profile
Copy this command to bash prompt and change the values in `<>`
```bash
via-cli profile load --gateway <vpn_gateway> --username <username> --userpass <password>
```

## Connecting to VPN

#### 1. Connect to vpn
Copy this command to bash prompt
```bash
./via-vpn-connect.sh
```
