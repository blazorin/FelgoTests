import Felgo 3.0
import QtQuick 2.0
import "pages"
import "helper"

App {
    id: app

    // It is hidden by default and will overlay the QML items below if shown
    PluginMainItem {
        id: pluginMainItem
        z: 1           // display the plugin example above other items in the QML code below
        visible: false // set this to true to show the plugin example

        // keep only one instance of these plugin-pages alive within app
        // this prevents crashes due to destruction of plugin items when popping pages from the stack
        property alias soomlaPage: soomlaPage
        property alias facebookPage: facebookPage

        SoomlaPage {
            id: soomlaPage
            visible: false
            onPushed: soomlaPage.listView.contentY = soomlaPage.listView.originY
            onPopped: { soomlaPage.parent = pluginMainItem; visible = false }
        }

        FacebookPage {
            id: facebookPage
            visible: false
            onPopped: { facebookPage.parent = pluginMainItem; visible = false }
        }
    }

    PropertyCrossMainItem { } // Main initializator



}
