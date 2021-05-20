import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtPositioning 5.14
import QtGraphicalEffects 1.0

Item {

    Rectangle {
        id: main_area
        color: "#0e111e"
        anchors.fill: parent


        Flow {
            id: flow_area
            anchors.fill: parent
            clip: false
            layoutDirection: Qt.LeftToRight
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 10
            transformOrigin: Item.Center
            flow: Flow.LeftToRight
            anchors.bottomMargin: 60
            spacing: 21

            Rectangle {
                id: airspeed
                width: 385
                height: 360
                radius: 25
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#272935"
                    }

                    GradientStop {
                        position: 1
                        color: "#151926"
                    }
                }
                clip: false

                Rectangle {
                    id: indicator_area
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 10



                    Image {
                        id: asi_case
                        anchors.fill: parent
                        source: "../../images/svg_images/ais/ais_case_v10.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: asi_hand
                        anchors.fill: parent
                        source: "../../images/svg_images/ais/ais_hand_v3.png"
                        rotation: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: asi_text
                        x: 157
                        y: 256
                        width: 67
                        height: 28
                        color: "#000000"
                        text: qsTr("0")
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        minimumPixelSize: 12
                        font.weight: Font.Black
                        font.family: "Arial"
                    }


                }


            }

            Rectangle {
                id: attitude_direction
                width: 385
                height: 360
                radius: 40
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#272935"
                    }

                    GradientStop {
                        position: 1
                        color: "#151926"
                    }
                }

                Rectangle {
                    id: indicator_area1
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 15
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 15



                    Image {
                        id: adi_back
                        anchors.fill: parent
                        source: "../../images/svg_images/adi/adi_back_v4.png"
                        fillMode: Image.PreserveAspectFit
                    }



                    Rectangle {
                        id: rectangle
                        width: 320
                        height: 320
                        color: "#00000000"
                        anchors.verticalCenter: parent.verticalCenter
                        clip: true
                        anchors.horizontalCenter: parent.horizontalCenter

                        Image {
                            id: adi_inner
                            x: 0
                            y: 0
                            width: 320
                            height: 320
                            opacity: 0.9
                            anchors.verticalCenter: parent.verticalCenter
                            source: "../../images/svg_images/adi/adi_face_big_v6.png"
                            anchors.verticalCenterOffset: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            // degisecek deger
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                    Image {
                        id: adi_outer
                        anchors.fill: parent
                        source: "../../images/svg_images/adi/adi_ring_v4.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: adi_case
                        anchors.fill: parent
                        source: "../../images/svg_images/adi/adi_case_v12.png"
                        clip: true
                        fillMode: Image.PreserveAspectFit
                    }





                }
            }

            Rectangle {
                id: altimeter
                width: 385
                height: 360
                radius: 40
                border.width: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#272935"
                    }

                    GradientStop {
                        position: 1
                        color: "#151926"
                    }
                }

                Rectangle {
                    id: indicator_area2
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.rightMargin: 0
                    anchors.topMargin: 15
                    anchors.leftMargin: 0

                    Image {
                        id: bg_circle2
                        x: -812
                        y: 381
                        width: 315
                        height: 322
                        anchors.verticalCenter: parent.verticalCenter
                        source: "../../images/svg_images/bg_circle.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: alt_case
                        anchors.fill: parent
                        source: "../../images/svg_images/alt/alt_case_v3.png"
                        fillMode: Image.PreserveAspectFit
                    }


                    Text {
                        id: alt_text
                        x: 171
                        y: 235
                        width: 65
                        height: 28
                        text: qsTr("0")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Black
                        font.family: "Arial"
                        anchors.verticalCenterOffset: 80
                        anchors.horizontalCenterOffset: -1
                        anchors.horizontalCenter: parent.horizontalCenter
                    }



                    Image {
                        id: alt_needle_mini
                        anchors.fill: parent
                        source: "../../images/svg_images/alt/alt_hand_v2.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Rectangle {
                id: turn_coordinator
                width: 385
                height: 360
                radius: 40
                border.width: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#272935"
                    }

                    GradientStop {
                        position: 1
                        color: "#151926"
                    }
                }

                Rectangle {
                    id: indicator_area3
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 15











                    Image {
                        id: bg_circle1
                        x: 44
                        y: -364
                        width: 385
                        height: 330
                        anchors.verticalCenter: parent.verticalCenter
                        source: "../../images/svg_images/bg_circle.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: tc_plane
                        anchors.fill: parent
                        source: "../../images/svg_images/tc/tc_drone.png"
                        rotation: 0
                        fillMode: Image.PreserveAspectFit
                    }
                    Image {
                        id: tc_case
                        anchors.fill: parent
                        source: "../../images/svg_images/tc/tc_case_v2.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: tc_ball
                        y: 58
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../../images/svg_images/tc/tc_ball_v2.png"
                        anchors.horizontalCenterOffset: 0  // degisecek deger
                        anchors.horizontalCenter: parent.horizontalCenter
                        // degisecek parametre
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: tc_cubuk
                        anchors.fill: parent
                        source: "../../images/svg_images/tc/tc_face_v3.png"
                        fillMode: Image.PreserveAspectFit
                    }

                }
            }

            Rectangle {
                id: horizontal_situation
                width: 385
                height: 360
                radius: 40
                border.width: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#272935"
                    }

                    GradientStop {
                        position: 1
                        color: "#151926"
                    }
                }

                Rectangle {
                    id: indicator_area4
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.rightMargin: 0
                    anchors.topMargin: 15
                    anchors.leftMargin: 0



                    Image {
                        id: hsi_face
                        anchors.fill: parent
                        source: "../../images/svg_images/hsi/hsi_face_v3.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: hsi_case
                        anchors.fill: parent
                        source: "../../images/svg_images/hsi/hsi_v5.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: hsi_cover
                        anchors.fill: parent
                        source: "../../images/svg_images/hsi/hsi_case_v2.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Rectangle {
                id: vertical_speed_indicator_area
                width: 385
                height: 360
                radius: 40
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#272935"
                    }

                    GradientStop {
                        position: 1
                        color: "#151926"
                    }
                }

                Rectangle {
                    id: indicator_area5
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 15

                    Image {
                        id: bg_circle3
                        x: -812
                        y: 0
                        width: 385
                        height: 330
                        anchors.verticalCenter: parent.verticalCenter
                        source: "../../images/svg_images/bg_circle.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: vsi_case
                        anchors.fill: parent
                        source: "../../images/svg_images/vsi/vsi_case_v2.png"
                        fillMode: Image.PreserveAspectFit
                    }


                    Text {
                        id: vsi_text
                        x: 159
                        y: -150
                        width: 65
                        height: 26
                        text: qsTr("0")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.verticalCenterOffset: 93
                        font.weight: Font.Black
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.horizontalCenterOffset: 0
                        font.family: "Arial"
                    }

                    Image {
                        id: vsi_hand
                        anchors.fill: parent
                        source: "../../images/svg_images/vsi/vsi_hand_v2.png"
                        rotation: 0
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }

        Rectangle {
            id: bottom_area
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: flow_area.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 0

            Row {
                id: row_bottom
                anchors.fill: parent
                spacing: 10
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 5

                Rectangle {
                    id: arm_box
                    width: 100
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#272935"
                        }

                        GradientStop {
                            position: 1
                            color: "#1e272e"
                        }
                    }

                    Text {
                        id: arm_text
                        height: 50
                        color: "#ffffff"
                        text: qsTr("ARM")
                        anchors.fill: parent
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Medium
                        font.family: "Arial"
                    }
                }

                Rectangle {
                    id: mode_box
                    width: 310
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#272935"
                        }

                        GradientStop {
                            position: 1
                            color: "#1e272e"
                        }
                    }
                    Text {
                        id: flight_mode_text
                        color: "#ffffff"
                        text: qsTr("-")
                        anchors.left: mode.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        font.family: "Arial"
                        font.weight: Font.Medium
                    }

                    Text {
                        id: mode
                        width: 97
                        color: "#0fbcf9"
                        text: qsTr("Uçuş Modu")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        anchors.topMargin: 5
                        anchors.leftMargin: 15
                        font.family: "Arial"
                        font.weight: Font.Medium
                    }

                    Text {
                        id: mode1
                        width: 97
                        color: "#64d9c9"
                        text: qsTr("Flight Mode")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignBottom
                        anchors.bottomMargin: 5
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }
                }

                Rectangle {
                    id: battery_box
                    width: 150
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#272935"
                        }

                        GradientStop {
                            position: 1
                            color: "#1e272e"
                        }
                    }
                    Text {
                        id: battery_text
                        color: "#ffffff"
                        text: qsTr("-")
                        anchors.left: bat.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 10
                    }

                    Text {
                        id: bat
                        width: 67
                        color: "#0fbcf9"
                        text: qsTr("Batarya")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        anchors.topMargin: 5
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                    Text {
                        id: mode2
                        x: -305
                        y: 24
                        width: 97
                        color: "#64d9c9"
                        text: qsTr("Battery")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignBottom
                        font.family: "Arial"
                        anchors.bottomMargin: 5
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }
                }

                Rectangle {
                    id: sat_box
                    width: 120
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#272935"
                        }

                        GradientStop {
                            position: 1
                            color: "#1e272e"
                        }
                    }
                    Text {
                        id: sat_text
                        width: 104
                        color: "#ffffff"
                        text: qsTr("-")
                        anchors.left: sat.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 10
                    }

                    Text {
                        id: sat
                        width: 46
                        color: "#0fbcf9"
                        text: qsTr("Uydu")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        anchors.topMargin: 5
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                    Text {
                        id: mode3
                        x: -305
                        y: 24
                        width: 97
                        color: "#64d9c9"
                        text: qsTr("Satellite")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignBottom
                        font.family: "Arial"
                        anchors.bottomMargin: 5
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }
                }

                Rectangle {
                    id: gps_lat_box
                    width: 230
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#272935"
                        }

                        GradientStop {
                            position: 1
                            color: "#1e272e"
                        }
                    }
                    Text {
                        id: lat
                        width: 64
                        color: "#0fbcf9"
                        text: qsTr("Enlem")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        anchors.topMargin: 5
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                    Text {
                        id: lat_text
                        color: "#ffffff"
                        text: qsTr("-")
                        anchors.left: lat.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 10
                    }

                    Text {
                        id: mode4
                        x: -305
                        y: 24
                        width: 97
                        color: "#64d9c9"
                        text: qsTr("Latitude")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignBottom
                        font.family: "Arial"
                        anchors.bottomMargin: 5
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                }

                Rectangle {
                    id: gps_lon_box
                    width: 230
                    height: 45
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#272935"
                        }

                        GradientStop {
                            position: 1
                            color: "#1e272e"
                        }
                    }
                    Text {
                        id: lon
                        width: 64
                        color: "#0fbcf9"
                        text: qsTr("Boylam")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        anchors.topMargin: 5
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                    Text {
                        id: lon_text
                        color: "#ffffff"
                        text: qsTr("-")
                        anchors.left: lon.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        font.family: "Arial"
                        font.weight: Font.Medium
                        anchors.leftMargin: 10
                    }

                    Text {
                        id: mode5
                        x: -305
                        y: 24
                        width: 97
                        color: "#64d9c9"
                        text: qsTr("Longitude")
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignBottom
                        font.family: "Arial"
                        anchors.bottomMargin: 5
                        font.weight: Font.Medium
                        anchors.leftMargin: 15
                    }

                }
            }
        }




    }

    // BACKEND CONNECTIONS

    Connections{
        target: backend

        // BOTTOM VALUES ---------------------------------------------------------

        // ARM
        function onChangeArm(value){
            if(value){
                arm_text.color = "#0be881"
            }
            else if(!value){
                arm_text.color = "#ff3f34"
            }
        }

        // Flight Mode
        function onChangeFlightMode(value){
            flight_mode_text.text = value
        }

        // Number of Sats
        function onChangeSatNum(value){
            sat_text.text = value
        }

        // Battery
        function onChangeBattery(value){
            battery_text.text = value
        }

        // GPS Lat
        function onChangeLat(value){
            lat_text.text = value
        }

        // GPS Lpn
        function onChangeLon(value){
            lon_text.text = value
        }



        // ------------------------------------------------------------------------

        // YAW VALUE - Dronekit
        function onChangeYawValue(value){
            hsi_face.rotation = value
            // yaw_value.text = value
        }


        // PITCH VALUE - Dronekit
        function onChangePitchValue(value){
            // Attitude Direction Indicator
            adi_inner.anchors.verticalCenterOffset = value
        }

        // ROLL VALUE - Dronekit
        function onChangeRollValue(value){

            // Turn Coordinator
            tc_plane.rotation = value
            // roll_value.text = value

            // Attitude Direction Indicator
            adi_inner.rotation = value
            adi_outer.rotation = value

        }

        // TURN COORDINATOR BALL
        function onChangeTcBall(value){
            tc_ball.anchors.horizontalCenterOffset = value
        }

        // AIRSPEED VALUE - Dronekit
        function onChangeAisValue(value){
            asi_hand.rotation = value

        }
        function onChangeAisTextValue(text){
            asi_text.text = text

        }



        // HEADING VALUE - Dronekit

        function onChangeHeadingValue(value){
            hsi_face.rotation = value
            // heading_value.text = value
        }

        // ALTITUDE VALUE (ALTIMETER) - Dronekit

        function onChangeAltitudeValue(value){
            alt_needle_mini.rotation = value
        }

        function onChangeAltText(value){
            alt_text.text = value
        }

        // VERTICAL SPEED VALUE - Dronekit

        function onChangeVerticalSpeedValue(value){
            vsi_hand.rotation = value
        }

        function onChangeVerticalSpeedText(value){
            vsi_text.text = value
        }


    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:818;width:1218}D{i:70}D{i:77}D{i:84}
D{i:91}D{i:98}
}
##^##*/
