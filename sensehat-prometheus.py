#!/usr/bin/python
from sense_hat import SenseHat
import time

ap = SenseHat()
temp = ap.get_temperature()
temp_f = 1.8 * round(temp, 1) +32
humidity = round(ap.get_humidity(), 1)
pressure = round(ap.get_pressure(), 1)

sensors_file = 'sensors.prom'
path = '/tmp/sensors.prom'
new_sensors = open(path,'w')


#print("Temp: %s F" % temp_f)               # Show temp on console
new_sensors.write("Temp %s\n" % temp_f)

#print("Humidity: %s %%rH" % humidity)        # Show humidity on console
new_sensors.write("Humidity %s\n" % humidity)

#print("Pressure: %s Millibars" % pressure)    # Show pressure on console
new_sensors.write("Pressure %s\n" % pressure)

#ap.set_rotation(180)        # Set LED matrix to scroll from right to left

#ap.show_message("%.1f C" % temp, scroll_speed=0.10, text_colour=[0, 255, 0])

#time.sleep(1)           # Wait 1 second

#ap.show_message("%.1f %%rH" % humidity, scroll_speed=0.10, text_colour=[255, 0, 0]) 

#time.sleep(1)      # Wait 1 second

#ap.show_message("%.1f Millibars" % humidity, scroll_speed=0.10, text_colour=[0, 0, 255])

#ap.clear()      # Clear LED matrix

new_sensors.close()
