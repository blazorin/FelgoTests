import QtQuick 2.0
import Felgo 3.0
import "pages/Native"
import "model"

// Many logic here

Item {

    anchors.fill: parent

    Logic {
        id: logic
    }

    DataModel {
        id: dataModel
        dispatcher: logic
    }

    PropertyCrossMainPage {

    }

}
