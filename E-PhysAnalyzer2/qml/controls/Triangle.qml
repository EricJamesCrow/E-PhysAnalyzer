import QtQuick 2.4


Canvas {
              id: triangle
              antialiasing: true

              property int triangleWidth: 15 * scaleFactor
              property int triangleHeight: 15 * scaleFactor
              property color strokeStyle:  "#ffffff"
              property color fillStyle: "#ffffff"
              property int lineWidth: 3 * scaleFactor
              property bool fill: false
              property bool stroke: true
              property real alpha: 1.0
              states: [
                  State {
                      name: "pressed"; when: ma1.pressed
                      PropertyChanges { target: triangle; fill: true; }
                  }
              ]

              onLineWidthChanged:requestPaint();
              onFillChanged:requestPaint();
              onStrokeChanged:requestPaint();

              signal clicked()

              onPaint: {
                  var ctx = getContext("2d");
                  ctx.save();
                  ctx.clearRect(0,0,triangle.width, triangle.height);
                  ctx.strokeStyle = triangle.strokeStyle;
                  ctx.lineWidth = triangle.lineWidth
                  ctx.fillStyle = triangle.fillStyle
                  ctx.globalAlpha = triangle.alpha
                  ctx.lineJoin = "round";
                  ctx.beginPath();

                  // put rectangle in the middle
                  ctx.translate( (0.5 *width - 0.5*triangleWidth), (0.5 * height - 0.5 * triangleHeight))

                  // draw the rectangle
                  ctx.moveTo(0,triangleHeight/2 ); // left point of triangle
                  ctx.lineTo(triangleWidth, 0);
                  ctx.lineTo(triangleWidth,triangleHeight);

                  ctx.closePath();
                  if (triangle.fill)
                      ctx.fill();
                  if (triangle.stroke)
                      ctx.stroke();
                  ctx.restore();
              }
              MouseArea{
                  id: ma1
                  anchors.fill: parent
                  onClicked: parent.clicked()
              }
}
