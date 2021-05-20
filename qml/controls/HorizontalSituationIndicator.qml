import QtQuick 2.0

Item {
    id: attitudeDirectionIndicator
    anchors.fill: parent
    Rectangle {
        id: rectangle
        color: "#00000000"
        anchors.fill: parent







        Image {
            id: hsi_face
            anchors.fill: parent
            source: "../../images/svg_images/hsi/hsi_face.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: hsi_case
            anchors.fill: parent
            source: "../../images/svg_images/hsi/hsi_case.svg"
            fillMode: Image.PreserveAspectFit
        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:300;width:300}
}
##^##*/
