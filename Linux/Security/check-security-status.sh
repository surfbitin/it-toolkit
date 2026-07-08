#!/bin/bash
#
# SYNOPSIS
#     Check system security status
# DESCRIPTION
#     Display SELinux, AppArmor, firewall, and security updates status
# USAGE
#     ./check-security-status.sh
#

echo "=== SECURITY STATUS ==="

echo -e "\n--- SELinux Status ---"
if command -v getenforce &>/dev/null; then
    echo "SELinux: $(getenforce)"
else
    echo "SELinux: Not installed"
fi

echo -e "\n--- AppArmor Status ---"
if command -v aa-status &>/dev/null; then
    echo "AppArmor: $(systemctl is-active apparmor 2>/dev/null || echo 'Not active')"
else
    echo "AppArmor: Not installed"
fi

echo -e "\n--- Firewall Status ---"
if command -v firewall-cmd &>/dev/null; then
    echo "FirewallD: $(systemctl is-active firewalld 2>/dev/null)"
elif command -v ufw &>/dev/null; then
    echo "UFW: $(ufw status | head -n1)"
else
    echo "No firewall service detected"
fi

echo -e "\n--- SSH Configuration ---"
echo "SSH Port: $(grep -E '^Port' /etc/ssh/sshd_config | awk '{print $2}' || echo '22')"
echo "SSH Root Login: $(grep -E '^PermitRootLogin' /etc/ssh/sshd_config | awk '{print $2}' || echo 'Default')"
echo "SSH Password Auth: $(grep -E '^PasswordAuthentication' /etc/ssh/sshd_config | awk '{print $2}' || echo 'Default')"

echo -e "\n--- Failed Login Attempts ---"
echo "Last 24 hours: $(journalctl --since '24 hours ago' | grep 'Failed password\|authentication failure' | wc -l)"
