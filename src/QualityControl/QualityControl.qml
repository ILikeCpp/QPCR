import QtQuick 2.9
import "qrc:/common/commonUI/"
import "qrc:/JSFunction.js" as JsFunc

//质控模块主界面
Item {
    id:root;

    function back() {
        return true;
    }

    function initData() {

    }

    Row {
        id: btnRow
        anchors.left: parent.left;
        anchors.leftMargin: 10*pixelRate;
        anchors.top: parent.top;
        anchors.topMargin: 10*pixelRate
        spacing: 10*pixelRate;

        YLBButton {
            id: addTemperatureBtn;
            text: qsTr("添加恒温段");
        }

        YLBButton {
            id: addCirculationBtn;
            text: qsTr("添加循环段");
        }

        YLBButton {
            id: addNodeBtn;
            width: addTemperatureBtn.width;
            text: qsTr("添加节");
        }

        YLBButton {
            id: removeBtn;
            width: addTemperatureBtn.width;
            text: qsTr("删除");
        }
    }
}
