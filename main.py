# This Python file uses the following encoding: utf-8
# IUC IEEE APPA Kullanici Arayuzu
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
# backend icin gerekli kutuphaneler
from PySide2.QtCore import QObject, Slot, Signal, QTimer

# Pixhawk baglantisi icin gerekli kutuphaneler
from dronekit import connect, Command, VehicleMode, LocationGlobalRelative, LocationGlobal
import time
import math
from pymavlink import mavutil
import numpy as np
import cv2



# backend icin gerekli class
class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

        self.timer = QTimer()
        self.timer.timeout.connect(lambda: self.getConnect())
        self.timer.start(250)
# ----------------------------------------------------------------------------------------
    # Dronekit baglantisi
    connection_string = "COM4"
    baud_rate_value = 57600

    isConnected = False
    isButtonClicked = False

    # Baglanti butonu ve sinyal atamalari
    changeConnectionButtonText = Signal(str)
    changeConnectionButtonColor = Signal(str)
    isLoadingVisible = Signal(bool)

    # Degerlerin guncellenmesi
    changeRollValue = Signal(int)
    changeYawValue = Signal(int)
    changePitchValue = Signal(int)
    changeAisValue = Signal(float)
    changeAisTextValue = Signal(float)
    changeHeadingValue = Signal(float)
    changeAltitudeValue = Signal(float)
    changeAltText = Signal(int)
    changeVerticalSpeedValue = Signal(float)
    changeVerticalSpeedText = Signal(int)

    changeTcBall = Signal(int)

    changeArm = Signal(bool)
    changeFlightMode = Signal(str)
    changeBattery = Signal(int)
    changeSatNum = Signal(int)
    changeLat = Signal(float)
    changeLon = Signal(float)

    # Dikey hiz hesabi icin bilesenler
    counter = 5
    vertical_speed_former = 0
    vertical_speed_latter = 0
    vertical_speed = 0

    @Slot(str)
    def getComPort(self, com_port):
        self.connection_string = com_port
        print(self.connection_string)


    @Slot(str)
    @Slot(bool)
    def getBaudRate(self, baud_rate):
        self.baud_rate_value = int(baud_rate)
        print(self.baud_rate_value)

        self.isButtonClicked = True

        self.isLoadingVisible.emit(True)

        # self.getConnect(); # Dronekit



    def getConnect(self):


        if self.isButtonClicked is True:
            # Dronekit Baglantisi
            global vehicle
            vehicle = connect(self.connection_string, wait_ready=True, baud = self.baud_rate_value)
            print("Baglanti kuruldu")
            print(vehicle.attitude)

            # Butonun yazisi ve renginin baglanti kuruldugunda degismesi
            self.changeConnectionButtonText.emit("BAĞLANDI") # Button Text
            self.changeConnectionButtonColor.emit("#05c46b") # Button Color

            self.isLoadingVisible.emit(False)


            self.isButtonClicked = False
            self.isConnected = True

        elif ((self.isButtonClicked is False) and (self.isConnected is True)):

            # Alttaki degerler
            arm_stat = vehicle.armed
            print(f"arm_stat = {arm_stat}")
            self.changeArm.emit(arm_stat)

            flight_mode = vehicle.mode.name
            print(f"flight_mode = {flight_mode}")
            self.changeFlightMode.emit(flight_mode)

            battery = vehicle.battery.level
            print(f"battery = {battery}")
            self.changeBattery.emit(battery)

            satNum = vehicle.gps_0.satellites_visible
            print(f"satNum = {satNum}")
            self.changeSatNum.emit(satNum)

            gps_lat = vehicle.location.global_frame.lat
            print(f"gps_lat = {gps_lat}")
            self.changeLat.emit(gps_lat)

            gps_lon = vehicle.location.global_frame.lon
            print(f"gps_lon = {gps_lon}")
            self.changeLon.emit(gps_lon)


            # ROLL
            roll = str(vehicle.attitude.roll)
            roll = int(100*(float(roll))) # -160 +160 araliginda
            print(f"\nroll [gelen] = {roll}")
            roll = mapFromTo(roll, -160, 160, -90, 90)
            self.changeRollValue.emit(roll)
            print(f"roll [giden] = {roll}\n")

            # TURN COORDINATOR BALL
            tc_ball = mapFromTo(roll, -90, 90, -55, 55)
            self.changeTcBall.emit(tc_ball)


            # YAW
            yaw = str(vehicle.attitude.yaw)
            yaw = int(100*(float(yaw))) # -310 +310 araliginda
            print(f"\nyaw [gelen] = {yaw}")
            yaw = mapFromTo(yaw, -310, 310, -180, 180)
            self.changeYawValue.emit(yaw)
            print(f"yaw [giden] = {yaw}\n")


            # PITCH
            pitch = str(vehicle.attitude.pitch)
            pitch = int(100*(float(pitch))) # -310 +310 araliginda
            print(f"\npitch [gelen] = {pitch}")
            pitch = mapFromTo(pitch, -50, 50, -50, 50)
            self.changePitchValue.emit(pitch)
            print(f"\npitch [giden] = {pitch}")

            # AIRSPEED
            air_speed = vehicle.airspeed
            air_speed_round = round(air_speed,2)
            self.changeAisTextValue.emit(air_speed_round)

            print(f"\nair_speed [gelen] = {air_speed}")
            air_speed = mapFromTo(air_speed, 0, 24, 0, 270)
            self.changeAisValue.emit(air_speed)
            print(f"\nair_speed [giden] = {air_speed}")

            # HEADING
            heading = vehicle.heading
            print(f"\nheading [gelen] = {heading}")
            # heading = mapFromTo(heading, 0, 360, 0, 360)
            self.changeHeadingValue.emit(heading)
            print(f"\nheading [giden] = {heading}")

            # ALTITUDE
            altitude = vehicle.location.global_relative_frame.alt
            alt_int = abs(int(altitude))
            self.changeAltText.emit(alt_int)
            print(f"\naltitude [gelen] = {altitude}")
            altitude = mapFromTo(abs(altitude), 0, 40, 0, 360)

            self.changeAltitudeValue.emit(altitude)
            print(f"\naltitude [giden] = {altitude}")

            # VERTICAL SPEED
            print(self.counter)

            if (self.counter % 5 == 0):
                self.vertical_speed_former = vehicle.location.global_frame.alt
            elif (self.counter % 5 == 4):
                self.vertical_speed_latter = vehicle.location.global_frame.alt
                self.vertical_speed = (self.vertical_speed_latter - self.vertical_speed_former)

                self.changeVerticalSpeedText.emit(int(self.vertical_speed))
                print(f"\nVertical Speed [text] = {int(self.vertical_speed)}")

                self.vertical_speed = mapFromTo(self.vertical_speed, -12, 12, -180, 180)
                self.changeVerticalSpeedValue.emit(self.vertical_speed)


                print(f"\nVertical Speed Former = {self.vertical_speed_former}")
                print(f"\nVertical Speed Latter = {self.vertical_speed_latter}")
                print(f"\nVertical Speed [giden] = {self.vertical_speed}")


            self.counter += 1

        else:
            print("else")

# ----------------------------------------------------------------------------------------

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    def mapFromTo(x,a,b,c,d): # Sayı araliklarini dengelemek icin map fonksiyonu
       y=(x-a)/(b-a)*(d-c)+c # x:input value - a,b:input range - c,d:output range - y:return value
       return y

    # Pixhawk baglantisi
#    def pixhawkConnection(connectionString, connectionBaud):
#        vehicle = connect(connectionString, wait_ready=True, baud = connectionBaud)
 #       print(vehicle.attitude)

    # backend baglantisi
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    # QML dosyasi yukleme
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
