#!/bin/bash
# check-security-status.sh
# Check SELinux, AppArmor, firewall, and SSH configuration

echo "Security Status Check"
echo "====================="
echo ""

# Check SELinux
echo "SELinux Status:"
if command -v getenforce > /dev/null; then
    SELINUX_STATUS=$(getenforce)
    echo "  SELinux: $SELINUX_STATUS"
else
    echo "  SELinux: Not installed"
fi
echo ""

# Check AppArmor
echo "AppArmor Status:"
if systemctl is-active --quiet apparmor; then
    echo "  AppArmor: ENABLED"
    systemctl status apparmor --no-pager | grep -E "Active|Loaded"
else
    echo "  AppArmor: DISABLED or not installed"
fi
echo ""

# Check Firewall
echo "Firewall Status:"
if systemctl is-active --quiet ufw; then
    echo "  UFW: ENABLED"
    ufw status | head -5
elif systemctl is-active --quiet firewalld; then
    echo "  Firewalld: ENABLED"
    firewall-cmd --state
else
    echo "  No firewall service detected"
fi
echo ""

# Check SSH Configuration
echo "SSH Configuration:"
if [ -f /etc/ssh/sshd_config ]; then
    echo "  SSH Root Login: $(grep -E '^PermitRootLogin' /etc/ssh/sshd_config | awk '{print $2}')"
    echo "  SSH Password Auth: $(grep -E '^PasswordAuthentication' /etc/ssh/sshd_config | awk '{print $2}')"
    echo "  SSH Port: $(grep -E '^Port' /etc/ssh/sshd_config | awk '{print $2}' || echo '22')"
fi
