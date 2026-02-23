import sys
from collections import defaultdict
from scapy.all import rdpcap, TCP, IP

def analyze_pcap(file_path):
    packets = rdpcap(file_path)

    port_counter = defaultdict(int)
    ip_counter = defaultdict(int)
    total = 0

    for pkt in packets:
        if IP in pkt:
            src = pkt[IP].src
            ip_counter[src] += 1
            total += 1

        if TCP in pkt:
            port = pkt[TCP].dport
            port_counter[port] += 1

    print(f"\n=== Analysis: {file_path} ===")
    print(f"Total packets: {total}")
    print(f"Unique source IPs: {len(ip_counter)}")
    print(f"Unique destination ports: {len(port_counter)}")

    top_ports = sorted(port_counter.items(), key=lambda x: x[1], reverse=True)[:5]
    print("\nTop destination ports:")
    for port, count in top_ports:
        print(f"Port {port}: {count} packets")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 pcap_stats.py <pcap_file>")
        sys.exit(1)

    analyze_pcap(sys.argv[1])
