import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"

Item {
    Rectangle {
        id: rectangle
        color: "#0e111e"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Text {
            id: text1
            x: 440
            y: 305
            color: "#ffffff"
            text: qsTr("GELİŞTİRME AŞAMASINDA")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.weight: Font.Thin
            font.family: "Arial"
            anchors.horizontalCenter: parent.horizontalCenter
        }



    }

    Connections{
        target:backend

    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9;height:600;width:930}
}
##^##*/
