import QtQuick 2.9

Rectangle {
    id: btn

    property alias text: desc.text;

    gradient: Gradient {
        GradientStop{ position: 0.0; color: "#ADD8E6" }
        GradientStop{ position: 1.0; color: "#4682B4" }
    }

    signal clicked();

    width: desc.width*2.5;
    height: desc.height*2;

    border.width: 2;
    border.color: "#00BFFF";
    radius: 10*pixelRate;
    opacity: btnMouse.pressed? 0.7:1.0;

    YLBText {
        id: desc;
        color: "white";
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: parent;
        font.bold: true;
    }

    MouseArea {
        id: btnMouse
        anchors.fill: parent
        onClicked:{
            btn.clicked()
        }
    }
}
