#!/usr/bin/env python3

import sys
import random

n = int(sys.argv[1])
for i in range(n):
    print(f"{random.random():.6f}")
