# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo felgo-live
CONFIG+=sdk_no_version_check
QMAKE_MACOSX_DEPLOYMENT_TARGET = 11.0

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.albertoromero.prankster
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = ""

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

# RESOURCES += resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    Cpp/Http/Source/Http.cpp \
    Cpp/Http/Impl/HttpClient.cpp \
    Include/rest-cpp/src/ChunkedReaderImpl.cpp \
    Include/rest-cpp/src/ChunkedWriterImpl.cpp \
    Include/rest-cpp/src/ConnectionImpl.h \
    Include/rest-cpp/src/ConnectionPoolImpl.cpp \
    Include/rest-cpp/src/DataReaderStream.cpp \
    Include/rest-cpp/src/IoReaderImpl.cpp \
    Include/rest-cpp/src/IoWriterImpl.cpp \
    Include/rest-cpp/src/NoBodyReaderImpl.cpp \
    Include/rest-cpp/src/PlainReaderImpl.cpp \
    Include/rest-cpp/src/PlainWriterImpl.cpp \
    Include/rest-cpp/src/ReplyImpl.cpp \
    Include/rest-cpp/src/ReplyImpl.h \
    Include/rest-cpp/src/RequestBodyFileImpl.cpp \
    Include/rest-cpp/src/RequestBodyStringImpl.cpp \
    Include/rest-cpp/src/RequestImpl.cpp \
    Include/rest-cpp/src/RestClientImpl.cpp \
    Include/rest-cpp/src/SocketImpl.h \
    Include/rest-cpp/src/TlsSocketImpl.h \
    Include/rest-cpp/src/TlsSocketImpl.h \
    Include/rest-cpp/src/Url.cpp \
    Include/rest-cpp/src/url_encode.cpp

FELGO_PLUGINS += admob
FELGO_PLUGINS += soomla
FELGO_PLUGINS += facebook
FELGO_PLUGINS += onesignal
FELGO_PLUGINS += amplitude
FELGO_PLUGINS += gamecenter

CONFIG += c++17

INCLUDEPATH += Include/rest-cpp/include/
INCLUDEPATH += Include/rapidjson/

android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}

macx {
    ICON = macx/app_icon.icns

    _BOOST_PATH = /usr/local/Cellar/boost/1.78.0_1
    INCLUDEPATH += "$${_BOOST_PATH}/include/"
    LIBS += -L$${_BOOST_PATH}/lib
    LIBS += -lboost_system -lboost_thread-mt -lboost_filesystem -lboost_coroutine

    _OPENSSL_PATH = /usr/local/opt/openssl@3
    INCLUDEPATH += "$${_OPENSSL_PATH}/include/"
    LIBS += -L$${_OPENSSL_PATH}/lib
    LIBS += -lssl -lcrypto
}

DISTFILES += \
    qml/PropertyCrossMainItem.qml \
    qml/model/DataModel.qml \
    qml/model/Logic.qml \
    qml/pages/Native/ListingDetailPage.qml \
    qml/pages/Native/ListingsListPage.qml \
    qml/pages/Native/PropertyCrossMainPage.qml \
    qml/pages/Native/SearchPage.qml

HEADERS += \
    Cpp/Http/Source/Http.h \
    Cpp/Http/Impl/HttpClient.h

