import QtQuick 2.9
import ELABSysPackage 1.0
import "qrc:/common/commonUI/"
import "qrc:/JSFunction.js" as JsFunc

//曲线模块主界面
Item {
    id:root;

    function back() {
        return true;
    }

    function initData() {

    }

    Flickable {
        id: flick
        width: col.width;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        anchors.leftMargin: 5*pixelRate;
        contentWidth: col.width;
        contentHeight: col.height
        clip: true;

        Column {
            id: col;
            spacing: 5*pixelRate

            YLBText {
                id: lineTypeText;
                text: qsTr("曲线类型");
                color: "blue";
            }

            MyRadioButton {
                id: originRadio;
                width: analysisBtn.width
                text: qsTr("原始曲线");
                checked: true;
            }

            MyRadioButton {
                id: expandRadio;
                width: analysisBtn.width
                text: qsTr("扩增曲线");
            }

            YLBText {
                id: lineColorText;
                text: qsTr("曲线颜色");
                color: "blue";
            }

            MyRadioButton {
                id: projectColorRadio;
                width: analysisBtn.width
                text: qsTr("按项目颜色");
                checked: true;
            }

            MyRadioButton {
                id: sampleColorRadio;
                width: analysisBtn.width
                text: qsTr("按样板颜色");
            }

            YLBText {
                id: selectChannelText;
                text: qsTr("选择通道");
                color: "blue";
            }

            YLBCheckBox {
                id: famCheck;
                text: qsTr("FAM")
            }

            YLBCheckBox {
                id: vicCheck;
                text: qsTr("VIC")
            }

            YLBButton {
                id: analysisBtn
                text: qsTr("分析参数");
            }

            YLBButton {
                id: showBtn
                text: qsTr("显示孔位");
            }
        }
    }

    //曲线
    Rectangle {
        id:wbccol;
        anchors.top: parent.top;
        anchors.topMargin: 5*pixelRate;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 5*pixelRate;
        anchors.left: flick.right;
        anchors.leftMargin: 5*pixelRate;
        anchors.right: parent.right;
        anchors.rightMargin: 5*pixelRate;
        radius: 10*pixelRate;
        color: "#B5C7DE";

        //图表
        CustomHistogramItem {
            id: wbcHistogram;
            width: parent.width-20*pixelRate;
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top;
            anchors.topMargin: 10*pixelRate;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 10*pixelRate;
        }
    }
}
