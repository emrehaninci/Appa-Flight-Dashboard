import QtQuick 2.0

Item {
    id: attitudeDirectionIndicator
    anchors.fill: parent
    Rectangle {
        id: rectangle
        color: "#00000000"
        anchors.fill: parent



        Image {
            id: alt_face_1
            anchors.fill: parent
            source: "../../images/svg_images/alt/alt_face_1.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: alt_face_2
            anchors.fill: parent
            source: "../../images/svg_images/alt/alt_face_2.svg"
            fillMode: Image.PreserveAspectFit
        }



        Image {
            id: alt_hand_1
            anchors.fill: parent
            source: "../../images/svg_images/alt/alt_hand_1.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: alt_hand_2
            anchors.fill: parent
            source: "../../images/svg_images/alt/alt_hand_2.svg"
            fillMode: Image.PreserveAspectFit
        }



        Image {
            id: alt_case
            anchors.fill: parent
            source: "../../images/svg_images/alt/alt_case.svg"
            fillMode: Image.PreserveAspectFit
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:300;width:300}
}
##^##*/
