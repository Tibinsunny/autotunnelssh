# 🚀 AutoTunnelSSH - SSH Access via ngrok with Email Notifications 📧  

AutoTunnelSSH is a simple script that sets up a **secure SSH tunnel** over ngrok and emails you the tunnel link using **MailTrap**.  

This is perfect for:  
- Accessing your **home network** remotely. 🏠  
- Situations where you **don't have a static IP**. 🌐  

## 📋 Features  

✅ **ngrok Tunnel**: Automatically maps port `22` for SSH access.  
✅ **Email Alerts**: Sends the tunnel link to your inbox using MailTrap.  
✅ **Auto-Start on Boot**: Runs automatically when your system boots up and connects to WiFi.  
✅ **Easy Setup**: Install everything with a single script. 🛠️  

## 🛠️ Prerequisites  

Before you begin, ensure you have:  
1. A **MailTrap** account (Token & Email ID).  
2. An **ngrok** account and authentication token.  
3. A **Linux** system with `systemd` enabled.  

## 📦 Installation  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/Tibinsunny/autotunnelssh.git
cd autotunnelssh
```

### 2️⃣ Make the Install Script Executable  
```bash
chmod +x install.sh
```

### 3️⃣ Run the Installation Script 🚀  
Run the script as **root** (or using `sudo`) to install system-level services:  
```bash
sudo ./install.sh
```

### 4️⃣ Provide Required Details 📝  
During installation, you'll be prompted to enter:  
- **MailTrap Token**  
- **ngrok Token**  
- **Email ID registered with MailTrap**  

⚠️ Make sure to input the correct details to avoid errors.

## 🔧 How It Works  

1. **`autossh.sh`**  
   - Starts the **ngrok tunnel** on port `22`.  
   - Retrieves the public tunnel link.  
   - Sends the link via **MailTrap's SMTP service**.  

2. **`autotunnel.service`**  
   - A `systemd` service that runs `autossh.sh`:  
     - **On boot**.  
     - **When WiFi connects**.  

3. **`install.sh`**  
   - Configures the required tokens and email.  
   - Installs scripts to the correct locations.  
   - Enables and starts the `systemd` service.

## ✅ Verify Your Setup  

To check if the service is running:  
```bash
sudo systemctl status autotunnel.service
```

📄 View logs to debug any issues:  
```bash
journalctl -u autotunnel.service
```

## 🔒 Security Notes  

🔑 **Keep your tokens private** and secure. Do not share them.  
🛡️ Use **SSH key-based authentication** instead of passwords for additional security.  
🚫 This setup is designed for **personal use only** on trusted networks.  

## 🧹 Uninstallation  

To remove the setup completely:  
```bash
sudo systemctl stop autotunnel.service
sudo systemctl disable autotunnel.service
sudo rm /bin/autotunnelssh.sh
sudo rm /etc/systemd/system/autotunnel.service
sudo systemctl daemon-reload
```

## 📝 License  

This project is licensed under the **MIT License**.  

## 🤝 Contributions  

Contributions are welcome! Feel free to:  
- Submit **pull requests**.  
- Report **issues**.  

## 👤 Author  

- **Tibin Sunny**  
- GitHub: [tibinsunny](https://github.com/tibinsunny)  

🌟 **Enjoy easy and secure SSH access with ngrok! Happy Tunneling! 🚀**
