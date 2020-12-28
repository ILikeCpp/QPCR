import QtQuick 2.9
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import "qrc:/common/commonUI/"
import "qrc:/JSFunction.js" as JsFunc

//设置模块主界面
Item {
    id:root;

    property string highlight: "#3333cc";

    function back() {
        return true;
    }

    function initData() {

    }

    //表格
    TableView {
        id: tableView
        anchors.left: parent.left;
        anchors.leftMargin: 5*pixelRate;
        anchors.right: parent.right;
        anchors.rightMargin: 5*pixelRate;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 5*pixelRate;
        anchors.top: parent.top;
        anchors.topMargin: 5*pixelRate;

        property int selecteRow: -1;
        property real colWidth: tableView.viewport.width/tableView.columnCount

        onClicked: {
            selecteRow = row;
            console.debug(row);
        }

        TableViewColumn {
            role: "Hole"
            title: qsTr("孔位")
            width: tableView.colWidth
            movable: false;
            resizable: false;
        }

        TableViewColumn {
            role: "SampleName"
            title: qsTr("样本名称")
            width: tableView.colWidth
            movable: false;
            resizable: false;
        }

        TableViewColumn {
            role: "SampleType"
            title: qsTr("样本类型")
            width: tableView.colWidth
            movable: false;
            resizable: false;
        }

        TableViewColumn {
            role: "ProjectName"
            title: qsTr("项目名称")
            width: tableView.colWidth
            movable: false;
            resizable: false;
        }

        TableViewColumn {
            role: "Probe"
            title: qsTr("探针")
            width: tableView.colWidth
            movable: false;
            resizable: false;
        }

        TableViewColumn {
            role: "CtValue"
            title: qsTr("Ct值")
            width: tableView.colWidth
            movable: false;
            resizable: false;
        }

        TableViewColumn {
            role: "RationValue"
            title: qsTr("定量值")
            width: tableView.colWidth
            movable: false;
            resizable: false;
        }

        TableViewColumn {
            role: "ThresholdValue"
            title: qsTr("判定阈值")
            width: tableView.colWidth
            movable: false;
            resizable: false;
        }

        TableViewColumn {
            role: "ResultValue"
            title: qsTr("判定结果")
            width: tableView.colWidth
            movable: false;
            resizable: false;
        }

        headerDelegate: Item {
            height: 30*pixelRate
            Rectangle{
                width: parent.width;
                height: parent.height
                color: "lightsteelblue";

                Text {
                    text: styleData.value
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.fill: parent
                }

                Rectangle {
                    width: styleData.column === 8? 0 : 1;
                    height: parent.height;
                    color: "white";
                    anchors.right: parent.right;
                }
            }
        }

        itemDelegate: Item {
            Text {
                anchors.fill: parent;
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
                color: styleData.selected? "white":"black"
                elide: Text.ElideRight;
                text: styleData.value
            }
        }

        rowDelegate: Rectangle{
            height: 25*pixelRate;
            color: styleData.selected? root.highlight :
                                       (styleData.alternate? "#CEDFF7" : "white")

            MouseArea {
                width: styleData.row === undefined? parent.width : 0;
                height: styleData.row === undefined? parent.height : 0;
            }
        }
    }
}
