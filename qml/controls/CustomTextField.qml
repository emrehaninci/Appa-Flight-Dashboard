import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

TextField {
    id: textField

    // Custom Properties
    property color colorDefault: "#1e272e"
    property color colorOnFocus: "#232d35"
    property color colorMouseOver: "#232d35"

    QtObject{
        id: internal

        property var dynamicColor: if(textField.focus){
                                        textField.hovered ? colorOnFocus : colorDefault
                                   }else{
                                       textField.hovered ? colorMouseOver : colorDefault
                                   }
    }

    implicitWidth: 300
    implicitHeight: 40
    placeholderText: qsTr("Yazma alanı")
    color: "#ffffff"
    background: Rectangle {
        color: internal.dynamicColor
    }

    selectByMouse: true
    selectedTextColor: "#FFFFFF"
    selectionColor: "#ff007f"
    placeholderTextColor: "#81848c"
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.5;height:40;width:640}
}
##^##*/
