/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2017 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick 2.0
import QtQuick.Controls 2.2
import Fluid.Controls 1.0 as FluidControls

ScrollView {
    Column {
        spacing: 16

        Button {
            text: qsTr("Landscape")
            onClicked: timePickerDialogLandscape.open()
        }

        Button {
            text: qsTr("Portrait")
            onClicked: timePickerDialogPortrait.open()
        }

        FluidControls.DisplayLabel {
            id: timeLabel
            level: 2
            text: qsTr("n.a.")
        }

        Switch {
            id: prefer24HourSwitch
            text: qsTr("24 hour clock")
        }

        FluidControls.TimePicker {
            orientation: FluidControls.TimePicker.Landscape
            selectedTime: new Date(1, 0, 1, 21, 12, 42)
        }

        FluidControls.TimePicker {
            orientation: FluidControls.TimePicker.Portrait
            selectedTime: new Date(1, 0, 1, 21, 12, 42)
        }
    }

    FluidControls.TimePickerDialog {
        id: timePickerDialogLandscape
        orientation: FluidControls.TimePicker.Landscape
        selectedTime: new Date(1, 0, 1, 21, 12, 42)
        prefer24Hour: prefer24HourSwitch.checked
        standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
        onAccepted: timeLabel.text = selectedTime.toLocaleTimeString(Qt.locale(), "hh:mm ap")
    }

    FluidControls.TimePickerDialog {
        id: timePickerDialogPortrait
        orientation: FluidControls.TimePicker.Portrait
        selectedTime: new Date(1, 0, 1, 21, 12, 42)
        prefer24Hour: prefer24HourSwitch.checked
        standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
        onAccepted: timeLabel.text = selectedTime.toLocaleTimeString(Qt.locale(), "hh:mm ap")
    }
}