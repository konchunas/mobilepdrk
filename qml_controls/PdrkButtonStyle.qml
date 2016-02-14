import QtQuick.Controls.Styles 1.4
import QtQuick 2.0

ButtonStyle
{
    background:
        Rectangle
        {
            implicitWidth: 50
            implicitHeight: 25
            color: control.activeFocus ? "#111" : "#333"
            border.width: control.activeFocus ? 2 : 1
            radius: 4
        }

}
