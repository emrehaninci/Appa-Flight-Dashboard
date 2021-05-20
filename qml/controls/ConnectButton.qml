import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnTopBar
    // CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/minimize_icon.svg"
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"


    Rectangle {
        id: connect_color
        color: "#ef5777"
        anchors.fill: parent
    }

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    Text {
        id: connect_text
        x: 56
        y: 13
        color: "#d2dae2"
        text: qsTr("BAĞLAN")
        anchors.verticalCenter: parent.verticalCenter
        font.letterSpacing: 1.5
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.weight: Font.Medium
        font.bold: true
        font.family: "Arial"
    }




    width: 120
    height: 35

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
    }

    Connections{
        target: backend

        // Change Text
        function onChangeConnectionButtonText(text){
                    connect_text.text = text
                }

        // Change Color
        function onChangeConnectionButtonColor(color){
                    connect_color.color = color
                }

    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:1.75}
}
##^##*/
