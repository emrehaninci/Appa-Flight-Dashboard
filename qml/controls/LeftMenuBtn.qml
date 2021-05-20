import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnLeftMenu
    text: qsTr("Left Menu Text")

    // CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/home_icon.svg"
    property color btnColorDefault: "#1e272e"
    property color btnColorMouseOver: "#39424c"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 12
    property int iconHeight: 12
    property color activeMenuColor: "#55aaff"
    property color activeMenuColorRight: "#39424c"
    property bool isActiveMenu: false

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnLeftMenu.down){
                                       btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    implicitWidth: 50
    implicitHeight: 50

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Rectangle{
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }

        Rectangle{
            anchors{
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            color: activeMenuColorRight
            width: 5
            visible: isActiveMenu
        }

    }

    contentItem: Item{
        anchors.fill: parent
        id: content
        Image {
            id: iconBtn
            width: 16
            height: 16
            source: btnIconSource
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay{
            width: 16
            height: 16
            source: iconBtn
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
        }
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:50;width:50}
}
##^##*/
