import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "qrc:/common/commonUI/"
import "qrc:/SampleAnalysis/"
import "qrc:/ReviewResult/"
import "qrc:/QualityControl/"
import "qrc:/Service/"
import "qrc:/Setting/"
import "./JSFunction.js" as JsFunc

//程序主界面
Item {
    id:root;

    property int currentIndex: -1;
    property var sampleAnalysisForm: null; //属性
    property var reviewResultForm: null; //样本
    property var qualityControlForm: null; //程序
    property var serviceForm: null; //曲线
    property var settingForm: null; //数据
    property var fileMgrForm: null; //文件管理

    property var popSingleSelectForm: null; //弹出选择框

    Component.onDestruction: {
        if(sampleAnalysisForm !== null) {
            sampleAnalysisForm.destroy();
        }

        if(reviewResultForm !== null) {
            reviewResultForm.destroy();
        }

        if(qualityControlForm !== null) {
            qualityControlForm.destroy();
        }

        if(serviceForm !== null) {
            serviceForm.destroy();
        }

        if(settingForm !== null) {
            settingForm.destroy();
        }

        if(popSingleSelectForm !== null) {
            popSingleSelectForm.destroy();
        }

        if(fileMgrForm !== null) {
            fileMgrForm.destroy();
        }
    }

    function initData() {
        currentIndex = 0;
    }

    onCurrentIndexChanged: {
        switch(currentIndex){
        case 0:
            moveToSampleAnalysis();
            break;
        case 1:
            moveToReviewResult();
            break;
        case 2:
            moveToQualityControl();
            break;
        case 3:
            moveToService();
            break;
        case 4:
            moveToSetting();
            break;
        case 5:
            moveToFileMgr();
            break;
        }
    }

    //属性
    function moveToSampleAnalysis() {
        if(null === sampleAnalysisForm) {
            var com = Qt.createComponent("qrc:/SampleAnalysis/SampleAnalysis.qml");
            if(com.status === Component.Ready){
                sampleAnalysisForm = com.createObject(baseForm);
                sampleAnalysisForm.anchors.fill = baseForm;
                sampleAnalysisForm.visible = Qt.binding(function(){return currentIndex === 0;})
            } else {
                console.debug("error", com.errorString());
            }
            com.destroy();
        }

        if(null !== sampleAnalysisForm) {
            sampleAnalysisForm.initData();
        }
    }

    //样本
    function moveToReviewResult() {
        if(null === reviewResultForm) {
            var com = Qt.createComponent("qrc:/ReviewResult/ReviewResult.qml");
            if(com.status === Component.Ready) {
                reviewResultForm = com.createObject(baseForm);
                reviewResultForm.anchors.fill = baseForm;
                reviewResultForm.visible = Qt.binding(function(){return currentIndex === 1;})
            } else {
                console.debug("error", com.errorString());
            }
            com.destroy();
        }

        if(null !== reviewResultForm) {
            reviewResultForm.initData();
        }
    }

    //程序
    function moveToQualityControl() {
        if(null === qualityControlForm) {
            var com = Qt.createComponent("qrc:/QualityControl/QualityControl.qml");
            if(com.status === Component.Ready){
                qualityControlForm = com.createObject(baseForm);
                qualityControlForm.anchors.fill = baseForm;
                qualityControlForm.visible = Qt.binding(function(){return currentIndex === 2;})
            } else {
                console.debug("error", com.errorString());
            }
            com.destroy();
        }

        if(null !== qualityControlForm) {
            qualityControlForm.initData();
        }
    }

    //曲线
    function moveToService() {
        if(null === serviceForm) {
            var com = Qt.createComponent("qrc:/Service/Service.qml");
            if(com.status === Component.Ready) {
                serviceForm = com.createObject(baseForm);
                serviceForm.anchors.fill = baseForm;
                serviceForm.visible = Qt.binding(function(){return currentIndex === 3;})
            } else {
                console.debug("error", com.errorString());
            }
            com.destroy();
        }

        if(null !== serviceForm) {
            serviceForm.initData();
        }
    }

    //数据
    function moveToSetting() {
        if(null === settingForm) {
            var com = Qt.createComponent("qrc:/Setting/Setting.qml");
            if(com.status === Component.Ready) {
                settingForm = com.createObject(baseForm);
                settingForm.anchors.fill = baseForm;
                settingForm.visible = Qt.binding(function(){return currentIndex === 4;})
            } else {
                console.debug("error", com.errorString());
            }
            com.destroy();
        }

        if(null !== settingForm) {
            settingForm.initData();
        }
    }

    //文件管理
     function moveToFileMgr()
     {
         if(null === fileMgrForm) {
             var com = Qt.createComponent("qrc:/FileMgr/FileMgr.qml");
             if(com.status === Component.Ready) {
                 fileMgrForm = com.createObject(baseForm);
                 fileMgrForm.anchors.fill = baseForm;
                 fileMgrForm.visible = Qt.binding(function(){return currentIndex === 5;})
             } else {
                 console.debug("error", com.errorString());
             }
             com.destroy();
         }

         if(null !== fileMgrForm) {
             fileMgrForm.initData();
         }
     }

    //菜单栏
    Rectangle {
        id: menuRect
        width: parent.width;
        height: menuRow.height + 10*pixelRate;
        color: "#F5F5F5";

        RowLayout {
            id:menuRow
            width: menuRect.width-10*pixelRate
            anchors.centerIn: parent;
            spacing: 10*pixelRate;

            MenuButton {
                id:ybfxBtn;
                text: qsTr("属性");
                image_source: "qrc:/image/image/menu/shuxing.png";
                Layout.fillWidth: true;

                c1: currentIndex === 0? "#F3F3F3":"#8DD2F8"
                c2: currentIndex === 0? "#E1E1E1":"#2492CF"
                c3: currentIndex === 0? "#CBCBCC":"#56CCFE"
                textColor: currentIndex === 0? "#2492CF":"white"
                showBorder: currentIndex === 0;

                onClicked: {
                    currentIndex = 0;
                }
            }

            MenuButton {
                id:lbhgBtn;
                text: qsTr("样本");
                image_source: "qrc:/image/image/menu/yangben.png";
                Layout.fillWidth: true;

                c1: currentIndex === 1? "#F3F3F3":"#8DD2F8"
                c2: currentIndex === 1? "#E1E1E1":"#2492CF"
                c3: currentIndex === 1? "#CBCBCC":"#56CCFE"
                textColor: currentIndex === 1? "#2492CF":"white"
                showBorder: currentIndex === 1;

                onClicked: {
                    currentIndex = 1;
                }
            }

            MenuButton {
                id:zkBtn;
                text: qsTr("程序");
                image_source: "qrc:/image/image/menu/chengxu.png";
                Layout.fillWidth: true;

                c1: currentIndex === 2? "#F3F3F3": "#8DD2F8"
                c2: currentIndex === 2? "#E1E1E1":"#2492CF"
                c3: currentIndex === 2? "#CBCBCC":"#56CCFE"
                textColor: currentIndex === 2? "#2492CF":"white"
                showBorder: currentIndex === 2;

                onClicked: {
                    currentIndex = 2;
                }
            }

            MenuButton {
                id:fwBtn;
                text: qsTr("曲线");
                image_source: "qrc:/image/image/menu/quxian.png";
                Layout.fillWidth: true;

                c1: currentIndex === 3? "#F3F3F3":"#8DD2F8"
                c2: currentIndex === 3? "#E1E1E1":"#2492CF"
                c3: currentIndex === 3? "#CBCBCC":"#56CCFE"
                textColor: currentIndex === 3? "#2492CF":"white"
                showBorder: currentIndex === 3;

                onClicked: {
                    currentIndex = 3;
                }
            }

            MenuButton {
                id:szBtn;
                text: qsTr("数据");
                image_source: "qrc:/image/image/menu/shuju.png";
                Layout.fillWidth: true;

                c1: currentIndex === 4? "#F3F3F3":"#8DD2F8"
                c2: currentIndex === 4? "#E1E1E1":"#2492CF"
                c3: currentIndex === 4? "#CBCBCC":"#56CCFE"
                textColor: currentIndex === 4? "#2492CF":"white"
                showBorder: currentIndex === 4;

                onClicked: {
                    currentIndex = 4;
                }
            }

            MenuButton {
                id:wjglBtn;
                text: qsTr("文件管理");
                image_source: "qrc:/image/image/menu/wenjian.png";
                Layout.fillWidth: true;

                c1: currentIndex === 5? "#F3F3F3":"#8DD2F8"
                c2: currentIndex === 5? "#E1E1E1":"#2492CF"
                c3: currentIndex === 5? "#CBCBCC":"#56CCFE"
                textColor: currentIndex === 5? "#2492CF":"white"
                showBorder: currentIndex === 5;

                onClicked: {
                    currentIndex = 5;
                }
            }
        }
    }

    //内容区
     Rectangle {
        id:baseRect
        anchors.top: menuRect.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: statusRect.top;
        color: JsFunc.backgroundColor;

        Column {
            id: btnCol;
            anchors.right: parent.right;
            anchors.rightMargin: 10*pixelRate;
            anchors.top: parent.top;
            anchors.topMargin: 5*pixelRate

            spacing: 5*pixelRate;

            MyToolButton {
                id: selectModelBtn;
                text: qsTr("选择模板");
            }

            MyToolButton {
                id: newLabBtn;
                text: qsTr("新建实验");
            }

            MyToolButton {
                id: openDataBtn;
                text: qsTr("打开数据");
            }

            MyToolButton {
                id: openBtn;
                text: qsTr("打开");
            }

            MyToolButton {
                id: newBtn;
                text: qsTr("新建");
            }

            MyToolButton {
                id: saveBtn;
                text: qsTr("保存");
            }

            MyToolButton {
                id: runBtn;
                text: qsTr("运行");
            }

            MyToolButton {
                id: reportBtn;
                text: qsTr("生成报告");
            }
        }

        Item {
            id: baseForm;
            anchors.left: parent.left;
            anchors.right: btnCol.left;
            anchors.rightMargin: 5*pixelRate;
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
        }
    }

    //状态栏
    Image{
        id:statusRect
        width: parent.width;
        height: 40*pixelRate;
        anchors.bottom: parent.bottom;
        source: "qrc:/image/image/statusBar.png";

        //软件版本号
        YLBText {
            id:  visionText
            text: qsTr("QPCR v1.0")
            color: "blue"
            font.pixelSize: 20*pixelRate;
            anchors.left: parent.left;
            anchors.leftMargin: 30*pixelRate;
            anchors.right: managerItem.left;
            anchors.rightMargin: 10*pixelRate
            anchors.verticalCenter: parent.verticalCenter;
        }

        //管理员
        YLBText {
            id: managerItem
            text: qsTr("当前时间:")
            anchors.right: datetimeText.left;
            anchors.rightMargin: 10*pixelRate;
            anchors.verticalCenter: parent.verticalCenter;
        }

        //系统日期时间
        YLBText {
            id: datetimeText;
            anchors.right: parent.right;
            anchors.rightMargin: 10*pixelRate;
            text: ""
            anchors.verticalCenter: parent.verticalCenter;
        }
    }
}






