import QtQuick 2.9
import "qrc:/common/commonUI/"

//开机初始化界面
Rectangle {
    id: rect
    color: "lightblue";

    signal finished();

    property bool initOk: false;

    Component.onCompleted: {
        busy.running = true;
        initData();
    }

    Component.onDestruction: {

    }

    function initData() {
        initOk = true;
    }

    Column {
        id: item;
        width: parent.width/4;
        anchors.centerIn: parent;

        Busying {
            id:busy;
            width: parent.width;
            property bool busyEnd: false;
            Timer {
                id:timer;
                interval: 300;
                running: busy.running;
                repeat: false;
                onTriggered: {
                    if(initOk === true) {
                        busy.running = false;
                        finished();
                    }
                    busy.busyEnd = true;
                }
            }
        }

        YLBText {
            id: initializingText;
            text: qsTr("正在初始化...");
            font.pixelSize: 15*pixelRate;
            width: parent.width;
            horizontalAlignment: Text.AlignHCenter;
        }
    }
}
