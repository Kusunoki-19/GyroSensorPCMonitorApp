cmake_minimum_required(VERSION 3.16)

project(PCMonitorApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

find_package(Qt6 REQUIRED COMPONENTS SerialPort)
target_link_libraries(PCMonitorApp PRIVATE Qt6::SerialPort)

qt_add_executable(appLogMemoApp
    main.cpp
    SerialPortWrapper.h
    SerialPortWrapper.cpp
)

qt_add_qml_module(appLogMemoApp
    URI LogMemoApp
    VERSION 1.0
    QML_FILES main.qml
    QML_FILES DataGraphMonitor.qml
)

set_target_properties(appLogMemoApp PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(appLogMemoApp
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(appLogMemoApp
    PRIVATE Qt6::Quick)
