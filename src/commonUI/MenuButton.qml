import QtQuick 2.9
import "qrc:/common/commonUI/"
import QtGraphicalEffects 1.0

Rectangle {
    id:root;
    width: 100*pixelRate;
    height: col.height+10*pixelRate;

    property alias image_source: image.source;
    property alias text: content.text;

    property string c1: "#3EB5F3";
    property string c2: "#2492CF";
    property string c3:"#56CCFE";
    property bool showBorder: false;
    property alias textColor: content.color;

    signal clicked();

    //背景
    Rectangle {
        id:background
        anchors.fill: parent;
        gradient: Gradient {
            GradientStop{ position: 0.0; color: c1 }
            GradientStop{ position: 1.0; color: c2 }
        }
        border.width: showBorder? 2:0;
        border.color: "#6FBCE6"
        radius: 10*pixelRate;
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

    Column {
        id: col;
        anchors.centerIn: parent;

        //图片
        Image {
            id:image
            source: "qrc:/image/image/login/user.png";
            sourceSize: Qt.size(30*pixelRate,30*pixelRate);
            fillMode: Image.PreserveAspectFit;
            anchors.horizontalCenter: parent.horizontalCenter;
        }

        //文字
        YLBText {
            id: content
            color: /*"#54AED6"*/"white";
            font.bold: true;
            anchors.horizontalCenter: parent.horizontalCenter;
        }
    }

    MouseArea{
        id:mos;
        anchors.fill: parent;
        onClicked: {
            root.clicked();
        }
    }
}
