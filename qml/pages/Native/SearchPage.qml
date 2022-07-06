import QtQuick 2.0
import Felgo 3.0

Page {
    id: searchPage
    title: qsTr("Search Cross")

    rightBarItem: NavigationBarRow {
        ActivityIndicatorBarItem {
            visible: true
            animating: false // true moves it
        }

        IconButtonBarItem {
            icon: IconType.apple
            title: qsTr("Lovin'It")
        }
    }

    Column {
        id: contentColumn
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: contentPadding
        spacing: defaultSpacing


        AppText {
            width: parent.width
            text: qsTr("This is just a video of elephants. They have a very very long trunk. That's all I have to say.")
            font.pixelSize: sp(16)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        AppText {
            width: parent.width
            text: qsTr("Elephants approaching!\nSearch 'Elephant' to discover more.")
            font.pixelSize: sp(16)
            font.italic: true
            color: Theme.secondaryTextColor
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        }

        AppTextField {
            id: searchInput
            width: parent.width
            showClearButton: true
            placeholderText: qsTr("Type here")
            inputMethodHints: Qt.ImhNoPredictiveText

            backgroundColor: searchBarBackColor
            placeholderTextColor: "#566573"
            radius: dp(20)

            onTextChanged: searchChanged()
            onEditingFinished: searchReady()

        }


        Row {

            spacing: dp(5)

            AppButton {
                text: qsTr("Go!")
                width: contentColumn.width / rowBtnFirstDivisor

                onClicked: {

                    // Http demo

                    logic.demoSignal("hola")

                    logic.demoSignalWithCallback("Hola_Callback", demoCallback)

                }

            }

            AppButton {
                id: locationButton
                text: qsTr("Find nearby.")
                enabled: true
                width: contentColumn.width / rowBtnSecondDivisor


                onClicked: {
                    searchInput.text = ""
                    searchInput.placeholderText = "Finding nearby Elephants..."
                    //searchInput.clearsOnBeginEditing = true
                    locationButton.enabled = false
                }
            }

        }

    }

    Component {
        id: listPageComponent
        ListingsListPage {}
    }


    function goSearch() {

    }

    function searchChanged() {
        console.debug("Changed: " + searchInput.text);
    }

    function searchReady() {
        console.debug("Ready to search.")
    }

    function demoCallback(resultString) {
        console.debug("Result: " + resultString)

        if (navigationStack.depth === 1)
            navigationStack.popAllExceptFirstAndPush(listPageComponent)
    }

}
