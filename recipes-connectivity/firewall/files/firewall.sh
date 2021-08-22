#!/bin/sh

start() {
    iptables -P INPUT DROP
    iptables -P FORWARD DROP
    iptables -P OUTPUT ACCEPT

    iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    iptables -A INPUT -s 127.0.0.0/8 -j ACCEPT
    iptables -A INPUT -p tcp -m tcp --dport 22 -m state --state NEW -m recent --update --seconds 300 --hitcount 3 --name ssh --mask 255.255.255.255 --rsource -j REJECT --reject-with tcp-reset
    iptables -A INPUT -p tcp -m tcp --dport 22 -m state --state NEW -m recent --set --name ssh --mask 255.255.255.255 --rsource
    iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
}

stop() {
    iptables -F
    iptables -X
    iptables -P INPUT ACCEPT
    iptables -P FORWARD ACCEPT
    iptables -P OUTPUT ACCEPT
}

case "$1" in
    start|restart)
        echo "Starting firewall"
        stop
        start
        ;;
    stop)
        echo "Stopping firewall"
        stop
        ;;
esac
