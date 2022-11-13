import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle {

    Connections {
        target: backend
        function onEmitThread() {
            //             drawingCanvas.requestAnimationFrame()
            return
        }
    }


    id: welcomeToEphys
    width: 637 /** scaleFactor*/
    height: 258 /** scaleFactor*/
    visible: true
    color: "#5ac1d0"
    radius: 5 * scaleFactor


    Label {
        id: welcomeLabel
        color: "#ffffff"
        text: qsTr("WELCOME TO")
        anchors.verticalCenter: parent.verticalCenter
        font.letterSpacing: 2
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: -70
        anchors.horizontalCenterOffset: 0
        font.family: "PragmaticaLightC"
        font.pointSize: 12 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        id: ephysAnalyzerLabel
        color: "#ffffff"
        text: qsTr("E-Phys Analyzer")
        anchors.verticalCenter: parent.verticalCenter
        font.letterSpacing: 2 * scaleFactor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 24 * scaleFactor
        anchors.verticalCenterOffset: 0
        font.family: "PragmaticaLightC"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

    }

    Canvas
    {
        id: canvas
        x: 180 * scaleFactor
        //            anchors.fill: parent
        visible: false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        //            anchors.topMargin: 35
        onPaint:
        {
            var ctx = getContext("2d")
            ctx.fillStyle = "#dbbd7a";
            ctx.fill();

            var fps = 30;
            var n = 0;


            var data = [
                        150 , 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150,
                        148, 146, 144, 142, 140, 136, 134, 132, 130, 128, 124, 122, 118, 118,
                        118, 122, 124, 128, 130, 132, 134, 136, 140, 142, 144, 146,
                        148, 150, 152, 154, 156, 158, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                        160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                    160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                    160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                    160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                    160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                    160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                    160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                    1160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                   160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,
                    160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160, 160,];

            function Timer() {
                return Qt.createQmlObject("import QtQuick 2.0; Timer {}", canvas);
            }

            var timer = new Timer();
            timer.interval = 0;
            timer.repeat = false;
            timer.triggered.connect(function drawWave() {
                requestAnimationFrame(drawWave);
                ctx.lineWidth = "3";
                ctx.strokeStyle = 'white';

                // Drawing code goes here
                n += 1;
                if (n >= data.length) {
                    n = 1;
                }
                ctx.beginPath();
                ctx.moveTo((n - 1)* scaleFactor, data[n - 1]* scaleFactor);
                ctx.lineTo(n* scaleFactor, data[n]* scaleFactor);
                ctx.stroke();

                ctx.clearRect(n+1, 0, 10, canvas.height);
            })

            timer.start();
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
