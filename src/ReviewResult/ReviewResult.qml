import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "qrc:/common/commonUI/"

//样本模块主界面
Item {
    id:root;

    property var legendName:[qsTr("未知"), qsTr("阴性"), qsTr("阳性"), qsTr("标准品")]
    property var legendColor:["blue", "black", "red", "orange"]

    Component.onDestruction: {

    }

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
            id: projectSetBtn;
            text: qsTr("项目设置");
        }

        YLBButton {
            id: sampleSetBtn;
            text: qsTr("样本设置");
        }

        YLBButton {
            id: removeSetBtn;
            text: qsTr("删除设置");
        }
    }

    Row {
        id: checkRow
        anchors.left: parent.left;
        anchors.leftMargin: 10*pixelRate;
        anchors.right: parent.right;
        anchors.rightMargin: 10*pixelRate;
        anchors.top: btnRow.bottom;
        anchors.topMargin: 10*pixelRate;
        spacing: 8*pixelRate;

        MyRadioButton {
            id: unknownRadio;
            width: parent.width/8
            text: qsTr("未知");
        }

        MyRadioButton {
            id: negativeRadio;
            width: parent.width/8
            text: qsTr("阴性");
        }

        MyRadioButton {
            id: positiveRadio;
            width: parent.width/8
            text: qsTr("阳性");
        }

        MyRadioButton {
            id: standardRadio;
            width: parent.width/8
            text: qsTr("标准品");
        }

        YLBInput1 {
            id: input
            width: parent.width/6;
            height:okBtn.height;
        }

        YLBButton {
            id: okBtn;
            text: qsTr("确认");
        }
    }

    Row {
        id: row;
        anchors.left: parent.left;
        anchors.leftMargin: 10*pixelRate;
        anchors.right: parent.right;
        spacing: 1*pixelRate;

        anchors.top: checkRow.bottom;
        anchors.topMargin: 10*pixelRate;

        Repeater {
            id: repeater
            model: 8;
            Rectangle {
                id: cellRect;
                width: (root.width-25*pixelRate)/8;
                height: (root.height - bottomItem.height - checkRow.height - btnRow.height)*0.7;
                border.width: 1;
                border.color: "lightgreen";

                Item {
                    id: numItem;
                    width: parent.width;
                    height: parent.height/4

                    YLBText {
                        id: numText;
                        text: qsTr("%1").arg(index+1)
                        anchors.centerIn: parent;
                    }
                }

                Rectangle {
                    id: line
                    width: parent.width;
                    height: 1;
                    color: "lightblue";
                    anchors.top: numItem.bottom;
                }

                Item {
                    id: sampleItem;
                    width: parent.width;
                    anchors.top: line.bottom;
                    anchors.bottom: parent.bottom;

                    Column {
                        id: sampleCol
                        anchors.centerIn: parent;
                        spacing: 5*pixelRate;

                        YLBText {
                            id: sampleText;
                            text: qsTr("样本:")
                            width: sampleItem.width;
                            color: "blue";
                            font.bold: true;
                        }

                        YLBText {
                            id: projectText
                            text: qsTr("项目:");
                            width: sampleItem.width;
                            color: "blue";
                            font.bold: true;
                        }
                    }
                }
            }
        }
    }

    Item {
        id: bottomItem;
        anchors.left: parent.left;
        anchors.leftMargin: 10*pixelRate;
        anchors.right: parent.right;
        anchors.rightMargin: 10*pixelRate;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 10*pixelRate;
        height: legendRow.height + 10*pixelRate;

        Row {
            id: legendRow;
            anchors.centerIn: parent;
            spacing: 3*pixelRate;

            Repeater {
                id: legendRepeater
                model: legendName.length;
                Item {
                    id: legendItem
                    width: legendRect.width + legendText.width + 3*pixelRate;
                    height: legendRect.height;
                    Rectangle {
                        id: legendRect;
                        width: legendText.height;
                        height: width;
                        color: legendColor[index];
                    }

                    YLBText {
                        id: legendText
                        text: legendName[index];
                        anchors.left: legendRect.right;
                        anchors.leftMargin: 3*pixelRate;
                    }
                }
            }
        }
    }
}
