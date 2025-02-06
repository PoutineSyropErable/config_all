#!/usr/bin/env python3
import subprocess
from subprocess import PIPE, DEVNULL
import re

"""
Example radeontop output:
1661693993.532512: bus 2d, gpu 0.83%, ee 0.00%, vgt 0.00%, ta 0.83%, sx 0.83%, sh 0.00%, spi 0.83%, sc 0.83%, pa 0.00%,
db 0.83%, cb 0.83%, vram 6.61% 539.47mb, gtt 0.92% 73.34mb, mclk 100.00% 2.000ghz, sclk 74.64% 1.168ghz
"""


class radeontop:
    def __init__(self):
        Komi = subprocess.Popen(["radeontop", "-l", "1", "-d", "-"], stdout=PIPE, stderr=DEVNULL)
        vram = Komi.communicate()[0].decode("utf-8")  # Komi can communicate?
        vram = vram.split("\n")[1]

        print(f"vram = {vram}")
        self.vram = vram.split(",")[12].split()[1]


rtop = radeontop()
print(rtop.vram)
