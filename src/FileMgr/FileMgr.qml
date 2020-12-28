import QtQuick 2.9
import "qrc:/common/commonUI/"
import "qrc:/JSFunction.js" as JsFunc

//文件管理模块主界面
Item {
    id:root;

    function back() {
        return true;
    }

    function initData() {

    }

    Column {
        id: col;
        anchors.top: parent.top;
        anchors.topMargin: 5*pixelRate;
        anchors.left: parent.left;
        anchors.leftMargin: 5*pixelRate;
        spacing: 10*pixelRate

        YLBComboBox {
            id: modelDirBox;
            width: updateBtn.width;
            height: updateBtn.height;
            model: ["模板目录", "数据目录", "报告目录", "U盘目录"];
        }

        YLBButton {
            id: copyBtn
            width: updateBtn.width;
            text: qsTr("复制");
        }

        YLBButton {
            id: pasteBtn
            width: updateBtn.width;
            text: qsTr("粘贴");
        }

        YLBButton {
            id: removeBtn
            width: updateBtn.width;
            text: qsTr("删除");
        }

        YLBButton {
            id: updateBtn
            text: qsTr("软件更新");
        }
    }

    Rectangle {
        id: dirRect;
        radius: 10*pixelRate;
        border.width: 1;
        border.color: "lightgray";

        anchors.top: parent.top;
        anchors.topMargin: 5*pixelRate;
        anchors.left: col.right;
        anchors.leftMargin: 5*pixelRate;
        anchors.right: parent.right;
        anchors.rightMargin: 5*pixelRate;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 5*pixelRate;
    }
}
