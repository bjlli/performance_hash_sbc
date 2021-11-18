#!/usr/bin/env python
from ina219 import INA219
from ina219 import DeviceRangeError
from time   import sleep
import numpy as np

SHUNT_OHMS = 0.1
MAX_EXPECTED_AMPS = 0.5

def read():
    ina = INA219(SHUNT_OHMS, MAX_EXPECTED_AMPS)
    ina.configure(ina.RANGE_16V)
    count = 0
    samples = 600
    ma_filt_samples = 5
    sum = 0
    curr_array = np.ones((int(samples+1),1),dtype=float)
    curr_arra_filt = np.zeros((int(ma_filt_samples),1),dtype=float)
    pow_consump = 0
    while(True):
        if(count <= samples):
            try:
                for i in range(int(ma_filt_samples-1),0,-1):
                    curr_arra_filt[i] = curr_arra_filt[i-1]
                    sum = sum + curr_arra_filt[i]
                curr_arra_filt[0] = ina.current()
                sum = sum + curr_arra_filt[0]
                curr_array[count] = sum/(ma_filt_samples+1)
                print("Current: %.3f mA" % curr_array[count])
                sum = 0
            except DeviceRangeError as e:
                print(e)
            sleep(0.95)
            count = count + 1
        else:
            break
    print(curr_array)
    pow_consump = np.sum(curr_array,dtype=float)/600
    print("Power Consumption: %.3f mAh" % pow_consump)


if __name__ == "__main__":
    read()

