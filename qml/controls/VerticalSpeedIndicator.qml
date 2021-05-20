import QtQuick 2.0

Item {
    id: attitudeDirectionIndicator
    anchors.fill: parent
    Rectangle {
        id: rectangle
        color: "#00000000"
        anchors.fill: parent








        Image {
            id: vsi_face
            anchors.fill: parent
            source: "../../images/svg_images/vsi/vsi_face.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: vsi_hand
            anchors.fill: parent
            source: "../../images/svg_images/vsi/vsi_hand.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: vsi_case
            anchors.fill: parent
            source: "../../images/svg_images/vsi/vsi_case.svg"
            fillMode: Image.PreserveAspectFit
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2}D{i:3}
}
##^##*/
