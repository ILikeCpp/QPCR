import QtQuick 2.9

Item {
    id:root;
    width: 100*pixelRate;
    height: inputRect.height;

    property alias title: title.text;
    property alias text: input.text;
    property bool showUnit: true;
    property alias unit: unitText.text;
    property alias unitFontSize: unitText.font.pixelSize;
    property alias titleWidth: title.width;
    property alias validator: input.validator;
    property alias maximumLength: input.maximumLength;
    property alias desc: descText.text;
    property bool fullScreenMode: false;

    signal inputFocus();

    //标题
    YLBText {
        id:title;
        text: qsTr("标题");
        anchors.left: parent.left;
        width: parent.width/4;
        anchors.verticalCenter: parent.verticalCenter;
    }

    //输入框
    Rectangle {
        id:inputRect;
        anchors.left: title.right;
        anchors.leftMargin: 5*pixelRate;
        anchors.right: unitText.left;
        anchors.rightMargin: showUnit? 5*pixelRate:0;
        height: input.height + 10*pixelRate;
        border.width: 1;
        border.color: enabled? "lightsteelblue" : "lightgray";
        clip: true;
        radius: 10*pixelRate;

        YLBText {
            id:descText;
            anchors.centerIn: parent;
            visible: input.text.length === 0;
            color: "lightgray";
        }

        TextInput {
            id:input;
            enabled: root.enabled;
            anchors.left: parent.left;
            anchors.leftMargin: 5*pixelRate;
            anchors.right: parent.right;
            anchors.rightMargin: 5*pixelRate
            anchors.verticalCenter: parent.verticalCenter;
            font.family: title.font.family;
            selectByMouse: true;
            verticalAlignment: Text.AlignVCenter;
            horizontalAlignment: Text.AlignHCenter;

            onFocusChanged: {
                if(focus){
                    inputFocus();

                    if(fullScreenMode) {
                        root_com.fullScreenMode = true;
                    }else{
                        root_com.fullScreenMode = false;
                    }
                }
            }
        }
    }

    //单位
    YLBText {
        id:unitText
        anchors.right: parent.right;
        width: showUnit? parent.width*0.2 : 0;
        anchors.verticalCenter: parent.verticalCenter;
    }
}
