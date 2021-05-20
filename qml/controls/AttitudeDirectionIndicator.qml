import QtQuick 2.0

Item {
    id: attitudeDirectionIndicator
    anchors.fill: parent
    Rectangle {
        id: rectangle
        color: "#00000000"
        anchors.fill: parent


        Image {
            id: adi_back
            anchors.fill: parent
            source: "../../images/svg_images/adi/adi_back.svg"
            antialiasing: false
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: adi_ring
            anchors.fill: parent
            source: "../../images/svg_images/adi/adi_ring.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: adi_face
            anchors.fill: parent
            source: "../../images/svg_images/adi/adi_face.svg"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            id: adi_case
            anchors.fill: parent
            source: "../../images/svg_images/adi/adi_case.svg"
            antialiasing: false
            fillMode: Image.PreserveAspectFit
        }


    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:300;width:300}
}
##^##*/
