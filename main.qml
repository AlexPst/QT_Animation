import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: rootWindow
    width: 640
    height: 480
    visible: true


    Rectangle{
        id: scene
        anchors.fill: parent
        color: "grey"
        state: "toLeftRect"
        Rectangle{
            id: rectOne
            x: scene.height/2
            y: scene.width/2
            width: 50
            height: 50
            //color: "red"
            border.color: "black"
            border.width: 3
            radius: 5
            Text {
                id: nameLeftRect
                anchors.centerIn: parent
                text: qsTr("move")
            }
            MouseArea{
                anchors.fill: parent
                onClicked: if(rectRed.x>=rectTwo.x)
                           {rectRed.x}
                           else{rectRed.x+=20
                           scene.state = "fromCurrPos"}
            }

        }

        Rectangle
        {
            id: rectTwo
            x: scene.height/2+200
            y: scene.width/2
            width: 50
            height: 50
            border.color: "black"
            border.width: 3
            radius: 5
            Text {
                id: nameRightRect
                anchors.centerIn: parent
                text: qsTr("back")
            }
            MouseArea{
                anchors.fill: parent
                onClicked: scene.state = "toLeftRect"

            }
        }
        Rectangle
        {
            id: rectRed
            x: rectOne.x+3
            y: rectOne.y+3
            width: 44
            height: 44
            color: "red"
            radius: 5
        }
        states:[
            State {
                name: "fromCurrPos"
                PropertyChanges {
                    target: rectRed
                    x: rectRed.x

                }
                    },
            State {
                name: "toLeftRect"
                PropertyChanges {
                    target: rectRed
                    x: rectOne.x+3

                }
            }

        ]

        transitions: [
            Transition {
                from: "fromCurrPos"
                to: "toLeftRect"
                NumberAnimation
                {
                    properties:"x,y"
                    duration: 500
                    easing.type: Easing.OutBounce
                }

            }
        ]
    }

}
