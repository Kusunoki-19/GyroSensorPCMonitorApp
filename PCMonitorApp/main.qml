import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15

import SerialComponents 1.0

import QtQuick3D 1.15


Window {
    id: window
    width: 640
    height: 640
    visible: true
    color: "black"

    Rectangle {
        color:"green"
        anchors.fill:parent

        // 3Dモデルを置く場所& 2Dで映し出すレイヤ-.
        View3D {
            id: view
            anchors.fill: parent
            camera: camera
            renderMode: View3D.Overlay

            PerspectiveCamera {
                id: camera
                position: Qt.vector3d(cameraControl.curX, cameraControl.curY, cameraControl.curZ)
//                eulerRotation.x: -45
//                eulerRotation.y:
            }

            DirectionalLight {
                eulerRotation.x: -30
            }

            Model {
                id: cube
                visible: true
                position: Qt.vector3d(0, 0, 0)
                source: "#Cube"
                materials: [ DefaultMaterial {
                        //         diffuseMap: Texture {
                        //             id: texture
                        //             sourceItem: qt_logo
                        //         }
                    }
                ]
                rotation: Qt.quaternion(qControl.curW, qControl.curX, qControl.curY, qControl.curZ)

            }
        }

        // 触る所.
        Column {
            FourAxisController {
                id:qControl
            }
            FourAxisController {
                id:cameraControl
                stepSize:10
                to:200
                from:-200
            }

        }

    }
}
/*
Window {
    id: window
    width: 640
    height: 640
    visible: true
    color: "black"


    View3D {
        id: view
        anchors.fill: parent
        camera: camera
        renderMode: View3D.Overlay

        PerspectiveCamera {
            id: camera
            position: Qt.vector3d(0, 200, 300)
            eulerRotation.x: -30
        }
        Model {
            id: cube
            visible: true
            position: Qt.vector3d(0, 0, 0)
            source: "#Cube"
            materials: [ DefaultMaterial {
                    diffuseMap: Texture {
                        id: texture
                        sourceItem: qt_logo
                    }
                }
            ]
        }
    }

}
*/
