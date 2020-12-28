import QtQuick 2.9
import QtQuick.Controls 2.2
import ELABSysPackage 1.0
import "qrc:/common/commonUI/"

//样本分析模块主界面
Item {
    id:root;

    property var titleList: [qsTr("实验名称"),qsTr("实验人员"),qsTr("实验日期"),qsTr("试剂体积")];

    property var values:["111","222","333","444"];
    property int count: 0;

    Component.onCompleted: {

    }

    Component.onDestruction: {

    }

    function back() {
        return true;
    }

    function initData() {
        root.count = 0;
        root.count = titleList.length;
    }

    Column {
        id: col;
        width: parent.width/2;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        anchors.topMargin: 40*pixelRate;
        spacing: 20*pixelRate;

        Repeater {
            id: repeater;
            model: root.count;

            delegate: YLBInput {
                id: inoput;
                width: col.width;
                title: titleList[index];
                showUnit: false;
                unit: "";

                Component.onCompleted: {
                    if(index < values.length){
                        inoput.text = values[index];
                    }
                }

                onTextChanged: {
                    values[index] = text;
                }
            }
        }
    }
}
