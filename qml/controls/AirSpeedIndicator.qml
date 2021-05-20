import QtQuick 2.0

Item {
    id: airSpeedIndicator
    anchors.fill: parent
    Rectangle {
        id: rectangle
        color: "#00000000"
        anchors.fill: parent

        Image {
            id: ais_case
            anchors.fill: parent
            source: "../../images/svg_images/ais/asi_case.svg"
            fillMode: Image.PreserveAspectFit

            Image {
                id: ais_face
                anchors.fill: parent
                source: "../../images/svg_images/ais/asi_face.svg"
                fillMode: Image.PreserveAspectFit

                Image {
                    id: indicator
                    anchors.fill: parent
                    source: "../../images/svg_images/ais/asi_hand.svg"
                    anchors.bottomMargin: 0
                    rotation: 0
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }

    Connections{
        target: backend
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:300;width:300}
}
##^##*/
