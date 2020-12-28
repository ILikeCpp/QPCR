import QtQuick 2.9
import QtGraphicalEffects 1.0
import "qrc:/JSFunction.js" as JsFunc

Rectangle {
    id: root;

    property alias text: btnText.text
    property bool selected: false;

    signal clicked();

    border.color: selected ? JsFunc.backgroundColor : "#6C9CCD"
    implicitWidth: Math.max(btnText.width + 4*pixelRate, 100*pixelRate)
    implicitHeight: 30*pixelRate;
    radius: 5*pixelRate;

    opacity: mos.pressed? 0.5 : 1

    Rectangle {
        id: background;
        anchors.fill: parent;

        gradient: Gradient {
            GradientStop { position: 0.0; color: selected ? JsFunc.backgroundColor:"#C4D9EE" }
            GradientStop { position: 0.5; color: selected ? JsFunc.backgroundColor:"#6C9CCD" }
            GradientStop { position: 1.0; color: selected ? JsFunc.backgroundColor:"#C4D9EE" }
        }

        radius: 5*pixelRate;
    }

    //阴影效果
    DropShadow {
        anchors.fill: background
        horizontalOffset: 1
        verticalOffset: 3
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: background
    }

    Text {
        id: btnText
        anchors.centerIn: parent
        color: selected ? "black" : "white"
        font.bold: selected ? true:false;
    }

    MouseArea {
        id: mos;
        anchors.fill: parent;
        onClicked: {
            root.clicked();
        }
    }
}
