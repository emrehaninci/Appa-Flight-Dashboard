import QtQuick 2.15
import QtQuick.Controls 2.15

ComboBox {
    id: control
    model: ["COM4", "COM14", "127.0.0.1/1470"]

    font.family: "Arial"
    font.letterSpacing: 1
    font.pixelSize: 14
    font.weight: Font.Medium
    font.bold: true


    property color colorDefault: "#0fbcf9"
    property color colorMouseOver: "#2f3740"
    property color colorPressed: "#272e36"
    width: 180

    QtObject{
        id: internal

        property var dynamicColor: if(control.down){
                                       control.down ? colorPressed : colorDefault
                                   }else{
                                       control.hovered ? colorMouseOver : colorDefault
                                   }
    }

    delegate: ItemDelegate {
        id:itemDlgt
        width: control.width
        contentItem: Text {
            text: modelData
            color: "#ffffff"  // acilir kutu text rengi
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: {control.highlightedIndex === index}

        background: Rectangle {
                    color:itemDlgt.hovered?"#ef5777":"#333b45";  // acilir kutu arkaplan
                    anchors.left: itemDlgt.left
                    anchors.leftMargin: 0
                    width:itemDlgt.width-2
                  }



    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: control
            function onPressedChanged() { canvas.requestPaint(); }
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = control.pressed ? "#ffffff" : "#ffffff";  // ok rengi
            context.fill();
        }
    }

    contentItem: Text {
        leftPadding: 0
        rightPadding: control.indicator.width + control.spacing
        text: control.displayText
        font: control.font
        color: control.pressed ? "#ffffff" : "#ffffff"  // font rengi
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 10
        elide: Text.ElideRight
        anchors.left: parent.left
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        //border.color: "#00d8d6"
        //border.color: control.pressed ? "#17a81a" : "#21be2b"
        //border.width: control.visualFocus ? 2 : 1
        //radius: 2
        color: internal.dynamicColor
    }

    popup: Popup {
        y: control.height - 1
        width: control.width
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            //border.color: "#00d8d6"
            //radius: 2
            color: internal.dynamicColor

        }
    }
}
