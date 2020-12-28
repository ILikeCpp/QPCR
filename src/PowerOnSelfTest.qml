import QtQuick 2.9
import QtQuick.Controls 2.2
import "qrc:/common/commonUI/"

//开机自检
Item {
    id:root;

    property var loginForm: null;
    property var mainForm: null;

    Component.onDestruction: {
        if(loginForm !== null) {
            loginForm.signal_loginSucess.disconnect(slot_loginSucess);
            loginForm.destroy();
        }

        if(mainForm !== null) {
            mainForm.destroy();
        }
    }

    function initData() {

    }

    //进入主界面
    function moveToMainForm() {
        if(null === mainForm){
            var com = Qt.createComponent("qrc:/MainForm.qml");
            if(com.status === Component.Ready){
                mainForm = com.createObject();
            }else{
                console.debug("error", com.errorString());
            }
            com.destroy();
        }

        if(null !== mainForm) {
            mainStackView.push(mainForm);
            mainForm.initData();
        }
    }

    Image {
        anchors.fill: parent;
        fillMode: Image.PreserveAspectCrop;
        source: "qrc:/image/image/mainForm.png";
    }

    //模拟自检
    Timer {
        id:timer
        interval: 100;
        repeat: true;
        running: true;
        property int times: 0;
        onTriggered: {
            if(times < 10){
                progressBar.value += 10;
                times++;
            }else{
                timer.running = false;
                timer.repeat = false;
                times = 0;

                moveToMainForm();
            }
        }
    }

    //进度详情内容
    YLBText {
        id:progressDesc
        text: qsTr("系统初始化")
        color: "white";
        font.pixelSize: 15*pixelRate;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: parent.height*0.15;
    }

    //进度条
    ProgressBar {
        id: progressBar;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: progressDesc.bottom;
        anchors.topMargin: 10*pixelRate;

        from: 0;
        to: 100;
        value: 0;
//        indeterminate: true;

        background: Rectangle {
            implicitWidth: root.width*2/3
            implicitHeight: 10*pixelRate
            color: "white"
            radius: 3*pixelRate;
        }

        contentItem: Item {
            implicitWidth: root.width*2/3
            implicitHeight: 8*pixelRate;

            Rectangle {
                width: progressBar.visualPosition * parent.width
                height: parent.height
                radius: 2
                color: "#43CD80"
            }
        }
    }
}
