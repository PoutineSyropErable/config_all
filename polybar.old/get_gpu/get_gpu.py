import os
import subprocess

# Known AMD GPU models (PCI device IDs)
AMD_GPUS = {
    "0x164e": "AMD Raphael (Integrated)",
    "0x73df": "Radeon RX 6700/6750 XT"
}

def get_gpu_name(card):
    """Retrieve GPU name from PCI device ID."""
    device_path = f"/sys/class/drm/{card}/device/device"
    vendor_path = f"/sys/class/drm/{card}/device/vendor"

    if os.path.exists(device_path) and os.path.exists(vendor_path):
        vendor = open(vendor_path).read().strip()
        device_id = open(device_path).read().strip()

        if vendor == "0x1002":  # AMD Vendor ID
            return AMD_GPUS.get(device_id, f"Unknown AMD GPU (ID: {device_id})")
    
    return "Unknown GPU"

def detect_gpus():
    """Find all GPU cards and print their names."""
    gpus = {}
    cards = sorted(os.listdir("/sys/class/drm/"))
    
    for card in cards:
        if card.startswith("card") and not "-" in card:  # Skip outputs like HDMI/DP
            gpus[card] = get_gpu_name(card)
    
    return gpus

if __name__ == "__main__":
    gpus = detect_gpus()
    for card, name in gpus.items():
        print(f"{card}: {name}")

