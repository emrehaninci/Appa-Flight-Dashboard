import QtQuick 2.0

Item {
    id: attitudeDirectionIndicator
    anchors.fill: parent
    Rectangle {
        id: rectangle
        color: "#00000000"
        anchors.fill: parent



        Image {
            id: ts_back
            anchors.fill: parent
            source: "../../images/svg_images/tc/tc_back.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: ts_face1
            anchors.fill: parent
            source: "../../images/svg_images/tc/tc_face_1.svg"
            fillMode: Image.PreserveAspectFit
        }


        Image {
            id: ts_face2
            anchors.fill: parent
            source: "../../images/svg_images/tc/tc_face_2.svg"
            fillMode: Image.PreserveAspectFit
        }


        Image {
            id: ts_ball
            anchors.fill: parent
            source: "../../images/svg_images/tc/tc_ball.svg"
            fillMode: Image.PreserveAspectFit
        }



        Image {
            id: ts_mark
            anchors.fill: parent
            source: "../../images/svg_images/tc/tc_mark.svg"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: ts_case
            anchors.fill: parent
            source: "../../images/svg_images/tc/tc_case.svg"
            fillMode: Image.PreserveAspectFit
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:300;width:300}
}
##^##*/
