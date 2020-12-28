import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

WholeCover
{
    id: topMessage;

    property alias text: messagetext.text;
    property bool waiting: false;

    visible: false;

    onMyClicked:
    {
        if(waiting === false)
        {
            visible = false;
        }
    }
    function showMessage(value)
    {
        waiting = false;
        text = value;
        visible = true;
        closeHintTimer.running = true;
    }
    function showWaiting(value)
    {
        closeHintTimer.running = false;
        waiting = true;
        text = value;
        visible = true;
    }
    function hide()
    {
        topMessage.visible = false;
        topMessage.waiting = false;
    }

    // 用于关闭提示窗口的定时器
    Timer
    {
        id: closeHintTimer;

        interval: 3000;
        repeat: false;

        onTriggered:
        {
            topMessage.hide();
        }
    }

    Rectangle
    {
        id: messageRec;
        anchors.centerIn: parent;
        height: row.height + 20 * pixelRate;
        width: parent.width/3;

        radius: 3 * pixelRate;

        Row
        {
            id: row;
            anchors.centerIn: parent;
            spacing: 5 * pixelRate;

            BusyIndicator
            {
                id: busy;

                running: topMessage.waiting;

                visible: topMessage.waiting;
                anchors.verticalCenter: parent.verticalCenter;
                height: 35 * pixelRate;
                width: 35 * pixelRate;
                style: BusyIndicatorStyle{
                    indicator: Image{
                        visible: control.running
                        source: "qrc:/image/image/login/load.png";
                        RotationAnimator on rotation {
                            running: control.running
                            loops: Animation.Infinite
                            duration: 1000
                            from: 0 ; to: 360
                        }
                    }
                }
            }
            YLBText
            {
                id: messagetext;
                color:"blue";
                width: messageRec.width - 20 * pixelRate - (busy.visible ? busy.width : 0);
                wrapMode: Text.WrapAnywhere;
                horizontalAlignment: Text.AlignHCenter;
                anchors.verticalCenter: parent.verticalCenter;
                font.pixelSize: 13*pixelRate;
            }
        }
    }
}
