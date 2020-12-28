import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import "qrc:/common/commonUI/"
import ELABSysPackage 1.0

//程序主窗口
Window {
    id:mainwindow

    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("H-800PLUS")

    property var powerOnSelfTestForm: null;

    Component.onCompleted: {
        showMaximized();
    }

    Component.onDestruction: {
        if(powerOnSelfTestForm !== null) {
            powerOnSelfTestForm.destroy();
        }
    }

    //系统自检
    function moveToPowerOnSelfTest() {
        if(null === powerOnSelfTestForm) {
            var com = Qt.createComponent("qrc:/PowerOnSelfTest.qml");
            if(com.status === Component.Ready){
                powerOnSelfTestForm = com.createObject();
            } else {
                console.debug("error", com.errorString());
            }
            com.destroy();
        }

        if(null !== powerOnSelfTestForm) {
            mainStackView.push(powerOnSelfTestForm);
            powerOnSelfTestForm.initData();
        }
    }

    //主界面
    StackView {
        id: mainStackView;
        focus: true;
        anchors.fill: parent;
        initialItem: Initializing {
            id: initializing;
            onFinished: {
                moveToPowerOnSelfTest();
            }
        }

        onCurrentItemChanged: {
            currentItem.focus = true;
        }
    }

    TopMessage {
        id:topMessage
    }

    MessageBox {
        id:messageBox
    }
}
