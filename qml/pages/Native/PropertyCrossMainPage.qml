import QtQuick 2.0
import Felgo 3.0

Page {

    readonly property real contentPadding: dp(Theme.navigationBar.defaultBarItemPadding)
    readonly property real defaultSpacing: dp(90)

    readonly property real rowBtnFirstDivisor: 2.8
    readonly property real rowBtnSecondDivisor: 1.6

    readonly property color searchBarBackColor: "#CCD1D1"

    useSafeArea: false

    NavigationStack {
        id: navStack

        //Split view
        leftColumnIndex: 1
        splitView: tablet

       SearchPage {}

    }

    Component.onCompleted: {
        HttpNetworkActivityIndicator.activationDelay = 0
    }

}
